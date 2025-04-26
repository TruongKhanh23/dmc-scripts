-- Step 1: Insert into positions
WITH inserted_position AS (
    INSERT INTO public.positions (
        id, created_by, updated_by, created_at, updated_at, deleted,
        name, code, description
    ) VALUES (
        substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
        'Manager', 'MGR', 'Position for managers'
    )
    RETURNING code
),

-- Step 2: Insert into roles using position_code from positions
inserted_role AS (
    INSERT INTO public.roles (
        id, created_by, updated_by, created_at, updated_at, deleted,
        name, description, position_code
    ) SELECT
        substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
        'Admin Role', 'Role with admin permissions', ip.code
    FROM inserted_position ip
    RETURNING id
)

-- Step 3: Insert into users using role_id from roles
INSERT INTO public.users (
    id, created_by, updated_by, created_at, updated_at, deleted,
    fullname, username, password, role_id, status, last_login_at, refresh_token
)
SELECT
    substr(md5(random()::text), 1, 24), 'admin', 'admin', NOW(), NOW(), FALSE,
    'Nguyen Van A', 'nguyenvana', 'hashedpassword', ir.id, 'ACTIVE', NULL, NULL
FROM inserted_role ir;
