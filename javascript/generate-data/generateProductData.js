function generatePriceByVolume(volume, productName) {
  if (productName === "Cà phê muối chai") {
    return 60000; // Xử lý riêng cho "Cà phê muối chai"
  }

  switch (volume) {
    case "330":
      return 20000;
    case "500":
    case "600":
      return 25000;
    case "20":
      return 5000;
    default:
      return 0;
  }
}

function generateVariantsForProduct(product) {
  const variants = [];

  // Điều chỉnh volume theo category
  let volumes = [];
  if (product.category === "Cà phê" && product.name !== "Cà phê muối chai") {
    volumes = ["330", "600"]; // Cà phê chỉ có các thể tích 330 và 600
  } else if (
    product.category === "Trà" ||
    product.category === "Sữa chua" ||
    product.name === "Cà phê muối chai"
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

  // Điều chỉnh volume theo category
  let volumes = [];
  if (product.name === "Cà phê muối chai") {
    volumes = ["500"]; // Cà phê muối chai chỉ có thể tích 500
  } else if (product.category === "Cà phê" && product.name !== "Cà phê muối chai") {
    volumes = ["330", "600"]; // Cà phê chỉ có các thể tích 330 và 600
  } else if (product.category === "Trà" || product.category === "Sữa chua") {
    volumes = ["500"]; // Trà và Sữa chua chỉ có thể tích 500
  } else if (
    product.name === "Kem mặn thêm (Salted cream)" ||
    product.name === "Cà phê thêm (Extra coffee)"
  ) {
    volumes = ["20"]; // Kem mặn thêm và Cà phê thêm chỉ có volume 20
  }

  // Tạo các giá cho mỗi variant
  volumes.forEach((volume) => {
    const price = {
      product: product.name,
      variant: volume === "330" ? "Nhỏ" : "Lớn",
      amount: generatePriceByVolume(volume, product.name), // Truyền tên sản phẩm vào
      branch: "Nguyễn Huệ",
      salesChannel: "Tại quán",
    };
    prices.push(price);
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
    branches: ["Nguyễn Huệ"],
    salesChannels: ["Tại quán"],
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
    category: "Trà",
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
    category: "Trà",
    description: "Chanh dây (Passion juice)",
  },
  {
    name: "Sữa chua đá",
    category: "Sữa chua",
    description: "Sữa chua đá",
  },
];

// Gọi hàm để tạo cấu trúc data
const generatedData = generateData(products);
console.log(generatedData);
