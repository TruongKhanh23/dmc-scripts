DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Đại lộ Đồng Khởi - Bến Tre' OR address = '13C đại lộ Đồng Khởi, khu phố 6, phường Phú Khương, TP. Bến Tre'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Đại lộ Đồng Khởi - Bến Tre',
      '13C đại lộ Đồng Khởi, khu phố 6, phường Phú Khương, TP. Bến Tre'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Số 68 Nguyễn Huệ - Q.1' OR address = 'Số 68 Nguyễn Huệ, phường Bến Nghé, Quận 1'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Số 68 Nguyễn Huệ - Q.1',
      'Số 68 Nguyễn Huệ, phường Bến Nghé, Quận 1'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Cộng Hòa' OR address = '417 Cộng Hòa, Phường 15, Tân Bình'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Cộng Hòa',
      '417 Cộng Hòa, Phường 15, Tân Bình'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Ngô Tất Tố' OR address = '161 Ngô Tất Tố, Bình Thạnh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Ngô Tất Tố',
      '161 Ngô Tất Tố, Bình Thạnh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Đ. Hậu Giang - Q.6' OR address = '71 Đ. Hậu Giang, Phường 5, Quận 6, Thành phố Hồ Chí Minh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Đ. Hậu Giang - Q.6',
      '71 Đ. Hậu Giang, Phường 5, Quận 6, Thành phố Hồ Chí Minh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Quang Trung' OR address = '3/26 Quang Trung, Thị trấn Hóc Môn, Hóc Môn, Thành phố Hồ Chí Minh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Quang Trung',
      '3/26 Quang Trung, Thị trấn Hóc Môn, Hóc Môn, Thành phố Hồ Chí Minh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Lạc Long Quân - Q.11' OR address = '187 Lạc Long Quân, quận 11'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Lạc Long Quân - Q.11',
      '187 Lạc Long Quân, quận 11'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Nguyễn Đình Chiểu - Q.3' OR address = '301 Nguyễn Đình Chiểu, quận 3'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Nguyễn Đình Chiểu - Q.3',
      '301 Nguyễn Đình Chiểu, quận 3'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Tân kỳ Tân Quý - Q.Tân Phú' OR address = '129A Tân kỳ Tân Quý, Q. Tân Phú'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Tân kỳ Tân Quý - Q.Tân Phú',
      '129A Tân kỳ Tân Quý, Q. Tân Phú'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Quang Trung - Q.Gò Vấp' OR address = '585 Quang Trung, P.11, Q. Gò Vấp'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Quang Trung - Q.Gò Vấp',
      '585 Quang Trung, P.11, Q. Gò Vấp'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Đường Cách Mạng Tháng 8 - Q.3' OR address = '194 Đường Cách Mạng Tháng 8, phường 10, Quận 3, Thành phố Hồ Chí Minh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Đường Cách Mạng Tháng 8 - Q.3',
      '194 Đường Cách Mạng Tháng 8, phường 10, Quận 3, Thành phố Hồ Chí Minh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Thành Thái - Q.10' OR address = '128 Thành Thái, Quận 10'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Thành Thái - Q.10',
      '128 Thành Thái, Quận 10'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Lê Văn Sỹ - Q.Phú Nhuận' OR address = '120 Lê Văn Sỹ, Phường 10, quận Phú Nhuận'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Lê Văn Sỹ - Q.Phú Nhuận',
      '120 Lê Văn Sỹ, Phường 10, quận Phú Nhuận'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Kha Vạn Cân - Thủ Đức' OR address = '1200A Kha Vạn Cân, phường Linh Chiểu, TP. Thủ Đức'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Kha Vạn Cân - Thủ Đức',
      '1200A Kha Vạn Cân, phường Linh Chiểu, TP. Thủ Đức'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Huỳnh Văn Bánh - Q.Phú Nhuận' OR address = '172 Huỳnh Văn Bánh, phường 12, quận Phú Nhuận'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Huỳnh Văn Bánh - Q.Phú Nhuận',
      '172 Huỳnh Văn Bánh, phường 12, quận Phú Nhuận'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Số 7 Bình Long - Q.Bình Tân' OR address = 'Số 7 Bình Long, phường Bình Hưng Hòa A, quận Bình Tân'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Số 7 Bình Long - Q.Bình Tân',
      'Số 7 Bình Long, phường Bình Hưng Hòa A, quận Bình Tân'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Thích Quảng Đức' OR address = '244 Thích Quảng Đức, Phú Cường, Thủ Dầu Một, Bình Dương'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Thích Quảng Đức',
      '244 Thích Quảng Đức, Phú Cường, Thủ Dầu Một, Bình Dương'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Ngô Tất Tố - Q.Bình Thạnh' OR address = '17A Ngô Tất Tố, P.21, Q. Bình Thạnh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Ngô Tất Tố - Q.Bình Thạnh',
      '17A Ngô Tất Tố, P.21, Q. Bình Thạnh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Lê Văn Việt - Q.9 cũ)' OR address = '308 Lê Văn Việt, Tăng Nhơn Phú, Thủ Đức (Quận 9 cũ)'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Lê Văn Việt - Q.9 cũ)',
      '308 Lê Văn Việt, Tăng Nhơn Phú, Thủ Đức (Quận 9 cũ)'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Thích Quảng Đức - Thủ Dầu Một' OR address = '101 Thích Quảng Đức, Phú Cường, thành phố Thủ Dầu Một, Bình Dương'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Thích Quảng Đức - Thủ Dầu Một',
      '101 Thích Quảng Đức, Phú Cường, thành phố Thủ Dầu Một, Bình Dương'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Công Trường Quốc Tế (hồ con rùa) - Q.3' OR address = '6B Công Trường Quốc Tế (hồ con rùa), P.6, Q.3'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Công Trường Quốc Tế (hồ con rùa) - Q.3',
      '6B Công Trường Quốc Tế (hồ con rùa), P.6, Q.3'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Hà Huy Giáp - Biên Hoà' OR address = '204 Hà Huy Giáp, phường Quyết Thắng, thành phố Biên Hoà, tỉnh Đồng Nai'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Hà Huy Giáp - Biên Hoà',
      '204 Hà Huy Giáp, phường Quyết Thắng, thành phố Biên Hoà, tỉnh Đồng Nai'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Nguyễn Hữu Cảnh' OR address = '137A Nguyễn Hữu Cảnh, P22, Bình Thạnh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Nguyễn Hữu Cảnh',
      '137A Nguyễn Hữu Cảnh, P22, Bình Thạnh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = '' OR address = 'Cà Phê Muối Chú Long - 67 Hậu Giang'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      '',
      'Cà Phê Muối Chú Long - 67 Hậu Giang'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = '' OR address = 'Cà Phê Muối Chú Long - 190 Huỳnh Văn Bánh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      '',
      'Cà Phê Muối Chú Long - 190 Huỳnh Văn Bánh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Hoàng Hoa Thám - Vũng Tàu' OR address = '102 Hoàng Hoa Thám, phường Thắng Tam, Thành phố Vũng Tàu, tỉnh Bà Rịa - Vũng Tàu'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Hoàng Hoa Thám - Vũng Tàu',
      '102 Hoàng Hoa Thám, phường Thắng Tam, Thành phố Vũng Tàu, tỉnh Bà Rịa - Vũng Tàu'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Trần Hưng Đạo - Q.Ninh Kiều - Cần Thơ' OR address = '108 Trần Hưng Đạo, phường An Nghiệp, quận Ninh Kiều, Thành phố Cần Thơ'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Trần Hưng Đạo - Q.Ninh Kiều - Cần Thơ',
      '108 Trần Hưng Đạo, phường An Nghiệp, quận Ninh Kiều, Thành phố Cần Thơ'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Cách Mạng Tháng 8 - Bà Rịa' OR address = '615 Cách Mạng Tháng 8, Khu phố 2, phường Long Toàn, Thành phố Bà Rịa'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Cách Mạng Tháng 8 - Bà Rịa',
      '615 Cách Mạng Tháng 8, Khu phố 2, phường Long Toàn, Thành phố Bà Rịa'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Phú Riềng Đỏ - Đồng Xoài' OR address = '884 Phú Riềng Đỏ, phường Tân Xuân, Thành phố Đồng Xoài, tình Bình Phước'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Phú Riềng Đỏ - Đồng Xoài',
      '884 Phú Riềng Đỏ, phường Tân Xuân, Thành phố Đồng Xoài, tình Bình Phước'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Cách Mạng Tháng 8 - Tây Ninh' OR address = '601 Cách Mạng Tháng 8, P.3, TP Tây Ninh'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Cách Mạng Tháng 8 - Tây Ninh',
      '601 Cách Mạng Tháng 8, P.3, TP Tây Ninh'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Số 25 Trưng Nữ Vương - Vĩnh Long' OR address = 'Số 25 Trưng Nữ Vương, Phường 1, TP Vĩnh Long, Tỉnh Vĩnh Long'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Số 25 Trưng Nữ Vương - Vĩnh Long',
      'Số 25 Trưng Nữ Vương, Phường 1, TP Vĩnh Long, Tỉnh Vĩnh Long'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Lê Văn Lương - HCM' OR address = '404 Lê Văn Lương, Phường Tân Hưng, Quận 7, TPHCM'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Lê Văn Lương - HCM',
      '404 Lê Văn Lương, Phường Tân Hưng, Quận 7, TPHCM'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Số 88 quốc lộ 62 - Tân An' OR address = 'Số 88 quốc lộ 62 , Phường 2 , Thành phố Tân An , Long An'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Số 88 quốc lộ 62 - Tân An',
      'Số 88 quốc lộ 62 , Phường 2 , Thành phố Tân An , Long An'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Số 32 đường Trần Hưng Đạo - Phan Thiết' OR address = 'Số 32 đường Trần Hưng Đạo, Thành phố Phan Thiết, Bình Thuận'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Số 32 đường Trần Hưng Đạo - Phan Thiết',
      'Số 32 đường Trần Hưng Đạo, Thành phố Phan Thiết, Bình Thuận'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom' OR address = 'Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom',
      'Cà Phê Muối Chú Long - Trạm Dừng Chân Trảng Bom'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Khu Văn Hải' OR address = '77/7A Khu Văn Hải, Long Thành, Đồng Nai ( Đối diện bưu điện Long Thành)'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Khu Văn Hải',
      '77/7A Khu Văn Hải, Long Thành, Đồng Nai ( Đối diện bưu điện Long Thành)'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Trương Định' OR address = '330 Trương Định, Tương Mai, Hoàng Mai, Hà Nội'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Trương Định',
      '330 Trương Định, Tương Mai, Hoàng Mai, Hà Nội'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Tôn Đức Thắng' OR address = '17 Tôn Đức Thắng, Quốc Tử Giám, Đống Đa, Hà Nội'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Tôn Đức Thắng',
      '17 Tôn Đức Thắng, Quốc Tử Giám, Đống Đa, Hà Nội'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Lê Duẩn - Q.Thanh Khê - Đà Nẵng' OR address = '472 Lê Duẩn, P. Chính Gián, Q. Thanh Khê, TP Đà Nẵng'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Lê Duẩn - Q.Thanh Khê - Đà Nẵng',
      '472 Lê Duẩn, P. Chính Gián, Q. Thanh Khê, TP Đà Nẵng'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Hoàng Diệu - Q.Hải Châu - Đà Nẵng' OR address = '496 Hoàng Diệu, P.Bình Thuận, Q.Hải Châu, TP Đà Nẵng'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Hoàng Diệu - Q.Hải Châu - Đà Nẵng',
      '496 Hoàng Diệu, P.Bình Thuận, Q.Hải Châu, TP Đà Nẵng'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Liêu Bình Hương' OR address = '143 Liêu Bình Hương, Ấp Tân Lập, Xã Tân Thông Hội, Huyện Củ Chi'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Liêu Bình Hương',
      '143 Liêu Bình Hương, Ấp Tân Lập, Xã Tân Thông Hội, Huyện Củ Chi'
    );
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM public.branches
    WHERE name = 'Quang Trung' OR address = '371 Quang Trung, P.Trần Hưng Đạo, Quảng Ngãi'
  ) THEN
    INSERT INTO public.branches (
      id, created_by, updated_by, created_at, updated_at, deleted, name, address
    )
    VALUES (
      substr(md5(random()::text), 1, 24),
      'admin',
      'admin',
      now(),
      now(),
      false,
      'Quang Trung',
      '371 Quang Trung, P.Trần Hưng Đạo, Quảng Ngãi'
    );
  END IF;
END
$$;

SELECT * FROM public.branches