export const POSITIONS = {
  ADMINISTRATOR: 'administrator',
  ACCOUNTANT_HEAD: 'accountant_head',
  ACCOUNTANT: 'accountant',
  CHAIN_MANAGER: 'chain_manager',
  BRANCH_MANAGER: 'branch_manager',
  CASHIER: 'cashier',
};

const positionNameVI = {
  administrator: 'Quản trị hệ thống',
  accountant_head: 'Trưởng phòng kế toán',
  accountant: 'Kế toán viên',
  chain_manager: 'Quản lý chuỗi',
  branch_manager: 'Cửa hàng trưởng',
  cashier: 'Thu ngân',
};

function generateInsertPositionsSQL() {
  const now = `now()`; // hoặc dùng `CURRENT_TIMESTAMP`
  const createdBy = 'admin';
  const updatedBy = 'admin';

  const inserts = Object.values(POSITIONS).map((code) => {
    const nameVI = positionNameVI[code];
    return `
-- Chỉ chèn nếu chưa tồn tại code hoặc name
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.positions
    WHERE code = '${code}' OR name = '${nameVI}'
  ) THEN
    INSERT INTO public.positions (
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description, permission
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      '${createdBy}',
      '${updatedBy}',
      ${now},
      ${now},
      false,
      '${nameVI}',
      '${code}',
      '${nameVI}',
      7
    );
  END IF;
END
$$;
`;
  });

  return inserts.join('\n');
}

console.log(generateInsertPositionsSQL());
