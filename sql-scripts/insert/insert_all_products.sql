-- Kiểm tra và tạo danh mục sản phẩm
WITH category_cte AS (
    SELECT id, name
    FROM public.product_categories
    WHERE name IN ('Trà', 'Cà phê', 'Sữa chua')
)
-- Chèn danh mục sản phẩm
INSERT INTO public.product_categories(id, created_by, updated_by, created_at, updated_at, deleted, name, description)
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'Trà', 'Trà các loại'
WHERE NOT EXISTS (SELECT 1 FROM category_cte WHERE name = 'Trà')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'Cà phê', 'Cà phê các loại'
WHERE NOT EXISTS (SELECT 1 FROM category_cte WHERE name = 'Cà phê')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, 'Sữa chua', 'Sữa chua các loại'
WHERE NOT EXISTS (SELECT 1 FROM category_cte WHERE name = 'Sữa chua')
;

-- Kiểm tra và tạo các volume
WITH volume_cte AS (
    SELECT id, name FROM public.product_volumes WHERE name IN ('500', '330', '600', '20')
)
-- Chèn volume
INSERT INTO public.product_volumes(id, created_by, updated_by, created_at, updated_at, deleted, name)
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, '500'
WHERE NOT EXISTS (SELECT 1 FROM volume_cte WHERE name = '500')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, '330'
WHERE NOT EXISTS (SELECT 1 FROM volume_cte WHERE name = '330')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, '600'
WHERE NOT EXISTS (SELECT 1 FROM volume_cte WHERE name = '600')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, '20'
WHERE NOT EXISTS (SELECT 1 FROM volume_cte WHERE name = '20')
;

-- Kiểm tra và tạo các sản phẩm
WITH product_cte AS (
    SELECT id, name FROM public.products WHERE name IN ('Trà me', 'Trà tắc xi muối', 'Chanh dây', 'Ca cao sữa', 'Cà phê muối', 'Cà phê dừa', 'Cà phê chai', 'Cà phê đen', 'Cà phê sữa', 'Bạc sỉu', 'Cà phê bắp', 'Sữa tươi cà phê', 'Cà phê kem phô mai', 'Sữa chua đá', 'Sữa chua chanh dây', 'Kem mặn thêm', 'Cà phê thêm')
)
-- Chèn sản phẩm
INSERT INTO public.products(id, created_by, updated_by, created_at, updated_at, deleted, category_id, name, description)
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Trà'), 'Trà me', 'Trà me (Tamarind tea)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Trà me')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Trà'), 'Trà tắc xi muối', 'Trà tắc xi muối'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Trà tắc xi muối')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Trà'), 'Chanh dây', 'Chanh dây (Passion juice)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Chanh dây')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Trà'), 'Ca cao sữa', 'Ca cao sữa (Milk cocoa)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Ca cao sữa')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê muối', 'Cà phê muối (Salted coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê muối')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê dừa', 'Cà phê dừa (Coconut coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê dừa')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê chai', 'Cà phê chai (Coffee bottle)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê chai')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê đen', 'Cà phê đen (Black coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê đen')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê sữa', 'Cà phê sữa (Milk coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê sữa')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Bạc sỉu', 'Bạc sỉu (White coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Bạc sỉu')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê bắp', 'Cà phê bắp (Corn coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê bắp')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Sữa tươi cà phê', 'Sữa tươi cà phê (Fresh milk coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Sữa tươi cà phê')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê kem phô mai', 'Cà phê kem phô mai'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê kem phô mai')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Sữa chua'), 'Sữa chua đá', 'Sữa chua đá'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Sữa chua đá')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Sữa chua'), 'Sữa chua chanh dây', 'Sữa chua chanh dây (Passion fruit yogurt)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Sữa chua chanh dây')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Kem mặn thêm', 'Kem mặn thêm (Salted cream)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Kem mặn thêm')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = 'Cà phê'), 'Cà phê thêm', 'Cà phê thêm (Extra coffee)'
WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = 'Cà phê thêm')
;

-- Kiểm tra và tạo các variants cho sản phẩm
WITH variant_cte AS (
    SELECT id, name FROM public.product_variants WHERE name IN ('Trà me 500ml', 'Trà tắc xi muối 500ml', 'Chanh dây 500ml', 'Ca cao sữa 500ml', 'Cà phê muối 330ml', 'Cà phê muối 600ml', 'Cà phê dừa 330ml', 'Cà phê dừa 600ml', 'Cà phê chai 500ml', 'Cà phê đen 330ml', 'Cà phê đen 600ml', 'Cà phê sữa 330ml', 'Cà phê sữa 600ml', 'Bạc sỉu 330ml', 'Bạc sỉu 600ml', 'Cà phê bắp 330ml', 'Cà phê bắp 600ml', 'Sữa tươi cà phê 330ml', 'Sữa tươi cà phê 600ml', 'Cà phê kem phô mai 330ml', 'Cà phê kem phô mai 600ml', 'Sữa chua đá 500ml', 'Sữa chua chanh dây 500ml', 'Kem mặn thêm 330ml', 'Kem mặn thêm 600ml', 'Cà phê thêm 330ml', 'Cà phê thêm 600ml')
)
-- Chèn variant cho các sản phẩm
INSERT INTO public.product_variants(id, created_by, updated_by, created_at, updated_at, deleted, product_id, volume_id, name)
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Trà me'), (SELECT id FROM public.product_volumes WHERE name = '500'), 'Trà me 500ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Trà me 500ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Trà tắc xi muối'), (SELECT id FROM public.product_volumes WHERE name = '500'), 'Trà tắc xi muối 500ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Trà tắc xi muối 500ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Chanh dây'), (SELECT id FROM public.product_volumes WHERE name = '500'), 'Chanh dây 500ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Chanh dây 500ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Ca cao sữa'), (SELECT id FROM public.product_volumes WHERE name = '500'), 'Ca cao sữa 500ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Ca cao sữa 500ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê muối'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Cà phê muối 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê muối 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê muối'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Cà phê muối 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê muối 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê dừa'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Cà phê dừa 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê dừa 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê dừa'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Cà phê dừa 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê dừa 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê chai'), (SELECT id FROM public.product_volumes WHERE name = '500'), 'Cà phê chai 500ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê chai 500ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê đen'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Cà phê đen 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê đen 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê đen'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Cà phê đen 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê đen 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê sữa'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Cà phê sữa 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê sữa 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê sữa'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Cà phê sữa 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê sữa 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Bạc sỉu'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Bạc sỉu 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Bạc sỉu 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Bạc sỉu'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Bạc sỉu 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Bạc sỉu 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê bắp'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Cà phê bắp 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê bắp 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê bắp'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Cà phê bắp 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê bắp 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Sữa tươi cà phê'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Sữa tươi cà phê 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Sữa tươi cà phê 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Sữa tươi cà phê'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Sữa tươi cà phê 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Sữa tươi cà phê 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê kem phô mai'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Cà phê kem phô mai 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê kem phô mai 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê kem phô mai'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Cà phê kem phô mai 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê kem phô mai 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Sữa chua đá'), (SELECT id FROM public.product_volumes WHERE name = '500'), 'Sữa chua đá 500ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Sữa chua đá 500ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Sữa chua chanh dây'), (SELECT id FROM public.product_volumes WHERE name = '500'), 'Sữa chua chanh dây 500ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Sữa chua chanh dây 500ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Kem mặn thêm'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Kem mặn thêm 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Kem mặn thêm 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Kem mặn thêm'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Kem mặn thêm 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Kem mặn thêm 600ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê thêm'), (SELECT id FROM public.product_volumes WHERE name = '330'), 'Cà phê thêm 330ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê thêm 330ml')
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = 'Cà phê thêm'), (SELECT id FROM public.product_volumes WHERE name = '600'), 'Cà phê thêm 600ml'
WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = 'Cà phê thêm 600ml')
;

-- Kiểm tra và tạo giá cho sản phẩm
WITH price_cte AS (
    SELECT variant_id, branch_id, sales_channel_id
    FROM public.product_prices
)
-- Chèn giá cho sản phẩm
INSERT INTO public.product_prices(id, created_by, updated_by, created_at, updated_at, deleted, variant_id, branch_id, sales_channel_id, price)
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Trà me 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Trà me')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Trà me 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Trà me'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Trà tắc xi muối 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Trà tắc xi muối')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Trà tắc xi muối 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Trà tắc xi muối'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Chanh dây 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Chanh dây')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Chanh dây 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Chanh dây'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Ca cao sữa 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Ca cao sữa')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Ca cao sữa 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Ca cao sữa'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê muối 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê muối')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê muối 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê muối'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê muối 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê muối')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê muối 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê muối'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê dừa 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê dừa')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê dừa 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê dừa'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê dừa 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê dừa')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê dừa 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê dừa'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê chai 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê chai')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  60000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê chai 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê chai'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê đen 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê đen')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê đen 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê đen'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê đen 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê đen')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê đen 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê đen'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê sữa 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê sữa')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê sữa 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê sữa'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê sữa 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê sữa')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê sữa 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê sữa'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Bạc sỉu 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Bạc sỉu')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Bạc sỉu 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Bạc sỉu'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Bạc sỉu 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Bạc sỉu')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Bạc sỉu 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Bạc sỉu'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê bắp 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê bắp')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê bắp 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê bắp'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê bắp 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê bắp')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê bắp 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê bắp'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Sữa tươi cà phê 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa tươi cà phê')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Sữa tươi cà phê 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa tươi cà phê'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Sữa tươi cà phê 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa tươi cà phê')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Sữa tươi cà phê 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa tươi cà phê'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê kem phô mai 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê kem phô mai')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê kem phô mai 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê kem phô mai'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê kem phô mai 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê kem phô mai')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê kem phô mai 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê kem phô mai'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Sữa chua đá 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa chua đá')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Sữa chua đá 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa chua đá'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Sữa chua chanh dây 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa chua chanh dây')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Sữa chua chanh dây 500ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Sữa chua chanh dây'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Kem mặn thêm 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Kem mặn thêm')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Kem mặn thêm 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Kem mặn thêm'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Kem mặn thêm 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Kem mặn thêm')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Kem mặn thêm 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Kem mặn thêm'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê thêm 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê thêm')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  20000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê thêm 330ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê thêm'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
UNION ALL
SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
  (SELECT id FROM public.product_variants WHERE name = 'Cà phê thêm 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê thêm')),
  (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1'),
  (SELECT id FROM public.sales_channels WHERE name = 'Tại quán'),
  25000
WHERE NOT EXISTS (
  SELECT 1 FROM price_cte WHERE
    variant_id = (SELECT id FROM public.product_variants WHERE name = 'Cà phê thêm 600ml' AND product_id = (SELECT id FROM public.products WHERE name = 'Cà phê thêm'))
    AND branch_id = (SELECT id FROM public.branches WHERE name = 'Số 68 Nguyễn Huệ - Q.1')
    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = 'Tại quán')
)
;

SELECT 
    c.name AS category_name,
    p.name AS product_name,
    v.name AS variant_name,
    vol.name AS volume_name,
    sc.name AS sales_channel_name,
    b.name AS branch_name,
    pr.price,

    c.id AS category_id,
    p.id AS product_id,
    v.id AS variant_id,
    vol.id AS volume_id,
    sc.id AS sales_channel_id,
    b.id AS branch_id,
    pr.id AS price_id

FROM public.products p
LEFT JOIN public.product_categories c ON p.category_id = c.id
LEFT JOIN public.product_variants v ON v.product_id = p.id
LEFT JOIN public.product_volumes vol ON v.volume_id = vol.id
LEFT JOIN public.product_prices pr ON pr.variant_id = v.id
LEFT JOIN public.sales_channels sc ON pr.sales_channel_id = sc.id
LEFT JOIN public.branches b ON pr.branch_id = b.id; -- or pr.branch_id IS NULL;

