SELECT
  u.id AS user_id,
  u.full_name,
  u.username,
  u.status,
  u.last_login_at,
  
  r.id AS role_id,
  r.name AS role_name,
  r.description AS role_description,
  
  p.code AS position_code,
  p.name AS position_name,
  p.description AS position_description,
  
  pa.feature_code,
  pa.permission,
  
  rb.branch_id
  
FROM users u
LEFT JOIN roles r ON u.role_id = r.id
LEFT JOIN positions p ON r.position_code = p.code
LEFT JOIN position_accesses pa ON pa.position_code = p.code
LEFT JOIN role_branches rb ON rb.role_id = r.id

WHERE u.deleted = false
  AND r.deleted = false
  AND p.deleted = false
  AND pa.deleted = false
  AND rb.deleted = false;
