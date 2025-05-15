-- Xóa dữ liệu liên quan trước (nếu có khóa ngoại đến branch_id)
DELETE FROM public.expenses;
DELETE FROM public.incomes;
DELETE FROM public.shift_reports;
DELETE FROM public.role_branches;

-- Sau cùng mới xóa các chi nhánh
DELETE FROM public.branches;
