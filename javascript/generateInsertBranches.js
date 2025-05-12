function generateInsertBranches(branches) {
  return branches.map(branch => {
    const { name, address } = branch;

    return `
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = '${name.replace(/'/g, "''")}' OR address = '${address.replace(/'/g, "''")}'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      '${name.replace(/'/g, "''")}',
      '${address.replace(/'/g, "''")}'
    );
  END IF;
END
$$;
    `.trim();
  }).join('\n\n');
}

const branches = [
  {
    name: '13C đại lộ Đồng Khởi - Bến Tre',
    address: '13C đại lộ Đồng Khởi, khu phố 6, phường Phú Khương, TP. Bến Tre'
  },
  {
    name: 'Số 68 Nguyễn Huệ - Q.1',
    address: 'Số 68 Nguyễn Huệ, phường Bến Nghé, Quận 1'
  }
];

console.log(generateInsertBranches(branches));