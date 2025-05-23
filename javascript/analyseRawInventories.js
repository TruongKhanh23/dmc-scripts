import rawInventories from "../data/inventories_raw.js";

function capitalizeWords(str) {
  return str
    .toLowerCase()
    .split(" ")
    .map(word => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");
}

export function analyseRawInventories() {
  const exceptPackageUnit = ["CHAI"];

  function capitalizeWords(str) {
    return str
      .toLowerCase()
      .split(" ")
      .map(word => word.charAt(0).toUpperCase() + word.slice(1))
      .join(" ");
  }

  return rawInventories.map((item) => {
    const originalName = item.inventoryName;
    const originUnit = item.originUnit;
    const originPrice = item.originPrice;

    const unitInBracketMatch = originalName.match(/\(([^)]+)\)/);
    const analyseUnit = unitInBracketMatch
      ? unitInBracketMatch[1].trim()
      : originUnit;

    const name = originalName.replace(/\s*\([^)]*\)\s*/g, "").trim();

    let [beforeSlash, afterSlash] = analyseUnit.includes("/")
      ? analyseUnit.split("/").map((s) => s.trim())
      : ["", ""];

    let packageQuantity = null;
    let baseUnit = "";
    let packageUnit = "";
    let unitPrice;

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
      baseUnit = unitMatch ? unitMatch[0].trim().toLowerCase() : "";
      packageUnit = (afterSlash || originUnit.trim()).toLowerCase();
    } else if (!unitInBracketMatch && !originUnit.includes("/")) {
      const quantity = parseQuantity(originUnit);
      const unitMatch = originUnit.match(/[^\d,.]+/);

      if (quantity) {
        packageQuantity = quantity;
        baseUnit = unitMatch ? unitMatch[0].trim().toLowerCase() : "";
        packageUnit = exceptPackageUnit.includes(baseUnit.toUpperCase())
          ? baseUnit
          : "kiện";
      } else {
        packageQuantity = 1;
        baseUnit = originUnit.trim().toLowerCase();
        packageUnit = baseUnit;
      }
    } else {
      baseUnit = originUnit.trim().toLowerCase();
      packageQuantity = 1;
      packageUnit = originUnit.trim().toLowerCase();
    }

    const packagePrice = originPrice;

    if (packageQuantity && packageUnit) {
      unitPrice = parseFloat((packagePrice / packageQuantity).toFixed(2));
    } else {
      unitPrice = packagePrice;
      packageQuantity = 1;
    }

    return {
      name: capitalizeWords(name),
      baseUnit,
      unitPrice,
      packageUnit,
      packageQuantity,
      packagePrice,
    };
  });
}
