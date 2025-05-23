import rawInventories from "../data/inventories_raw.js";

export function analyseRawInventories() {
  const exceptPackageUnit = ["CHAI"];

  return rawInventories.map((item) => {
    const originalName = item.inventoryName;
    const originUnit = item.originUnit;
    const originPrice = item.originPrice;

    // Bước 1: Lấy phần trong ngoặc (nếu có), gán vào analyseUnit
    const unitInBracketMatch = originalName.match(/\(([^)]+)\)/);
    const analyseUnit = unitInBracketMatch
      ? unitInBracketMatch[1].trim()
      : originUnit;

    // Loại bỏ phần trong ngoặc khỏi name
    const name = originalName.replace(/\s*\([^)]*\)\s*/g, "").trim();

    // Bước 2: Tách chuỗi bằng dấu /
    let [beforeSlash, afterSlash] = analyseUnit.includes("/")
      ? analyseUnit.split("/").map((s) => s.trim())
      : ["", ""];

    let packageQuantity = null;
    let baseUnit = "";
    let packageUnit = "";
    let unitPrice;

    // Hàm xử lý số có dấu phẩy hoặc chấm
    function parseQuantity(text) {
      const quantityMatch = text.match(/[\d,.]+/);
      const rawQuantity = quantityMatch ? quantityMatch[0] : null;
      return rawQuantity
        ? parseFloat(rawQuantity.replace(/\./g, "").replace(",", "."))
        : null;
    }

    if (beforeSlash) {
      const quantity = parseQuantity(beforeSlash);
      const unitMatch = beforeSlash.match(/[^\d,.]+/);

      packageQuantity = quantity;
      baseUnit = unitMatch ? unitMatch[0].trim() : "";
      packageUnit = afterSlash || originUnit.trim();
    } else if (!unitInBracketMatch && !originUnit.includes("/")) {
      // Không có ngoặc và không có dấu /
      const quantity = parseQuantity(originUnit);
      const unitMatch = originUnit.match(/[^\d,.]+/);

      if (quantity) {
        packageQuantity = quantity;
        baseUnit = unitMatch ? unitMatch[0].trim() : "";
        packageUnit = exceptPackageUnit.includes(baseUnit) ? baseUnit : "KIỆN";
      } else {
        packageQuantity = 1;
        baseUnit = originUnit.trim();
        packageUnit = baseUnit;
      }
    } else {
      // Fallback
      baseUnit = originUnit.trim();
      packageQuantity = 1;
      packageUnit = originUnit.trim();
    }

    const packagePrice = originPrice;

    if (packageQuantity && packageUnit) {
      unitPrice = parseFloat((packagePrice / packageQuantity).toFixed(2));
    } else {
      unitPrice = packagePrice;
      packageQuantity = 1;
    }

    return {
      name,
      baseUnit,
      unitPrice,
      packageUnit,
      packageQuantity,
      packagePrice,
    };
  });
}
