select
    EMAIL_ADDRESS as email, 
    CONCAT(
        SUBSTRING(name, 1, POSITION(' ' in name) - 1), ', ',
        SUBSTRING(name, POSITION(' ' in name) + 1, 1), '.'
    ) as shortened_name
from {{ source('google_sheets', 'raw') }}