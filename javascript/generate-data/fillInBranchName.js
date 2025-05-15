import branches from "../../data/branchesWithoutName.js"

function capitalizeFirstLetter(str) {
  if (!str) return str;
  return str.charAt(0).toUpperCase() + str.slice(1);
}

export function fillInBranchName() {
branches.forEach((branch) => {
  const address = branch.address;

  // Tách tên đường
  let street = address.split(",")[0].trim();
  street = street.replace(/^\s*(Số\s*)?\d+(?:[\/\-]?\d*[A-Za-z]?)?\s*/, "");

  street = capitalizeFirstLetter(street);

  // Tách quận (sau "Q." hoặc "Quận", đến trước dấu phẩy)
  const districtMatch = address.match(/(?:Quận|Q\.)\s*([^,]+)/i);
  let district = districtMatch ? "Q." + districtMatch[1].trim() : "";

  // Tách thành phố (sau "TP" hoặc "Thành phố")
  const cityMatch = address.match(/(?:TP\.?|Thành phố)\s*([^,]+)/i);
  let city =
    cityMatch && cityMatch[1].trim() !== "Hồ Chí Minh"
      ? cityMatch[1].trim()
      : "";

  // Nếu bất kỳ phần nào chứa "Cà phê muối chú Long" thì gán phần đó bằng rỗng
  const target = "Cà phê muối chú Long - ".toLowerCase();
  if (
    [street, district, city].some((part) => part.toLowerCase().includes(target))
  ) {
    if (street.toLowerCase().includes(target)) street = street.replace(new RegExp(target, "ig"), "").trim();
    if (district.toLowerCase().includes(target)) district = district.replace(new RegExp(target, "ig"), "").trim();
    if (city.toLowerCase().includes(target)) city = city.replace(new RegExp(target, "ig"), "").trim();
  }

  // Kết hợp lại
  branch.name = [street, district, city].filter(Boolean).join(" - ");
});
  return branches;
}