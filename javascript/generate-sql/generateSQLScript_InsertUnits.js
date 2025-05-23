export default function generateSQLInsertUnit(units) {
  const inserts = units.map(unit => {
    return `
INSERT INTO public.units (id, created_by, updated_by, created_at, updated_at, deleted, name, symbol)
SELECT
  substr(md5(random()::text), 1, 24) AS id,
  'admin' AS created_by,
  'admin' AS updated_by,
  now() AS created_at,
  now() AS updated_at,
  false AS deleted,
  '${unit.name.replace(/'/g, "''")}' AS name,
  '${unit.symbol.replace(/'/g, "''")}' AS symbol
WHERE NOT EXISTS (
  SELECT 1 FROM public.units
  WHERE name = '${unit.name.replace(/'/g, "''")}' OR symbol = '${unit.symbol.replace(/'/g, "''")}'
);
`.trim();
  }).join('\n\n');

  return inserts + `\n\nSELECT * FROM public.units;\n`;
}


// Ví dụ gọi hàm:
const units = [
  { name: "gram", symbol: "g" },
  { name: "bịch", symbol: "bịch" },
  { name: "hộp", symbol: "hộp" },
  { name: "lon", symbol: "lon" },
  { name: "hủ", symbol: "hủ" },
  { name: "gói", symbol: "gói" },
  { name: "kiện", symbol: "kiện" },
  { name: "chai", symbol: "chai" },
  { name: "túi", symbol: "túi" },
  { name: "thùng", symbol: "thùng" },
  { name: "kg", symbol: "kg" },
  { name: "bao", symbol: "bao" },
];
