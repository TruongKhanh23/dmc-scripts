const branches = [
  {
    name: "",
    address: "13C đại lộ Đồng Khởi, khu phố 6, phường Phú Khương, TP. Bến Tre",
  },
  { name: "", address: "Số 68 Nguyễn Huệ, phường Bến Nghé, Quận 1" },
  { name: "", address: "417 Cộng Hòa, Phường 15, Tân Bình" },
  { name: "", address: "161 Ngô Tất Tố, Bình Thạnh" },
  {
    name: "",
    address: "71 Đ. Hậu Giang, Phường 5, Quận 6, Thành phố Hồ Chí Minh",
  },
  {
    name: "",
    address:
      "3/26 Quang Trung, Thị trấn Hóc Môn, Hóc Môn, Thành phố Hồ Chí Minh",
  },
  { name: "", address: "187 Lạc Long Quân, quận 11" },
  { name: "", address: "301 Nguyễn Đình Chiểu, quận 3" },
  { name: "", address: "129A Tân kỳ Tân Quý, Q. Tân Phú" },
  { name: "", address: "585 Quang Trung, P.11, Q. Gò Vấp" },
  {
    name: "",
    address:
      "194 Đường Cách Mạng Tháng 8, phường 10, Quận 3, Thành phố Hồ Chí Minh",
  },
  { name: "", address: "128 Thành Thái, Quận 10" },
  { name: "", address: "120 Lê Văn Sỹ, Phường 10, quận Phú Nhuận" },
  { name: "", address: "1200A Kha Vạn Cân, phường Linh Chiểu, TP. Thủ Đức" },
  { name: "", address: "172 Huỳnh Văn Bánh, phường 12, quận Phú Nhuận" },
  {
    name: "",
    address: "Số 7 Bình Long, phường Bình Hưng Hòa A, quận Bình Tân",
  },
  {
    name: "",
    address: "244 Thích Quảng Đức, Phú Cường, Thủ Dầu Một, Bình Dương",
  },
  { name: "", address: "17A Ngô Tất Tố, P.21, Q. Bình Thạnh" },
  { name: "", address: "308 Lê Văn Việt, Tăng Nhơn Phú, Thủ Đức (Quận 9 cũ)" },
  {
    name: "",
    address:
      "101 Thích Quảng Đức, Phú Cường, thành phố Thủ Dầu Một, Bình Dương",
  },
  { name: "", address: "6B Công Trường Quốc Tế (hồ con rùa), P.6, Q.3" },
  {
    name: "",
    address:
      "204 Hà Huy Giáp, phường Quyết Thắng, thành phố Biên Hoà, tỉnh Đồng Nai",
  },
  { name: "", address: "137A Nguyễn Hữu Cảnh, P22, Bình Thạnh" },
  { name: "", address: "Cà Phê Muối Chú Long - 67 Hậu Giang" },
  { name: "", address: "Cà Phê Muối Chú Long - 190 Huỳnh Văn Bánh" },
  {
    name: "",
    address:
      "102 Hoàng Hoa Thám, phường Thắng Tam, Thành phố Vũng Tàu, tỉnh Bà Rịa - Vũng Tàu",
  },
  {
    name: "",
    address:
      "108 Trần Hưng Đạo, phường An Nghiệp, quận Ninh Kiều, Thành phố Cần Thơ",
  },
  {
    name: "",
    address:
      "615 Cách Mạng Tháng 8, Khu phố 2, phường Long Toàn, Thành phố Bà Rịa",
  },
  {
    name: "",
    address:
      "884 Phú Riềng Đỏ, phường Tân Xuân, Thành phố Đồng Xoài, tình Bình Phước",
  },
  { name: "", address: "601 Cách Mạng Tháng 8, P.3, TP Tây Ninh" },
  {
    name: "",
    address: "Số 25 Trưng Nữ Vương, Phường 1, TP Vĩnh Long, Tỉnh Vĩnh Long",
  },
  { name: "", address: "404 Lê Văn Lương, Phường Tân Hưng, Quận 7, TPHCM" },
  {
    name: "",
    address: "Số 88 quốc lộ 62 , Phường 2 , Thành phố Tân An , Long An",
  },
  {
    name: "",
    address: "Số 32 đường Trần Hưng Đạo, Thành phố Phan Thiết, Bình Thuận",
  },
  { name: "", address: "Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom" },
  {
    name: "",
    address:
      "77/7A Khu Văn Hải, Long Thành, Đồng Nai ( Đối diện bưu điện Long Thành)",
  },
  { name: "", address: "330 Trương Định, Tương Mai, Hoàng Mai, Hà Nội" },
  { name: "", address: "17 Tôn Đức Thắng, Quốc Tử Giám, Đống Đa, Hà Nội" },
  { name: "", address: "472 Lê Duẩn, P. Chính Gián, Q. Thanh Khê, TP Đà Nẵng" },
  { name: "", address: "496 Hoàng Diệu, P.Bình Thuận, Q.Hải Châu, TP Đà Nẵng" },
  {
    name: "",
    address: "143 Liêu Bình Hương, Ấp Tân Lập, Xã Tân Thông Hội, Huyện Củ Chi",
  },
  { name: "", address: "371 Quang Trung, P.Trần Hưng Đạo, Quảng Ngãi" },
];

branches.forEach((branch) => {
  const address = branch.address;

  // Tách tên đường
  let street = address.split(",")[0].trim();
  street = street.replace(/^\s*\d+(?:[\/\-]?\d*[A-Za-z]?)?\s*/, "");

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
  const target = "Cà phê muối chú Long".toLowerCase();
  if (
    [street, district, city].some((part) => part.toLowerCase().includes(target))
  ) {
    if (street.toLowerCase().includes(target)) street = "";
    if (district.toLowerCase().includes(target)) district = "";
    if (city.toLowerCase().includes(target)) city = "";
  }

  // Kết hợp lại
  branch.name = [street, district, city].filter(Boolean).join(" - ");
});

console.log(branches);
