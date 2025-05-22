import rawInventories from "../data/inventories_raw.js";

export function analyseRawInventories() {
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

    // Bước 3: Phân tích beforeSlash
    let packageQuantity = null;
    let baseUnit = "";
    if (beforeSlash) {
      const quantityMatch = beforeSlash.match(/[\d.]+/); // hỗ trợ số thập phân
      const unitMatch = beforeSlash.match(/[^\d.]+/);

      packageQuantity = quantityMatch ? parseFloat(quantityMatch[0]) : null;
      baseUnit = unitMatch ? unitMatch[0].trim() : "";
    } else {
      baseUnit = originUnit.trim();
    }

    // Bước 4: packageUnit
    const packageUnit = afterSlash ? afterSlash.trim() : originUnit.trim();

    // Bước 5: packagePrice
    const packagePrice = originPrice;

    // Bước 6: unitPrice
    let unitPrice;
    if (packageQuantity && packageUnit) {
      unitPrice = parseFloat((packagePrice / packageQuantity).toFixed(2));
    } else {
      unitPrice = packagePrice;
      packageQuantity = 1; // ✅ Nếu unitPrice = packagePrice thì packageQuantity = 1
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
