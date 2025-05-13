const branch = "Số 68 Nguyễn Huệ - Q.1";
const HE_THONG_CHUNG = "";
const NGUYEN_HUE = "Số 68 Nguyễn Huệ - Q.1";
const CA_PHE_MUOI_CHAI = "Cà phê muối chai"
const salesChannels = [];
if(branch === NGUYEN_HUE){
  salesChannels = ["Tại quán", "Grab", "Be", "Shopee"];
} else {
  salesChannels = ["Tại quán", "Grab", "Be", "Shopee", "VILL", "RIO"];
}

const volumePricesByBranch = {
  "Số 68 Nguyễn Huệ - Q.1": {
    330: 20000,
    500: 25000,
    600: 25000,
    20: 5000,
  },
  "": {
    330: 18000,
    500: 20000,
    600: 25000,
    20: 5000,
  },
  // Thêm chi nhánh khác ở đây nếu cần
};

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

// Generate product data

function generatePriceByVolume(volume, productName, salesChannel) {
  if (productName === CA_PHE_MUOI_CHAI) {
    return 60000;
  }

  const branchPrices = volumePricesByBranch[branch] || volumePricesByBranch[""];

  // Áp dụng giá đặc biệt cho chi nhánh Nguyễn Huệ
  const grabShopeeBe = ["Grab", "Be", "Shopee"];
  const villRio = ["Vill", "Rio"];

  if (grabShopeeBe.includes(salesChannel)) {
    if (volume === "330") return 22000;
    if (volume === "600") return 29000;
    if (volume === "500") return 25000;
  }

  if (branch !== NGUYEN_HUE && villRio.includes(salesChannel)) {
    // Không áp dụng Vill, Rio cho Nguyễn Huệ
    return 0;
  }

  return branchPrices[volume] ?? 0;
}

function generateVariantsForProduct(product) {
  const variants = [];

  // Điều chỉnh volume theo category
  let volumes = [];
  if (product.category === "Cà phê" && product.name !== CA_PHE_MUOI_CHAI) {
    volumes = ["330", "600"]; // Cà phê chỉ có các thể tích 330 và 600
  } else if (
    product.category === "Trà" ||
    product.category === "Sữa chua" ||
    product.category === "Nước giải khát" ||
    product.name === CA_PHE_MUOI_CHAI
  ) {
    volumes = ["500"]; // Trà và Sữa chua chỉ có thể tích 500
  } else if (
    product.name === "Kem mặn thêm (Salted cream)" ||
    product.name === "Cà phê thêm (Extra coffee)"
  ) {
    volumes = ["20"]; // Kem mặn thêm và Cà phê thêm chỉ có volume 20
  }

  // Tạo các variants cho mỗi volume
  volumes.forEach((volume) => {
    const variant = {
      product: product.name,
      volume: volume,
      name: volume === "330" ? "Nhỏ" : "Lớn",
    };
    variants.push(variant);
  });

  return variants;
}

function generatePricesForProduct(product) {
  const prices = [];

  let volumes = [];
  if (product.name === CA_PHE_MUOI_CHAI) {
    volumes = ["500"];
  } else if (product.category === "Cà phê" && product.name !== CA_PHE_MUOI_CHAI) {
    volumes = ["330", "600"];
  } else if (product.category === "Trà" || product.category === "Sữa chua" || product.category === "Nước giải khát") {
    volumes = ["500"];
  } else if (
    product.name === "Kem mặn thêm (Salted cream)" ||
    product.name === "Cà phê thêm (Extra coffee)"
  ) {
    volumes = ["20"];
  }

  // Lặp salesChannel và volumes để tạo giá
  salesChannels.forEach((channel) => {
    volumes.forEach((volume) => {
      const amount = generatePriceByVolume(volume, product.name, channel);
      if (amount > 0) {
        prices.push({
          product: product.name,
          variant: volume === "330" ? "Nhỏ" : "Lớn",
          amount,
          branch,
          salesChannel: channel,
        });
      }
    });
  });

  return prices;
}

function generateData(products) {
  let variants = [];
  let prices = [];
  let categories = [];

  products.forEach((product) => {
    // Tạo các variant và giá cho mỗi sản phẩm
    variants = variants.concat(generateVariantsForProduct(product));
    prices = prices.concat(generatePricesForProduct(product));

    // Thêm category nếu chưa có
    if (!categories.includes(product.category)) {
      categories.push(product.category);
    }
  });

  // Tạo cấu trúc data theo yêu cầu
  const data = {
    categories: categories,
    volumes: ["500", "330", "600", "20"],
    products: products.map((product) => ({
      name: product.name,
      category: product.category,
      description: product.description,
    })),
    variants: variants,
    prices: prices,
    branches: [branch],
    salesChannels: salesChannels,
  };

  return data;
}

// Dữ liệu sản phẩm cơ bản với category và description
const products = [
  {
    name: "Cà phê muối",
    category: "Cà phê",
    description: "Cà phê muối (Salted coffee)",
  },
  {
    name: "Cà phê dừa",
    category: "Cà phê",
    description: "Cà phê dừa (Coconut coffee)",
  },
  {
    name: "Sữa tươi cà phê",
    category: "Cà phê",
    description: "Sữa tươi cà phê (Fresh milk coffee)",
  },
  {
    name: "Bạc sỉu",
    category: "Cà phê",
    description: "Bạc sỉu (White coffee)",
  },
  {
    name: "Cà phê kem phô mai",
    category: "Cà phê",
    description: "Cà phê kem phô mai",
  },
  {
    name: "Cà phê sữa",
    category: "Cà phê",
    description: "Cà phê sữa (Milk coffee)",
  },
  {
    name: "Cà phê đen",
    category: "Cà phê",
    description: "Cà phê đen (Black coffee)",
  },
  {
    name: "Cà phê muối chai",
    category: "Cà phê",
    description: "Cà phê muối chai (Coffee bottle)",
  },
  {
    name: "Ca cao sữa",
    category: "Nước giải khát",
    description: "Ca cao sữa (Milk cocoa)",
  },
  {
    name: "Trà đác thơm",
    category: "Trà",
    description: "Trà đác thơm",
  },
  {
    name: "Trà tắc xi muối",
    category: "Trà",
    description: "Trà tắc xi muối",
  },
  {
    name: "Trà me",
    category: "Trà",
    description: "Trà me (Tamarind tea)",
  },
  {
    name: "Sữa chua chanh dây",
    category: "Sữa chua",
    description: "Sữa chua chanh dây (Passion fruit yogurt)",
  },
  {
    name: "Chanh dây",
    category: "Nước giải khát",
    description: "Chanh dây (Passion juice)",
  },
  {
    name: "Sữa chua đá",
    category: "Sữa chua",
    description: "Sữa chua đá",
  },
];

// Gọi hàm để tạo cấu trúc data
const data = generateData(products);

// Gọi hàm để generate SQL
const sql = generateSQL(data);
console.log(sql);
