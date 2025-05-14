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
LEFT JOIN public.branches b ON pr.branch_id = b.id; -- pr.branch_id IS NULL;
