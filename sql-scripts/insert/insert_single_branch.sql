-- Đã có kiểm tra tồn tại trước khi Insert

INSERT INTO public.branches (id, created_by, updated_by, created_at, updated_at, deleted, name, address)
SELECT 
  substr(md5(random()::text), 1, 24),
  'admin',
  'admin',
  '2025-04-26T14:49:21.519952',
  '2025-04-26T14:49:21.519952',
  false,
  'Ngô Tất Tố',
  '104 Ngô Tất Tố'
WHERE NOT EXISTS (
  SELECT 1 FROM public.branches
  WHERE name = 'Ngô Tất Tố'
);

SELECT * FROM public.branches
ORDER BY id ASC LIMIT 100
