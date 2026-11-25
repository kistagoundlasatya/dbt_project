select
    id as emp_id,
    initcap(trim(name)) as full_name,
    current_date() as current_date,
    current_user() as username
from dd
