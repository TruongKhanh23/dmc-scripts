-- 1. Tạo một dòng mới trong positions với code mới (nếu chưa có)
INSERT INTO public.positions (id, created_by, updated_by, created_at, updated_at, deleted, code, name, description)
SELECT 
    substr(md5(random()::text), 1, 24) AS id,  -- Tạo id ngẫu nhiên từ MD5
    created_by,  -- Giữ nguyên người tạo cũ
    updated_by,  -- Giữ nguyên người cập nhật cũ
    created_at,  -- Giữ nguyên thời gian tạo cũ
    updated_at,  -- Giữ nguyên thời gian cập nhật cũ
    deleted,     -- Giữ nguyên trạng thái xóa
    'branch_manager' AS code,  -- Sử dụng code mới
    name,  -- Giữ nguyên tên vị trí cũ
    description  -- Giữ nguyên mô tả cũ
FROM public.positions
WHERE code = 'branchManager'
ON CONFLICT DO NOTHING;

-- 2. Cập nhật bảng phụ sang code mới
UPDATE public.position_accesses
SET position_code = 'branch_manager'
WHERE position_code = 'branchManager';

UPDATE public.roles
SET position_code = 'branch_manager'
WHERE position_code = 'branchManager';

-- 3. Sau cùng mới xóa dòng cũ trong positions
DELETE FROM public.positions
WHERE code = 'branchManager';
