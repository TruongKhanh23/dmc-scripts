INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'gram' AS name,
  'g' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'gram' OR symbol = 'g'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'bịch' AS name,
  'bịch' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'bịch' OR symbol = 'bịch'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'hộp' AS name,
  'hộp' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'hộp' OR symbol = 'hộp'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'lon' AS name,
  'lon' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'lon' OR symbol = 'lon'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'hủ' AS name,
  'hủ' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'hủ' OR symbol = 'hủ'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'gói' AS name,
  'gói' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'gói' OR symbol = 'gói'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'kiện' AS name,
  'kiện' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'kiện' OR symbol = 'kiện'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'chai' AS name,
  'chai' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'chai' OR symbol = 'chai'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'túi' AS name,
  'túi' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'túi' OR symbol = 'túi'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'thùng' AS name,
  'thùng' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'thùng' OR symbol = 'thùng'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'kg' AS name,
  'kg' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'kg' OR symbol = 'kg'
);

INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  'bao' AS name,
  'bao' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = 'bao' OR symbol = 'bao'
);

SELECT * FROM public.units;
