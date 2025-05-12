const html = `
<h3 class="name-news">13C đại lộ Đồng Khởi, khu phố 6, phường Phú Khương, TP. Bến Tre </h3>
<h3 class="name-news">Số 68 Nguyễn Huệ, phường Bến Nghé, Quận 1</h3>
<h3 class="name-news">417 Cộng Hòa, Phường 15, Tân Bình</h3>
<h3 class="name-news">161 Ngô Tất Tố, Bình Thạnh</h3>
<h3 class="name-news">71 Đ. Hậu Giang, Phường 5, Quận 6, Thành phố Hồ Chí Minh</h3>
<h3 class="name-news">3/26 Quang Trung, Thị trấn Hóc Môn, Hóc Môn, Thành phố Hồ Chí Minh</h3>
<h3 class="name-news">187 Lạc Long Quân, quận 11</h3>
<h3 class="name-news">301 Nguyễn Đình Chiểu, quận 3</h3>
<h3 class="name-news">129A Tân kỳ Tân Quý, Q. Tân Phú</h3>
<h3 class="name-news">585 Quang Trung, P.11, Q. Gò Vấp</h3>
<h3 class="name-news">194 Đường Cách Mạng Tháng 8, phường 10, Quận 3, Thành phố Hồ Chí Minh</h3>
<h3 class="name-news">128 Thành Thái, Quận 10</h3>
<h3 class="name-news">120 Lê Văn Sỹ, Phường 10, quận Phú Nhuận</h3>
<h3 class="name-news">1200A Kha Vạn Cân, phường Linh Chiểu, TP. Thủ Đức&nbsp;</h3>
<h3 class="name-news"> 172 Huỳnh Văn Bánh, phường 12, quận Phú Nhuận </h3>
<h3 class="name-news">Số 7 Bình Long, phường Bình Hưng Hòa A, quận Bình Tân</h3>
<h3 class="name-news">244 Thích Quảng Đức, Phú Cường, Thủ Dầu Một, Bình Dương</h3>
<h3 class="name-news"> 17A Ngô Tất Tố, P.21, Q. Bình Thạnh</h3>
<h3 class="name-news">308 Lê Văn Việt, Tăng Nhơn Phú, Thủ Đức (Quận 9 cũ)</h3>
<h3 class="name-news"> 101 Thích Quảng Đức, Phú Cường, thành phố Thủ Dầu Một, Bình Dương</h3>
<h3 class="name-news">6B Công Trường Quốc Tế (hồ con rùa), P.6, Q.3</h3>
<h3 class="name-news"> 204 Hà Huy Giáp, phường Quyết Thắng, thành phố Biên Hoà, tỉnh Đồng Nai</h3>
<h3 class="name-news">137A Nguyễn Hữu Cảnh, P22, Bình Thạnh</h3>
<h3 class="name-news">Cà Phê Muối Chú Long - 67 Hậu Giang</h3>
<h3 class="name-news">Cà Phê Muối Chú Long - 190 Huỳnh Văn Bánh</h3>
<h3 class="name-news">102 Hoàng Hoa Thám, phường Thắng Tam, Thành phố Vũng Tàu, tỉnh Bà Rịa - Vũng Tàu</h3>
<h3 class="name-news">108 Trần Hưng Đạo, phường An Nghiệp, quận Ninh Kiều, Thành phố Cần Thơ</h3>
<h3 class="name-news">615 Cách Mạng Tháng 8, Khu phố 2, phường Long Toàn, Thành phố Bà Rịa</h3>
<h3 class="name-news">884 Phú Riềng Đỏ, phường Tân Xuân, Thành phố Đồng Xoài, tình Bình Phước</h3>
<h3 class="name-news">601 Cách Mạng Tháng 8, P.3, TP Tây Ninh</h3>
<h3 class="name-news">Số 25 Trưng Nữ Vương, Phường 1, TP Vĩnh Long, Tỉnh Vĩnh Long</h3>
<h3 class="name-news">404 Lê Văn Lương, Phường Tân Hưng, Quận 7, TPHCM </h3>
<h3 class="name-news">Số 88 quốc lộ 62 , Phường 2 , Thành phố Tân An , Long An</h3>
<h3 class="name-news">Số 32 đường Trần Hưng Đạo, Thành phố Phan Thiết, Bình Thuận</h3>
<h3 class="name-news">Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom</h3>
<h3 class="name-news">77/7A Khu Văn Hải, Long Thành,&nbsp;Đồng Nai ( Đối diện bưu điện Long Thành)&nbsp;</h3>
<h3 class="name-news">330 Trương Định, Tương Mai, Hoàng Mai, Hà Nội</h3>
<h3 class="name-news">17 Tôn Đức Thắng, Quốc Tử Giám, Đống Đa, Hà Nội </h3>
<h3 class="name-news">472 Lê Duẩn, P. Chính Gián, Q. Thanh Khê, TP Đà Nẵng</h3>
<h3 class="name-news"> 496 Hoàng Diệu, P.Bình Thuận, Q.Hải Châu, TP Đà Nẵng</h3>
<h3 class="name-news">143 Liêu Bình Hương, Ấp Tân Lập, Xã Tân Thông Hội, Huyện Củ Chi</h3>
<h3 class="name-news">371 Quang Trung, P.Trần Hưng Đạo, Quảng Ngãi</h3>

`;

const branches = [];
const regex = /<h3 class="name-news">(.*?)<\/h3>/g;
let match;

while ((match = regex.exec(html)) !== null) {
  branches.push({
    name: "", // hoặc null nếu bạn muốn
    address: match[1].trim()
  });
}

console.log(branches);
