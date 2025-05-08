DO $$
BEGIN
    -- Kiểm tra xem kênh 'Tại quán' đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM public.sales_channels WHERE name = 'Tại quán') THEN
        INSERT INTO public.sales_channels(
            id, created_by, updated_by, created_at, updated_at, deleted, name, description
        ) VALUES (substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'Tại quán', 'Kênh bán hàng tại quán');
    END IF;

    -- Kiểm tra xem kênh 'Grab' đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM public.sales_channels WHERE name = 'Grab') THEN
        INSERT INTO public.sales_channels(
            id, created_by, updated_by, created_at, updated_at, deleted, name, description
        ) VALUES (substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'Grab', 'Kênh bán hàng qua Grab');
    END IF;

    -- Kiểm tra xem kênh 'Shopee' đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM public.sales_channels WHERE name = 'Shopee') THEN
        INSERT INTO public.sales_channels(
            id, created_by, updated_by, created_at, updated_at, deleted, name, description
        ) VALUES (substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'Shopee', 'Kênh bán hàng trên Shopee');
    END IF;

    -- Kiểm tra xem kênh 'Be' đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM public.sales_channels WHERE name = 'Be') THEN
        INSERT INTO public.sales_channels(
            id, created_by, updated_by, created_at, updated_at, deleted, name, description
        ) VALUES (substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'Be', 'Kênh bán hàng qua Be');
    END IF;

    -- Kiểm tra xem kênh 'VILL' đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM public.sales_channels WHERE name = 'VILL') THEN
        INSERT INTO public.sales_channels(
            id, created_by, updated_by, created_at, updated_at, deleted, name, description
        ) VALUES (substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'VILL', 'Kênh bán hàng VILL');
    END IF;

    -- Kiểm tra xem kênh 'RIO' đã tồn tại chưa
    IF NOT EXISTS (SELECT 1 FROM public.sales_channels WHERE name = 'RIO') THEN
        INSERT INTO public.sales_channels(
            id, created_by, updated_by, created_at, updated_at, deleted, name, description
        ) VALUES (substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'RIO', 'Kênh bán hàng RIO');
    END IF;

END $$;
