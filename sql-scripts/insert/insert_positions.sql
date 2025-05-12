DO $$
BEGIN
    -- ADMINISTRATOR
    IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'administrator') THEN
        INSERT INTO public.positions (
            id, created_by, updated_by, created_at, updated_at, deleted,
            name, code, description
        ) VALUES (
            substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
            'Quản trị viên', 'administrator', 'Người có quyền quản trị hệ thống'
        );
    END IF;

    -- ACCOUNTANT_HEAD
    IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'accountant_head') THEN
        INSERT INTO public.positions (
            id, created_by, updated_by, created_at, updated_at, deleted,
            name, code, description
        ) VALUES (
            substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
            'Trưởng phòng kế toán', 'accountant_head', 'Phụ trách bộ phận kế toán'
        );
    END IF;

    -- ACCOUNTANT
    IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'accountant') THEN
        INSERT INTO public.positions (
            id, created_by, updated_by, created_at, updated_at, deleted,
            name, code, description
        ) VALUES (
            substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
            'Kế toán viên', 'accountant', 'Nhân viên kế toán'
        );
    END IF;

    -- CHAIN_MANAGER
    IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'chain_manager') THEN
        INSERT INTO public.positions (
            id, created_by, updated_by, created_at, updated_at, deleted,
            name, code, description
        ) VALUES (
            substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
            'Quản lý chuỗi', 'chain_manager', 'Phụ trách toàn bộ chuỗi cửa hàng'
        );
    END IF;

    -- BRANCH_MANAGER
    IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'branch_manager') THEN
        INSERT INTO public.positions (
            id, created_by, updated_by, created_at, updated_at, deleted,
            name, code, description
        ) VALUES (
            substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
            'Cửa hàng trưởng', 'branch_manager', 'Quản lý một cửa hàng cụ thể'
        );
    END IF;

    -- CASHIER
    IF NOT EXISTS (SELECT 1 FROM public.positions WHERE code = 'cashier') THEN
        INSERT INTO public.positions (
            id, created_by, updated_by, created_at, updated_at, deleted,
            name, code, description
        ) VALUES (
            substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
            'Thu ngân', 'cashier', 'Thực hiện thanh toán và hỗ trợ khách hàng tại quầy'
        );
    END IF;

END $$;

SELECT * FROM public.positions