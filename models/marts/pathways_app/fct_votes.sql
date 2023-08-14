{{
    config(
        materialized='view'
    )
}}

with apps as (
    select * from {{ ref('stg_reformatted_app') }}
), 

votes as (
    select count(*) as count, pathway_choice from apps where pathway_choice ilike '%finance%' group by pathway_choice
    UNION 
    select count(*) as count, pathway_choice from apps where pathway_choice ilike '%advanced%' group by pathway_choice
    UNION
    select count(*) as count, pathway_choice from apps where pathway_choice ilike '%prometheus%' group by pathway_choice
),

final as (
    select * from votes 
)

select * from final