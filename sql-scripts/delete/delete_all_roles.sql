-- 1. Gỡ liên kết role_id ở users, trừ role cần giữ
UPDATE public.users
SET role_id = NULL
WHERE role_id IN (
    SELECT id FROM public.roles
    WHERE NOT (name = 'Lập trình viên' AND position_code = 'administrator')
);

-- 2. Xóa role_branches của các roles không cần giữ
DELETE FROM public.role_branches
WHERE role_id IN (
    SELECT id FROM public.roles
    WHERE NOT (name = 'Lập trình viên' AND position_code = 'administrator')
);

-- 3. Xóa position_accesses không phải của administrator
DELETE FROM public.position_accesses
WHERE position_code != 'administrator';

-- 4. Xóa các roles không phải 'Lập trình viên' + 'administrator'
DELETE FROM public.roles
WHERE NOT (name = 'Lập trình viên' AND position_code = 'administrator');

-- 5. Xóa các positions không phải administrator
DELETE FROM public.positions
WHERE code != 'administrator';

-- 6. Xóa các branches không còn được gắn với role còn lại
DELETE FROM public.branches
WHERE id NOT IN (
    SELECT DISTINCT branch_id FROM public.role_branches
);
