const branches = [
  {
    name: "Đại lộ Đồng Khởi - Bến Tre",
    address: "13C đại lộ Đồng Khởi, khu phố 6, phường Phú Khương, TP. Bến Tre",
  },
  {
    name: "Số 68 Nguyễn Huệ - Q.1",
    address: "Số 68 Nguyễn Huệ, phường Bến Nghé, Quận 1",
  },
  { name: "Cộng Hòa", address: "417 Cộng Hòa, Phường 15, Tân Bình" },
  { name: "Ngô Tất Tố", address: "161 Ngô Tất Tố, Bình Thạnh" },
  {
    name: "Đ. Hậu Giang - Q.6",
    address: "71 Đ. Hậu Giang, Phường 5, Quận 6, Thành phố Hồ Chí Minh",
  },
  {
    name: "Quang Trung",
    address:
      "3/26 Quang Trung, Thị trấn Hóc Môn, Hóc Môn, Thành phố Hồ Chí Minh",
  },
  {
    name: "Lạc Long Quân - Q.11",
    address: "187 Lạc Long Quân, quận 11",
  },
  {
    name: "Nguyễn Đình Chiểu - Q.3",
    address: "301 Nguyễn Đình Chiểu, quận 3",
  },
  {
    name: "Tân kỳ Tân Quý - Q.Tân Phú",
    address: "129A Tân kỳ Tân Quý, Q. Tân Phú",
  },
  {
    name: "Quang Trung - Q.Gò Vấp",
    address: "585 Quang Trung, P.11, Q. Gò Vấp",
  },
  {
    name: "Đường Cách Mạng Tháng 8 - Q.3",
    address:
      "194 Đường Cách Mạng Tháng 8, phường 10, Quận 3, Thành phố Hồ Chí Minh",
  },
  { name: "Thành Thái - Q.10", address: "128 Thành Thái, Quận 10" },
  {
    name: "Lê Văn Sỹ - Q.Phú Nhuận",
    address: "120 Lê Văn Sỹ, Phường 10, quận Phú Nhuận",
  },
  {
    name: "Kha Vạn Cân - Thủ Đức",
    address: "1200A Kha Vạn Cân, phường Linh Chiểu, TP. Thủ Đức",
  },
  {
    name: "Huỳnh Văn Bánh - Q.Phú Nhuận",
    address: "172 Huỳnh Văn Bánh, phường 12, quận Phú Nhuận",
  },
  {
    name: "Số 7 Bình Long - Q.Bình Tân",
    address: "Số 7 Bình Long, phường Bình Hưng Hòa A, quận Bình Tân",
  },
  {
    name: "Thích Quảng Đức",
    address: "244 Thích Quảng Đức, Phú Cường, Thủ Dầu Một, Bình Dương",
  },
  {
    name: "Ngô Tất Tố - Q.Bình Thạnh",
    address: "17A Ngô Tất Tố, P.21, Q. Bình Thạnh",
  },
  {
    name: "Lê Văn Việt - Q.9 cũ)",
    address: "308 Lê Văn Việt, Tăng Nhơn Phú, Thủ Đức (Quận 9 cũ)",
  },
  {
    name: "Thích Quảng Đức - Thủ Dầu Một",
    address:
      "101 Thích Quảng Đức, Phú Cường, thành phố Thủ Dầu Một, Bình Dương",
  },
  {
    name: "Công Trường Quốc Tế (hồ con rùa) - Q.3",
    address: "6B Công Trường Quốc Tế (hồ con rùa), P.6, Q.3",
  },
  {
    name: "Hà Huy Giáp - Biên Hoà",
    address:
      "204 Hà Huy Giáp, phường Quyết Thắng, thành phố Biên Hoà, tỉnh Đồng Nai",
  },
  {
    name: "Nguyễn Hữu Cảnh",
    address: "137A Nguyễn Hữu Cảnh, P22, Bình Thạnh",
  },
  { name: "", address: "Cà Phê Muối Chú Long - 67 Hậu Giang" },
  { name: "", address: "Cà Phê Muối Chú Long - 190 Huỳnh Văn Bánh" },
  {
    name: "Hoàng Hoa Thám - Vũng Tàu",
    address:
      "102 Hoàng Hoa Thám, phường Thắng Tam, Thành phố Vũng Tàu, tỉnh Bà Rịa - Vũng Tàu",
  },
  {
    name: "Trần Hưng Đạo - Q.Ninh Kiều - Cần Thơ",
    address:
      "108 Trần Hưng Đạo, phường An Nghiệp, quận Ninh Kiều, Thành phố Cần Thơ",
  },
  {
    name: "Cách Mạng Tháng 8 - Bà Rịa",
    address:
      "615 Cách Mạng Tháng 8, Khu phố 2, phường Long Toàn, Thành phố Bà Rịa",
  },
  {
    name: "Phú Riềng Đỏ - Đồng Xoài",
    address:
      "884 Phú Riềng Đỏ, phường Tân Xuân, Thành phố Đồng Xoài, tình Bình Phước",
  },
  {
    name: "Cách Mạng Tháng 8 - Tây Ninh",
    address: "601 Cách Mạng Tháng 8, P.3, TP Tây Ninh",
  },
  {
    name: "Số 25 Trưng Nữ Vương - Vĩnh Long",
    address: "Số 25 Trưng Nữ Vương, Phường 1, TP Vĩnh Long, Tỉnh Vĩnh Long",
  },
  {
    name: "Lê Văn Lương - HCM",
    address: "404 Lê Văn Lương, Phường Tân Hưng, Quận 7, TPHCM",
  },
  {
    name: "Số 88 quốc lộ 62 - Tân An",
    address: "Số 88 quốc lộ 62 , Phường 2 , Thành phố Tân An , Long An",
  },
  {
    name: "Số 32 đường Trần Hưng Đạo - Phan Thiết",
    address: "Số 32 đường Trần Hưng Đạo, Thành phố Phan Thiết, Bình Thuận",
  },
  {
    name: "Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom",
    address: "Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom",
  },
  {
    name: "Khu Văn Hải",
    address:
      "77/7A Khu Văn Hải, Long Thành, Đồng Nai ( Đối diện bưu điện Long Thành)",
  },
  {
    name: "Trương Định",
    address: "330 Trương Định, Tương Mai, Hoàng Mai, Hà Nội",
  },
  {
    name: "Tôn Đức Thắng",
    address: "17 Tôn Đức Thắng, Quốc Tử Giám, Đống Đa, Hà Nội",
  },
  {
    name: "Lê Duẩn - Q.Thanh Khê - Đà Nẵng",
    address: "472 Lê Duẩn, P. Chính Gián, Q. Thanh Khê, TP Đà Nẵng",
  },
  {
    name: "Hoàng Diệu - Q.Hải Châu - Đà Nẵng",
    address: "496 Hoàng Diệu, P.Bình Thuận, Q.Hải Châu, TP Đà Nẵng",
  },
  {
    name: "Liêu Bình Hương",
    address: "143 Liêu Bình Hương, Ấp Tân Lập, Xã Tân Thông Hội, Huyện Củ Chi",
  },
  {
    name: "Quang Trung",
    address: "371 Quang Trung, P.Trần Hưng Đạo, Quảng Ngãi",
  },
];
