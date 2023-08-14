select fellow_name as full_name, age, email from {{ source('google_sheets', 'fellow_info') }} 
