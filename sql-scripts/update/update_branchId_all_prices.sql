-- Update branchId cho toàn bộ product_prices - không có điều kiện lọc

UPDATE public.product_prices
SET branch_id = '48dd2f41c80fe484b3ac3b92';

SELECT id, created_by, updated_by, created_at, updated_at, deleted, variant_id, branch_id, sales_channel_id, price
FROM public.product_prices;