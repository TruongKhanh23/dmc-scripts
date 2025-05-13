import data from "./data/products_hethongchung.js";
import fs from "fs";

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

// Gọi hàm để generate SQL
const sql = generateSQL(data);

fs.writeFileSync("result.txt", sql, "utf8");

// fs.writeFileSync("result.txt", JSON.stringify(data, null, 2), "utf8");

console.log("Data đã được ghi vào file result.txt");
