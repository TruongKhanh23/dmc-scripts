export default function extractUniqueUnits(inventories) {
  const units = [];

  inventories.forEach(item => {
    if (item.baseUnit) units.push(item.baseUnit);
    if (item.packageUnit) units.push(item.packageUnit);
  });

  // Lọc trùng bằng Set và trả về mảng kết quả
  const uniqueUnits = [...new Set(units)];
  return uniqueUnits;
}