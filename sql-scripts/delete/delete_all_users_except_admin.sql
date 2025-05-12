-- 1. Xóa tất cả người dùng khác trừ admin
DELETE FROM public.users WHERE username <> 'admin';

-- 2. Xóa các bản ghi phụ thuộc đến user khác
DELETE FROM public.role_branches
WHERE role_id IN (
    SELECT id FROM public.roles WHERE created_by <> 'admin'
);

DELETE FROM public.roles WHERE created_by <> 'admin';

DELETE FROM public.position_accesses WHERE created_by <> 'admin';

DELETE FROM public.positions WHERE created_by <> 'admin';

DELETE FROM public.branches WHERE created_by <> 'admin';
