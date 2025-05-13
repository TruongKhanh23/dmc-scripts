const branch = "";
const HE_THONG_CHUNG = "";
const NGUYEN_HUE = "Số 68 Nguyễn Huệ - Q.1";
const CA_PHE_MUOI_CHAI = "Cà phê muối chai";
let salesChannels = [];
if (branch === NGUYEN_HUE) {
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

// Generate product data

function generatePriceByVolume(volume, productName, salesChannel) {
  if (productName === CA_PHE_MUOI_CHAI) {
    if (salesChannel === "Tại quán") {
      return 60000;
    } else {
      return 65000;
    }
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
    product.category === "Nước giải khát"
  ) {
    volumes = ["500"]; // Trà và Sữa chua chỉ có thể tích 500
  } else if (product.name === CA_PHE_MUOI_CHAI) {
    volumes = ["330"];
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
      name:
        product.name === "Cà phê muối chai" && volume === "330"
          ? "Thường"
          : volume === "330"
          ? "Thường"
          : "Lớn",
    };
    variants.push(variant);
  });

  return variants;
}

function generatePricesForProduct(product) {
  const prices = [];

  let volumes = [];
  if (product.name === CA_PHE_MUOI_CHAI) {
    volumes = ["330"];
  } else if (
    product.category === "Cà phê" &&
    product.name !== CA_PHE_MUOI_CHAI
  ) {
    volumes = ["330", "600"];
  } else if (
    product.category === "Trà" ||
    product.category === "Sữa chua" ||
    product.category === "Nước giải khát"
  ) {
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
          variant: volume === "330" ? "Thường" : "Lớn",
          amount,
          branch,
          salesChannel: channel,
        });
      }
    });
  });

  return prices;
}

export default function generateData(products) {
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
//const data = generateData(products);
