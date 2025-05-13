// Generate SQL script insert products

function generateSQL(data) {
  const productCategories = data.categories;
  const volumes = data.volumes;
  const products = data.products;
  const variants = data.variants;
  const prices = data.prices;
  const branches = data.branches;
  const salesChannels = data.salesChannels;

  let sql = "";

  // Generate SQL for categories
  sql += `-- Kiểm tra và tạo danh mục sản phẩm\nWITH category_cte AS (\n`;
  sql += `    SELECT id, name\n    FROM public.product_categories\n    WHERE name IN (${productCategories
    .map((cat) => `'${cat}'`)
    .join(", ")})\n)\n`;
  sql += `-- Chèn danh mục sản phẩm\nINSERT INTO public.product_categories(id, created_by, updated_by, created_at, updated_at, deleted, name, description)\n`;

  productCategories.forEach((cat) => {
    sql += `SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, '${cat}', '${cat} các loại'\n`;
    sql += `WHERE NOT EXISTS (SELECT 1 FROM category_cte WHERE name = '${cat}')\nUNION ALL\n`;
  });
  sql = sql.replace(/UNION ALL\n?$/, ";");

  // Generate SQL for volumes
  sql += `\n\n-- Kiểm tra và tạo các volume\nWITH volume_cte AS (\n`;
  sql += `    SELECT id, name FROM public.product_volumes WHERE name IN (${volumes
    .map((vol) => `'${vol}'`)
    .join(", ")})\n)\n`;
  sql += `-- Chèn volume\nINSERT INTO public.product_volumes(id, created_by, updated_by, created_at, updated_at, deleted, name)\n`;

  volumes.forEach((vol) => {
    sql += `SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, '${vol}'\n`;
    sql += `WHERE NOT EXISTS (SELECT 1 FROM volume_cte WHERE name = '${vol}')\nUNION ALL\n`;
  });
  sql = sql.replace(/UNION ALL\n?$/, ";");

  // Generate SQL for products
  sql += `\n\n-- Kiểm tra và tạo các sản phẩm\nWITH product_cte AS (\n`;
  sql += `    SELECT id, name FROM public.products WHERE name IN (${products
    .map((prod) => `'${prod.name}'`)
    .join(", ")})\n)\n`;
  sql += `-- Chèn sản phẩm\nINSERT INTO public.products(id, created_by, updated_by, created_at, updated_at, deleted, category_id, name, description)\n`;

  products.forEach((prod) => {
    sql += `SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.product_categories WHERE name = '${prod.category}'), '${prod.name}', '${prod.description}'\n`;
    sql += `WHERE NOT EXISTS (SELECT 1 FROM product_cte WHERE name = '${prod.name}')\nUNION ALL\n`;
  });
  sql = sql.replace(/UNION ALL\n?$/, ";");

  // Generate SQL for variants
  sql += `\n\n-- Kiểm tra và tạo các variants cho sản phẩm\nWITH variant_cte AS (\n`;
  sql += `    SELECT id, name FROM public.product_variants WHERE name IN (${variants
    .map((variant) => {
      const prodName = variant.product;
      const volumeLabel = variant.volume + "ml";
      const variantName = `${prodName} ${volumeLabel}`;
      return `'${variantName}'`;
    })
    .join(", ")})\n)\n`;
  sql += `-- Chèn variant cho các sản phẩm\nINSERT INTO public.product_variants(id, created_by, updated_by, created_at, updated_at, deleted, product_id, volume_id, name)\n`;

  variants.forEach((variant) => {
    const prodName = variant.product;
    const volumeLabel = variant.volume + "ml";
    const variantName = `${prodName} ${volumeLabel}`;
    sql += `SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE, (SELECT id FROM public.products WHERE name = '${prodName}'), (SELECT id FROM public.product_volumes WHERE name = '${variant.volume}'), '${variantName}'\n`;
    sql += `WHERE NOT EXISTS (SELECT 1 FROM variant_cte WHERE name = '${variantName}')\nUNION ALL\n`;
  });
  sql = sql.replace(/UNION ALL\n?$/, ";");

  // Generate SQL for prices
  sql += `\n\n-- Kiểm tra và tạo giá cho sản phẩm\nWITH price_cte AS (\n`;
  sql += `    SELECT variant_id, branch_id, sales_channel_id\n`;
  sql += `    FROM public.product_prices\n)\n`;

  sql += `-- Chèn giá cho sản phẩm\nINSERT INTO public.product_prices(id, created_by, updated_by, created_at, updated_at, deleted, variant_id, branch_id, sales_channel_id, price)\n`;

  prices.forEach((price) => {
    const variant = variants.find(
      (v) => v.product === price.product && v.name === price.variant
    );
    const volumeLabel = variant?.volume + "ml";
    const variantFullName = `${price.product} ${volumeLabel}`;

    sql += `SELECT substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,\n`;
    sql += `  (SELECT id FROM public.product_variants WHERE name = '${variantFullName}' AND product_id = (SELECT id FROM public.products WHERE name = '${price.product}')),\n`;
    sql += `  (SELECT id FROM public.branches WHERE name = '${price.branch}'),\n`;
    sql += `  (SELECT id FROM public.sales_channels WHERE name = '${price.salesChannel}'),\n`;
    sql += `  ${price.amount}\n`;

    sql += `WHERE NOT EXISTS (\n`;
    sql += `  SELECT 1 FROM price_cte WHERE\n`;
    sql += `    variant_id = (SELECT id FROM public.product_variants WHERE name = '${variantFullName}' AND product_id = (SELECT id FROM public.products WHERE name = '${price.product}'))\n`;
    sql += `    AND branch_id = (SELECT id FROM public.branches WHERE name = '${price.branch}')\n`;
    sql += `    AND sales_channel_id = (SELECT id FROM public.sales_channels WHERE name = '${price.salesChannel}')\n`;
    sql += `)\nUNION ALL\n`;
  });

  sql = sql.replace(/UNION ALL\n?$/, ";");

  return sql;
}
// Gọi hàm để tạo cấu trúc data
const data = {
  categories: [ 'Cà phê', 'Nước giải khát', 'Trà', 'Sữa chua' ],
  volumes: [ '500', '330', '600', '20' ],
  products: [
    {
      name: 'Cà phê muối',
      category: 'Cà phê',
      description: 'Cà phê muối (Salted coffee)'
    },
    {
      name: 'Cà phê dừa',
      category: 'Cà phê',
      description: 'Cà phê dừa (Coconut coffee)'
    },
    {
      name: 'Sữa tươi cà phê',
      category: 'Cà phê',
      description: 'Sữa tươi cà phê (Fresh milk coffee)'
    },
    {
      name: 'Bạc sỉu',
      category: 'Cà phê',
      description: 'Bạc sỉu (White coffee)'
    },
    {
      name: 'Cà phê kem phô mai',
      category: 'Cà phê',
      description: 'Cà phê kem phô mai'
    },
    {
      name: 'Cà phê sữa',
      category: 'Cà phê',
      description: 'Cà phê sữa (Milk coffee)'
    },
    {
      name: 'Cà phê đen',
      category: 'Cà phê',
      description: 'Cà phê đen (Black coffee)'
    },
    {
      name: 'Cà phê muối chai',
      category: 'Cà phê',
      description: 'Cà phê muối chai (Coffee bottle)'
    },
    {
      name: 'Ca cao sữa',
      category: 'Nước giải khát',
      description: 'Ca cao sữa (Milk cocoa)'
    },
    {
      name: 'Trà đác thơm',
      category: 'Trà',
      description: 'Trà đác thơm'
    },
    {
      name: 'Trà tắc xi muối',
      category: 'Trà',
      description: 'Trà tắc xi muối'
    },
    {
      name: 'Trà me',
      category: 'Trà',
      description: 'Trà me (Tamarind tea)'
    },
    {
      name: 'Sữa chua chanh dây',
      category: 'Sữa chua',
      description: 'Sữa chua chanh dây (Passion fruit yogurt)'
    },
    {
      name: 'Chanh dây',
      category: 'Nước giải khát',
      description: 'Chanh dây (Passion juice)'
    },
    {
      name: 'Sữa chua đá',
      category: 'Sữa chua',
      description: 'Sữa chua đá'
    }
  ],
  variants: [
    { product: 'Cà phê muối', volume: '330', name: 'Thường' },
    { product: 'Cà phê muối', volume: '600', name: 'Lớn' },
    { product: 'Cà phê dừa', volume: '330', name: 'Thường' },
    { product: 'Cà phê dừa', volume: '600', name: 'Lớn' },
    { product: 'Sữa tươi cà phê', volume: '330', name: 'Thường' },
    { product: 'Sữa tươi cà phê', volume: '600', name: 'Lớn' },
    { product: 'Bạc sỉu', volume: '330', name: 'Thường' },
    { product: 'Bạc sỉu', volume: '600', name: 'Lớn' },
    { product: 'Cà phê kem phô mai', volume: '330', name: 'Thường' },
    { product: 'Cà phê kem phô mai', volume: '600', name: 'Lớn' },
    { product: 'Cà phê sữa', volume: '330', name: 'Thường' },
    { product: 'Cà phê sữa', volume: '600', name: 'Lớn' },
    { product: 'Cà phê đen', volume: '330', name: 'Thường' },
    { product: 'Cà phê đen', volume: '600', name: 'Lớn' },
    { product: 'Cà phê muối chai', volume: '330', name: 'Thường' },
    { product: 'Ca cao sữa', volume: '500', name: 'Lớn' },
    { product: 'Trà đác thơm', volume: '500', name: 'Lớn' },
    { product: 'Trà tắc xi muối', volume: '500', name: 'Lớn' },
    { product: 'Trà me', volume: '500', name: 'Lớn' },
    { product: 'Sữa chua chanh dây', volume: '500', name: 'Lớn' },
    { product: 'Chanh dây', volume: '500', name: 'Lớn' },
    { product: 'Sữa chua đá', volume: '500', name: 'Lớn' }
  ],
  prices: [
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 20000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê muối',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê muối',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 20000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê dừa',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 20000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Sữa tươi cà phê',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 20000,
      branch: 'Số 68 Nguyễn Huệ - Q.1'9m,
      salesChannel: 'Tại quán'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Bạc sỉu',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 20000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê kem phô mai',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 20000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê sữa',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 20000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê đen',
      variant: 'Thường',
      amount: 22000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê đen',
      variant: 'Lớn',
      amount: 29000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Thường',
      amount: 60000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Thường',
      amount: 65000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Thường',
      amount: 65000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Cà phê muối chai',
      variant: 'Thường',
      amount: 65000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Ca cao sữa',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Trà đác thơm',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Trà tắc xi muối',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Trà tắc xi muối',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Trà tắc xi muối',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Trà tắc xi muối',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Trà me',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Trà me',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Trà me',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Trà me',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Sữa chua chanh dây',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Sữa chua chanh dây',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Sữa chua chanh dây',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Sữa chua chanh dây',
      variant: 2m'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Chanh dây',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Chanh dây',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Chanh dây',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Chanh dây',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    },
    {
      product: 'Sữa chua đá',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Tại quán'
    },
    {
      product: 'Sữa chua đá',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Grab'
    },
    {
      product: 'Sữa chua đá',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Be'
    },
    {
      product: 'Sữa chua đá',
      variant: 'Lớn',
      amount: 25000,
      branch: 'Số 68 Nguyễn Huệ - Q.1',
      salesChannel: 'Shopee'
    }
  ],
  branches: [ 'Số 68 Nguyễn Huệ - Q.1' ],
  salesChannels: [ 'Tại quán', 'Grab', 'Be', 'Shopee' ]
};

// Gọi hàm để generate SQL
const sql = generateSQL(data);
console.log(sql);
