function generateSQLInsertScripts() {
  const POSITIONS = {
    ADMINISTRATOR: 'administrator',
    ACCOUNTANT_HEAD: 'accountant_head',
    ACCOUNTANT: 'accountant',
    CHAIN_MANAGER: 'chain_manager',
    BRANCH_MANAGER: 'branch_manager',
    CASHIER: 'cashier',
  };

  const FEATURE_CODES = {
    ALL: ['branches', 'positions', 'roles', 'units', 'users', 'products', 'shift_reports', 'sales_channels'],
    LIMITED: ['users', 'shift_reports'],
    CASHIER: ['shift_reports']
  };

  const POSITIONS_NAME = {
    administrator: 'Quản trị viên',
    accountant_head: 'Kế toán trưởng',
    accountant: 'Kế toán',
    chain_manager: 'Quản lý chuỗi',
    branch_manager: 'Cửa hàng trưởng',
    cashier: 'Thu ngân',
  };

  const getFeatureCodesForPosition = (positionCode) => {
    if (positionCode === POSITIONS.ADMINISTRATOR) return FEATURE_CODES.ALL;
    if ([POSITIONS.ACCOUNTANT_HEAD, POSITIONS.CHAIN_MANAGER, POSITIONS.BRANCH_MANAGER].includes(positionCode)) {
      return FEATURE_CODES.LIMITED;
    }
    if (positionCode === POSITIONS.CASHIER) return FEATURE_CODES.CASHIER;
    return [];
  };

  const getCurrentTimestamp = () => `now()`;
  const createdBy = `'admin'`;
  const updatedBy = `'admin'`;
  const permission = 7;

  const escapeSingleQuotes = (str) => str.replace(/'/g, "''");

  const sql = [];

  // 1. Insert Positions (check existence)
  for (const [code, name] of Object.entries(POSITIONS_NAME)) {
    sql.push(`-- Position: ${name}`);
    sql.push(`DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = '${code}' OR name = '${name}') THEN
    INSERT INTO public.positions(
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description
    ) VALUES (
      substr(md5(random()::text), 1, 24), ${createdBy}, ${updatedBy}, ${getCurrentTimestamp()}, ${getCurrentTimestamp()}, false, '${name}', '${code}', '${name}'
    );
  END IF;
END $$;`);
  }

  // 2. Generate SQL for branches and associated roles/users
  sql.push(`-- Loop through branches`);
  sql.push(`-- For each branch, insert roles, role accesses, and users`);
  sql.push(`
DO $$
DECLARE
  branch RECORD;
  role_id TEXT;
  user_id TEXT;
BEGIN
  FOR branch IN SELECT id, name FROM public.branches LOOP
`);

  for (const [code, name] of Object.entries(POSITIONS_NAME)) {
    const featureCodes = getFeatureCodesForPosition(code);

    sql.push(`
    -- Role for position: ${name} in branch
    role_id := substr(md5(random()::text), 1, 24);
    IF NOT EXISTS (
      SELECT 1 FROM public.roles r
      WHERE r.name = '${escapeSingleQuotes(name)} ' || branch.name AND r.position_code = '${code}'
    ) THEN
      INSERT INTO public.roles (
        id, created_by, updated_by, created_at, updated_at, deleted, name, description, position_code
      ) VALUES (
        role_id, ${createdBy}, ${updatedBy}, now(), now(), false,
        '${escapeSingleQuotes(name)} ' || branch.name,
        'Vai trò cho ${escapeSingleQuotes(name)} tại chi nhánh ' || branch.name,
        '${code}'
      );

      INSERT INTO public.role_branches (
        created_by, updated_by, created_at, updated_at, deleted, role_id, branch_id
      ) VALUES (
        ${createdBy}, ${updatedBy}, now(), now(), false, role_id, branch.id
      );

      -- Insert user for role
      user_id := substr(md5(random()::text), 1, 24);
      INSERT INTO public.users (
        id, created_by, updated_by, created_at, updated_at, deleted,
        full_name, username, password, role_id, status, last_login_at, refresh_token
      ) VALUES (
        user_id, ${createdBy}, ${updatedBy}, now(), now(), false,
        '${escapeSingleQuotes(name)} ' || branch.name,
        lower(replace(replace(replace('${name} ' || branch.name, ' ', ''), '-', ''), 'đ', 'd')),
        'adminadmin', role_id, 1, null, null
      );
`);

    // 3. Role accesses for features
    for (const featureCode of featureCodes) {
      sql.push(`
      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        ${createdBy}, ${updatedBy}, now(), now(), false, '${code}', '${featureCode}', ${permission}
      )
      ON CONFLICT DO NOTHING;`);
    }

    sql.push(`    END IF;`);
  }

  sql.push(`  END LOOP;
END $$;
`);

  return sql.join('\n');
}


console.log(generateSQLInsertScripts());
