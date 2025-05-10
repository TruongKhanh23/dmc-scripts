-- 1. Xóa các record phụ thuộc trước
DELETE FROM public.sold_products
WHERE shift_report_id IN (SELECT id FROM public.shift_reports);

DELETE FROM public.expenses
WHERE shift_report_id IN (SELECT id FROM public.shift_reports);

DELETE FROM public.incomes
WHERE shift_report_id IN (SELECT id FROM public.shift_reports);

-- 2. Xóa shift reports
DELETE FROM public.shift_reports;

SELECT * FROM public.shift_reports;