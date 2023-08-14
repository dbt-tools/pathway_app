with apps as (
    select * from {{ ref('stg_reformatted_app') }}
),

fellows as (
    select * from {{ ref('stg_name_rename_info') }}
),

apps_with_fellow_in_data_eng as (
    select * from apps left join fellows using(email)
    where PATHWAY_CHOICE LIKE 'F%'
    order by TECH_STRENGTH
),

final as (
    select * from apps_with_fellow_in_data_eng
)

select * from final 