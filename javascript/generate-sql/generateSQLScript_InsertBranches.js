export default function generateInsertBranches(branches) {
  const inserts = branches.map(branch => {
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
  });

  inserts.push('SELECT * FROM public.branches;');

  return inserts.join('\n\n');
}
