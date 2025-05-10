DO $$ 
DECLARE
  v_shift_report_id varchar := 'ls8xac6ol87d8m339tsgp691';  -- Chuỗi ID không phải UUID
BEGIN

  -- Xóa từ bảng sold_products
  DELETE FROM public.sold_products
  WHERE shift_report_id = v_shift_report_id;

  -- Xóa từ bảng expenses
  DELETE FROM public.expenses
  WHERE shift_report_id = v_shift_report_id;

  -- Xóa từ bảng incomes
  DELETE FROM public.incomes
  WHERE shift_report_id = v_shift_report_id;

  -- Xóa từ bảng shift_reports
  DELETE FROM public.shift_reports
  WHERE id = v_shift_report_id;

END $$;

SELECT * FROM public.shift_reports;