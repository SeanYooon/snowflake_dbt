{{ config(materialized='table') }}

with raw as (
  select
    PROVINCE,
    YEAR,
    CATEGORY,
    TOTAL_ALL_CATEGORIES as total_spending,
    POPULATION_K::float        as population_k,
    nullif(SPENDING, '—')::float           as spending
  from {{ source('cihi','HEALTH_SPENDING_RAW') }}
)

select
  PROVINCE                as province,
  YEAR                    as year,
  CATEGORY                as category,
  total_spending,
  population_k,
  spending,
  spending / population_k as spending_per_capita,
  lag(spending / population_k)
    over (partition by PROVINCE, CATEGORY order by YEAR)
    as prev_spending_pc
from raw
where CATEGORY     is not null
  and spending     is not null
  and population_k is not null
