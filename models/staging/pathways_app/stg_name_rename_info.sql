select
    CONCAT(
        SUBSTRING(full_name, 1, POSITION(' ' in full_name) - 1), ', ',
        SUBSTRING(full_name, POSITION(' ' in full_name) + 1, 1), '.'
    ) as shortened_name, 
    email,  
    age
from {{ ref('stg_fellows_info') }}
