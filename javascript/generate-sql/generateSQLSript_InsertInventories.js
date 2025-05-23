export default function generateSQLInsertInventories(inventories) {
  let sql = '';

  inventories.forEach(item => {
    const name = item.name.replace(/'/g, "''");
    const baseUnit = item.baseUnit.replace(/'/g, "''");
    const packageUnit = item.packageUnit.replace(/'/g, "''");

    sql += `
-- Insert nếu chưa có name '${name}'
INSERT INTO public.inventories (
  id, created_by, updated_by, created_at, updated_at, deleted, name,
  base_unit_id, unit_price, package_unit_id, package_quantity, package_price
)
SELECT
  substr(md5(random()::text), 1, 24) as id,
  'admin' as created_by,
  'admin' as updated_by,
  now() as created_at,
  now() as updated_at,
  false as deleted,
  '${name}' as name,
  -- Lấy base_unit_id từ units
  (SELECT id FROM public.units WHERE name = '${baseUnit}' OR symbol = '${baseUnit}' LIMIT 1) as base_unit_id,
  ${item.unitPrice} as unit_price,
  -- Lấy package_unit_id từ units
  (SELECT id FROM public.units WHERE name = '${packageUnit}' OR symbol = '${packageUnit}' LIMIT 1) as package_unit_id,
  ${item.packageQuantity} as package_quantity,
  ${item.packagePrice} as package_price
WHERE NOT EXISTS (
  SELECT 1 FROM public.inventories WHERE name = '${name}' AND deleted = false
);
`;
  });

  sql += `
-- Xem dữ liệu inventories sau khi insert
SELECT
  i.id,
  i.name,
  i.package_price,
  pu.name  AS packageUnitName,
  i.package_quantity,
  bu.name  AS baseUnitName,
  i.unit_price,
  i.created_by,
  i.updated_by,
  i.created_at,
  i.updated_at,
  i.deleted
FROM public.inventories i
LEFT JOIN public.units bu ON i.base_unit_id = bu.id
LEFT JOIN public.units pu ON i.package_unit_id = pu.id
WHERE i.deleted = false
ORDER BY i.created_at DESC;
`;

  return sql;
}
