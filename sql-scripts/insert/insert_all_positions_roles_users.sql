-- Position: Quản trị viên
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'administrator' OR name = 'Quản trị viên') THEN
    INSERT INTO public.positions(
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description
    ) VALUES (
      substr(md5(random()::text), 1, 24), 'admin', 'admin', now(), now(), false, 'Quản trị viên', 'administrator', 'Quản trị viên'
    );
  END IF;
END $$;
-- Position: Kế toán trưởng
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'accountant_head' OR name = 'Kế toán trưởng') THEN
    INSERT INTO public.positions(
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description
    ) VALUES (
      substr(md5(random()::text), 1, 24), 'admin', 'admin', now(), now(), false, 'Kế toán trưởng', 'accountant_head', 'Kế toán trưởng'
    );
  END IF;
END $$;
-- Position: Kế toán
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'accountant' OR name = 'Kế toán') THEN
    INSERT INTO public.positions(
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description
    ) VALUES (
      substr(md5(random()::text), 1, 24), 'admin', 'admin', now(), now(), false, 'Kế toán', 'accountant', 'Kế toán'
    );
  END IF;
END $$;
-- Position: Quản lý chuỗi
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'chain_manager' OR name = 'Quản lý chuỗi') THEN
    INSERT INTO public.positions(
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description
    ) VALUES (
      substr(md5(random()::text), 1, 24), 'admin', 'admin', now(), now(), false, 'Quản lý chuỗi', 'chain_manager', 'Quản lý chuỗi'
    );
  END IF;
END $$;
-- Position: Cửa hàng trưởng
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'branch_manager' OR name = 'Cửa hàng trưởng') THEN
    INSERT INTO public.positions(
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description
    ) VALUES (
      substr(md5(random()::text), 1, 24), 'admin', 'admin', now(), now(), false, 'Cửa hàng trưởng', 'branch_manager', 'Cửa hàng trưởng'
    );
  END IF;
END $$;
-- Position: Thu ngân
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'cashier' OR name = 'Thu ngân') THEN
    INSERT INTO public.positions(
      id, created_by, updated_by, created_at, updated_at, deleted, name, code, description
    ) VALUES (
      substr(md5(random()::text), 1, 24), 'admin', 'admin', now(), now(), false, 'Thu ngân', 'cashier', 'Thu ngân'
    );
  END IF;
END $$;
-- Loop through branches
-- For each branch, insert roles, role accesses, and users

DO $$
DECLARE
  branch RECORD;
  role_id TEXT;
  user_id TEXT;
BEGIN
  FOR branch IN SELECT id, name FROM public.branches LOOP


    -- Role for position: Quản trị viên in branch
    role_id := substr(md5(random()::text), 1, 24);
    IF NOT EXISTS (
      SELECT 1 FROM public.roles r
      WHERE r.name = 'Quản trị viên ' || branch.name AND r.position_code = 'administrator'
    ) THEN
      INSERT INTO public.roles (
          id, created_by, updated_by, created_at, updated_at, deleted, name, description, position_code
        ) VALUES (
          role_id, 'admin', 'admin', now(), now(), false,
          substring('Quản trị viên ' || branch.name from 1 for 50),
          substring('Vai trò cho Quản trị viên tại chi nhánh ' || branch.name from 1 for 50),
          'administrator'
        );

      INSERT INTO public.role_branches (
        created_by, updated_by, created_at, updated_at, deleted, role_id, branch_id
      ) VALUES (
        'admin', 'admin', now(), now(), false, role_id, branch.id
      );

      -- Insert user for role
      -- Insert user for Quản trị viên @ branch
    user_id := substr(md5(random()::text), 1, 24);
    INSERT INTO public.users (
    id, created_by, updated_by, created_at, updated_at, deleted,
    full_name,   username,  password,   role_id, status, last_login_at, refresh_token
    ) VALUES (
    user_id, 'admin', 'admin', now(), now(), false,
    'Quản trị viên ' || branch.name,
    lower(
  regexp_replace(
    -- Bước 3: chỉ giữ a–z, 0–9
    regexp_replace(
      -- Bước 2: loại mọi ký tự ngoài ASCII (từ translate+combining)
      regexp_replace(
        -- Bước 1: translate precomposed
        translate(
          'kếtoántrưởng6bcôngtrườngquốctế(hồconrùa)q.3' || branch.name,
          -- tất cả ký tự có dấu (lower + UPPER)
          'àáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđ' ||
          'ÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴÈÉẸẺẼÊỀẾỆỂỄÌÍỊỈĨÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠÙÚỤỦŨƯỪỨỰỬỮỲÝỴỶỸĐ',
          -- map không dấu (lower + UPPER)
          'aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyyd' ||
          'AAAAAAAAAAAAAAAAAEEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYYD'
        ),
        -- xoá combining diacritics nếu input dùng dấu ghép
        E'[\u0300-\u036f]', '', 'g'
      ),
      -- xoá mọi ký tự không phải ASCII (sẽ loại luôn các dấu lạ còn sót)
      E'[^\x00-\x7F]', '', 'g'
    ),
    -- cuối cùng xoá ký tự không phải a–z hoặc số
    '[^a-z0-9]', '', 'g'
  )
)
,
    'adminadmin', role_id, 1, NULL, NULL
    );



      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'branches', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'positions', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'roles', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'units', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'users', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'products', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'shift_reports', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'administrator', 'sales_channels', 7
      )
      ON CONFLICT DO NOTHING;
    END IF;

    -- Role for position: Kế toán trưởng in branch
    role_id := substr(md5(random()::text), 1, 24);
    IF NOT EXISTS (
      SELECT 1 FROM public.roles r
      WHERE r.name = 'Kế toán trưởng ' || branch.name AND r.position_code = 'accountant_head'
    ) THEN
      INSERT INTO public.roles (
          id, created_by, updated_by, created_at, updated_at, deleted, name, description, position_code
        ) VALUES (
          role_id, 'admin', 'admin', now(), now(), false,
          substring('Kế toán trưởng ' || branch.name from 1 for 50),
          substring('Vai trò cho Kế toán trưởng tại chi nhánh ' || branch.name from 1 for 50),
          'accountant_head'
        );

      INSERT INTO public.role_branches (
        created_by, updated_by, created_at, updated_at, deleted, role_id, branch_id
      ) VALUES (
        'admin', 'admin', now(), now(), false, role_id, branch.id
      );

      -- Insert user for role
      user_id := substr(md5(random()::text), 1, 24);
      INSERT INTO public.users (
        id, created_by, updated_by, created_at, updated_at, deleted,
        full_name, username, password, role_id, status, last_login_at, refresh_token
      ) VALUES (
        user_id, 'admin', 'admin', now(), now(), false,
        'Kế toán trưởng ' || branch.name,
        lower(replace(replace(replace('Kế toán trưởng ' || branch.name, ' ', ''), '-', ''), 'đ', 'd')),
        'adminadmin', role_id, 1, null, null
      );


      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'accountant_head', 'users', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'accountant_head', 'shift_reports', 7
      )
      ON CONFLICT DO NOTHING;
    END IF;

    -- Role for position: Kế toán in branch
    role_id := substr(md5(random()::text), 1, 24);
    IF NOT EXISTS (
      SELECT 1 FROM public.roles r
      WHERE r.name = 'Kế toán ' || branch.name AND r.position_code = 'accountant'
    ) THEN
      INSERT INTO public.roles (
          id, created_by, updated_by, created_at, updated_at, deleted, name, description, position_code
        ) VALUES (
          role_id, 'admin', 'admin', now(), now(), false,
          substring('Kế toán ' || branch.name from 1 for 50),
          substring('Vai trò cho Kế toán tại chi nhánh ' || branch.name from 1 for 50),
          'accountant'
        );

      INSERT INTO public.role_branches (
        created_by, updated_by, created_at, updated_at, deleted, role_id, branch_id
      ) VALUES (
        'admin', 'admin', now(), now(), false, role_id, branch.id
      );

      -- Insert user for role
      user_id := substr(md5(random()::text), 1, 24);
      INSERT INTO public.users (
        id, created_by, updated_by, created_at, updated_at, deleted,
        full_name, username, password, role_id, status, last_login_at, refresh_token
      ) VALUES (
        user_id, 'admin', 'admin', now(), now(), false,
        'Kế toán ' || branch.name,
        lower(replace(replace(replace('Kế toán ' || branch.name, ' ', ''), '-', ''), 'đ', 'd')),
        'adminadmin', role_id, 1, null, null
      );

    END IF;

    -- Role for position: Quản lý chuỗi in branch
    role_id := substr(md5(random()::text), 1, 24);
    IF NOT EXISTS (
      SELECT 1 FROM public.roles r
      WHERE r.name = 'Quản lý chuỗi ' || branch.name AND r.position_code = 'chain_manager'
    ) THEN
      INSERT INTO public.roles (
          id, created_by, updated_by, created_at, updated_at, deleted, name, description, position_code
        ) VALUES (
          role_id, 'admin', 'admin', now(), now(), false,
          substring('Quản lý chuỗi ' || branch.name from 1 for 50),
          substring('Vai trò cho Quản lý chuỗi tại chi nhánh ' || branch.name from 1 for 50),
          'chain_manager'
        );

      INSERT INTO public.role_branches (
        created_by, updated_by, created_at, updated_at, deleted, role_id, branch_id
      ) VALUES (
        'admin', 'admin', now(), now(), false, role_id, branch.id
      );

      -- Insert user for role
      user_id := substr(md5(random()::text), 1, 24);
      INSERT INTO public.users (
        id, created_by, updated_by, created_at, updated_at, deleted,
        full_name, username, password, role_id, status, last_login_at, refresh_token
      ) VALUES (
        user_id, 'admin', 'admin', now(), now(), false,
        'Quản lý chuỗi ' || branch.name,
        lower(replace(replace(replace('Quản lý chuỗi ' || branch.name, ' ', ''), '-', ''), 'đ', 'd')),
        'adminadmin', role_id, 1, null, null
      );


      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'chain_manager', 'users', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'chain_manager', 'shift_reports', 7
      )
      ON CONFLICT DO NOTHING;
    END IF;

    -- Role for position: Cửa hàng trưởng in branch
    role_id := substr(md5(random()::text), 1, 24);
    IF NOT EXISTS (
      SELECT 1 FROM public.roles r
      WHERE r.name = 'Cửa hàng trưởng ' || branch.name AND r.position_code = 'branch_manager'
    ) THEN
      INSERT INTO public.roles (
          id, created_by, updated_by, created_at, updated_at, deleted, name, description, position_code
        ) VALUES (
          role_id, 'admin', 'admin', now(), now(), false,
          substring('Cửa hàng trưởng ' || branch.name from 1 for 50),
          substring('Vai trò cho Cửa hàng trưởng tại chi nhánh ' || branch.name from 1 for 50),
          'branch_manager'
        );

      INSERT INTO public.role_branches (
        created_by, updated_by, created_at, updated_at, deleted, role_id, branch_id
      ) VALUES (
        'admin', 'admin', now(), now(), false, role_id, branch.id
      );

      -- Insert user for role
      user_id := substr(md5(random()::text), 1, 24);
      INSERT INTO public.users (
        id, created_by, updated_by, created_at, updated_at, deleted,
        full_name, username, password, role_id, status, last_login_at, refresh_token
      ) VALUES (
        user_id, 'admin', 'admin', now(), now(), false,
        'Cửa hàng trưởng ' || branch.name,
        lower(replace(replace(replace('Cửa hàng trưởng ' || branch.name, ' ', ''), '-', ''), 'đ', 'd')),
        'adminadmin', role_id, 1, null, null
      );


      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'branch_manager', 'users', 7
      )
      ON CONFLICT DO NOTHING;

      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'branch_manager', 'shift_reports', 7
      )
      ON CONFLICT DO NOTHING;
    END IF;

    -- Role for position: Thu ngân in branch
    role_id := substr(md5(random()::text), 1, 24);
    IF NOT EXISTS (
      SELECT 1 FROM public.roles r
      WHERE r.name = 'Thu ngân ' || branch.name AND r.position_code = 'cashier'
    ) THEN
      INSERT INTO public.roles (
          id, created_by, updated_by, created_at, updated_at, deleted, name, description, position_code
        ) VALUES (
          role_id, 'admin', 'admin', now(), now(), false,
          substring('Thu ngân ' || branch.name from 1 for 50),
          substring('Vai trò cho Thu ngân tại chi nhánh ' || branch.name from 1 for 50),
          'cashier'
        );

      INSERT INTO public.role_branches (
        created_by, updated_by, created_at, updated_at, deleted, role_id, branch_id
      ) VALUES (
        'admin', 'admin', now(), now(), false, role_id, branch.id
      );

      -- Insert user for role
      user_id := substr(md5(random()::text), 1, 24);
      INSERT INTO public.users (
        id, created_by, updated_by, created_at, updated_at, deleted,
        full_name, username, password, role_id, status, last_login_at, refresh_token
      ) VALUES (
        user_id, 'admin', 'admin', now(), now(), false,
        'Thu ngân ' || branch.name,
        lower(replace(replace(replace('Thu ngân ' || branch.name, ' ', ''), '-', ''), 'đ', 'd')),
        'adminadmin', role_id, 1, null, null
      );


      INSERT INTO public.position_accesses (
        created_by, updated_by, created_at, updated_at, deleted, position_code, feature_code, permission
      ) VALUES (
        'admin', 'admin', now(), now(), false, 'cashier', 'shift_reports', 7
      )
      ON CONFLICT DO NOTHING;
    END IF;
  END LOOP;
END $$;