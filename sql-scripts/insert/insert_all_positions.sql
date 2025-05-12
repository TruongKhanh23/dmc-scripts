
-- Chỉ chèn nếu chưa tồn tại code hoặc name
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.positions
    WHERE code = 'administrator' OR name = 'Quản trị hệ thống'
  ) THEN
    INSERT INTO public.positions (
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description, permission
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Quản trị hệ thống',
      'administrator',
      'Quản trị hệ thống',
      7
    );
  END IF;
END
$$;


-- Chỉ chèn nếu chưa tồn tại code hoặc name
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.positions
    WHERE code = 'accountant_head' OR name = 'Trưởng phòng kế toán'
  ) THEN
    INSERT INTO public.positions (
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description, permission
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Trưởng phòng kế toán',
      'accountant_head',
      'Trưởng phòng kế toán',
      7
    );
  END IF;
END
$$;


-- Chỉ chèn nếu chưa tồn tại code hoặc name
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.positions
    WHERE code = 'accountant' OR name = 'Kế toán viên'
  ) THEN
    INSERT INTO public.positions (
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description, permission
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Kế toán viên',
      'accountant',
      'Kế toán viên',
      7
    );
  END IF;
END
$$;


-- Chỉ chèn nếu chưa tồn tại code hoặc name
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.positions
    WHERE code = 'chain_manager' OR name = 'Quản lý chuỗi'
  ) THEN
    INSERT INTO public.positions (
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description, permission
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Quản lý chuỗi',
      'chain_manager',
      'Quản lý chuỗi',
      7
    );
  END IF;
END
$$;


-- Chỉ chèn nếu chưa tồn tại code hoặc name
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.positions
    WHERE code = 'branch_manager' OR name = 'Cửa hàng trưởng'
  ) THEN
    INSERT INTO public.positions (
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description, permission
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Cửa hàng trưởng',
      'branch_manager',
      'Cửa hàng trưởng',
      7
    );
  END IF;
END
$$;


-- Chỉ chèn nếu chưa tồn tại code hoặc name
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.positions
    WHERE code = 'cashier' OR name = 'Thu ngân'
  ) THEN
    INSERT INTO public.positions (
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description, permission
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Thu ngân',
      'cashier',
      'Thu ngân',
      7
    );
  END IF;
END
$$;