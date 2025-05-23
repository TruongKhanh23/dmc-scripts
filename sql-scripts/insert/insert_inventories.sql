
-- Insert nếu chưa có name 'Cà Phê Đen'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Cà Phê Đen' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  180 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'bịch' OR symbol = 'bịch' LIMIT 1) as package_unit_id,
  1000 as package_quantity,
  180000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Cà Phê Đen' AND deleted = false
);

-- Insert nếu chưa có name 'Sữa Đặc'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Sữa Đặc' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  48 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'hộp' OR symbol = 'hộp' LIMIT 1) as package_unit_id,
  1250 as package_quantity,
  60000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Sữa Đặc' AND deleted = false
);

-- Insert nếu chưa có name 'Nước Cốt Dừa'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Nước Cốt Dừa' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  60 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'lon' OR symbol = 'lon' LIMIT 1) as package_unit_id,
  400 as package_quantity,
  24000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Nước Cốt Dừa' AND deleted = false
);

-- Insert nếu chưa có name 'Bột Cacao'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Bột Cacao' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  210 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'bịch' OR symbol = 'bịch' LIMIT 1) as package_unit_id,
  500 as package_quantity,
  105000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Bột Cacao' AND deleted = false
);

-- Insert nếu chưa có name 'Vụn Dừa'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Vụn Dừa' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  124 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'bịch' OR symbol = 'bịch' LIMIT 1) as package_unit_id,
  500 as package_quantity,
  62000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Vụn Dừa' AND deleted = false
);

-- Insert nếu chưa có name 'Kem Muối'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Kem Muối' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  161.29 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'hủ' OR symbol = 'hủ' LIMIT 1) as package_unit_id,
  310 as package_quantity,
  50000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Kem Muối' AND deleted = false
);

-- Insert nếu chưa có name 'Đường Gói'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Đường Gói' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gói' OR symbol = 'gói' LIMIT 1) as base_unit_id,
  0.93 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'kiện' OR symbol = 'kiện' LIMIT 1) as package_unit_id,
  400 as package_quantity,
  370 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Đường Gói' AND deleted = false
);

-- Insert nếu chưa có name 'Đường Cát'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Đường Cát' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  22000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  22000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Đường Cát' AND deleted = false
);

-- Insert nếu chưa có name 'Chai Cà Phê'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Chai Cà Phê' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as base_unit_id,
  45000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  45000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Chai Cà Phê' AND deleted = false
);

-- Insert nếu chưa có name 'Sữa Tươi'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Sữa Tươi' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  35.79 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'hộp' OR symbol = 'hộp' LIMIT 1) as package_unit_id,
  950 as package_quantity,
  34000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Sữa Tươi' AND deleted = false
);

-- Insert nếu chưa có name 'Kem Bắp'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Kem Bắp' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  272 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'hủ' OR symbol = 'hủ' LIMIT 1) as package_unit_id,
  500 as package_quantity,
  136000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Kem Bắp' AND deleted = false
);

-- Insert nếu chưa có name 'Bắp Rang Bơ'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Bắp Rang Bơ' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as base_unit_id,
  55000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  55000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Bắp Rang Bơ' AND deleted = false
);

-- Insert nếu chưa có name 'Trà Túi'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Trà Túi' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'túi' OR symbol = 'túi' LIMIT 1) as base_unit_id,
  300 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gói' OR symbol = 'gói' LIMIT 1) as package_unit_id,
  10 as package_quantity,
  3000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Trà Túi' AND deleted = false
);

-- Insert nếu chưa có name 'Thảo Mộc'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Thảo Mộc' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'túi' OR symbol = 'túi' LIMIT 1) as base_unit_id,
  700 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gói' OR symbol = 'gói' LIMIT 1) as package_unit_id,
  10 as package_quantity,
  7000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Thảo Mộc' AND deleted = false
);

-- Insert nếu chưa có name 'Lá Dứa'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Lá Dứa' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  25 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'kiện' OR symbol = 'kiện' LIMIT 1) as package_unit_id,
  1000 as package_quantity,
  25000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Lá Dứa' AND deleted = false
);

-- Insert nếu chưa có name 'Trà Xanh Lài'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Trà Xanh Lài' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  148 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'bịch' OR symbol = 'bịch' LIMIT 1) as package_unit_id,
  500 as package_quantity,
  74000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Trà Xanh Lài' AND deleted = false
);

-- Insert nếu chưa có name 'Mứt Tắc'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Mứt Tắc' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  66.67 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'hủ' OR symbol = 'hủ' LIMIT 1) as package_unit_id,
  900 as package_quantity,
  60000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Mứt Tắc' AND deleted = false
);

-- Insert nếu chưa có name 'Tắc'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Tắc' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  25000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  25000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Tắc' AND deleted = false
);

-- Insert nếu chưa có name 'Chanh Tươi'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Chanh Tươi' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  33000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  33000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Chanh Tươi' AND deleted = false
);

-- Insert nếu chưa có name 'Chanh Dây'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Chanh Dây' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  33000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  33000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Chanh Dây' AND deleted = false
);

-- Insert nếu chưa có name 'Kẹo Me'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Kẹo Me' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  140 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'túi' OR symbol = 'túi' LIMIT 1) as package_unit_id,
  500 as package_quantity,
  70000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Kẹo Me' AND deleted = false
);

-- Insert nếu chưa có name 'Muối Ớt'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Muối Ớt' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  60 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gói' OR symbol = 'gói' LIMIT 1) as package_unit_id,
  250 as package_quantity,
  15000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Muối Ớt' AND deleted = false
);

-- Insert nếu chưa có name 'Ép Thơm'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Ép Thơm' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  14.85 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as package_unit_id,
  8755 as package_quantity,
  130000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Ép Thơm' AND deleted = false
);

-- Insert nếu chưa có name 'Syrup Me'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Syrup Me' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  70.71 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as package_unit_id,
  1400 as package_quantity,
  99000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Syrup Me' AND deleted = false
);

-- Insert nếu chưa có name 'Syrup Tắc Xí Muội'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Syrup Tắc Xí Muội' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  99000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  99000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Syrup Tắc Xí Muội' AND deleted = false
);

-- Insert nếu chưa có name 'Syrup Chanh Dây'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Syrup Chanh Dây' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  66.18 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as package_unit_id,
  680 as package_quantity,
  45000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Syrup Chanh Dây' AND deleted = false
);

-- Insert nếu chưa có name 'Nước Cốt Tắc'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Nước Cốt Tắc' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  7.47 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as package_unit_id,
  6695 as package_quantity,
  50000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Nước Cốt Tắc' AND deleted = false
);

-- Insert nếu chưa có name 'Syrup Đường'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Syrup Đường' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  0 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'thùng' OR symbol = 'thùng' LIMIT 1) as package_unit_id,
  26000 as package_quantity,
  25 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Syrup Đường' AND deleted = false
);

-- Insert nếu chưa có name 'Đác Thơm'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Đác Thơm' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'kg' OR symbol = 'kg' LIMIT 1) as base_unit_id,
  100000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'bịch' OR symbol = 'bịch' LIMIT 1) as package_unit_id,
  1.7 as package_quantity,
  170000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Đác Thơm' AND deleted = false
);

-- Insert nếu chưa có name 'Sữa Chua'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Sữa Chua' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'hủ' OR symbol = 'hủ' LIMIT 1) as base_unit_id,
  11000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'hủ' OR symbol = 'hủ' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  11000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Sữa Chua' AND deleted = false
);

-- Insert nếu chưa có name 'Nước Cốt Chanh'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Nước Cốt Chanh' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'gram' OR symbol = 'gram' LIMIT 1) as base_unit_id,
  75.87 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'chai' OR symbol = 'chai' LIMIT 1) as package_unit_id,
  659 as package_quantity,
  50000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Nước Cốt Chanh' AND deleted = false
);

-- Insert nếu chưa có name 'Đá'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  'Đá' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'bao' OR symbol = 'bao' LIMIT 1) as base_unit_id,
  17000 as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = 'bao' OR symbol = 'bao' LIMIT 1) as package_unit_id,
  1 as package_quantity,
  17000 as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = 'Đá' AND deleted = false
);

-- Xem dữ liệu inventories sau khi insert
SELECT
  i.id,
  i.name,
  i.package_price,
  pu.name  AS packageUnitName,
  i.package_quantity,
  bu.name  AS baseUnitName,
  i.unit_price,
  i.created_by,
  i.updated_by,
  i.created_at,
  i.updated_at,
  i.deleted
FROM public.inventories i
LEFT JOIN public.units bu ON i.base_unit_id = bu.id
LEFT JOIN public.units pu ON i.package_unit_id = pu.id
WHERE i.deleted = false
ORDER BY i.created_at DESC;
