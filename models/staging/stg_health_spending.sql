{{ config(materialized='table') }}

with raw as (
  select * from {{ source('cihi', 'HEALTH_SPENDING_RAW') }}
)

select
  PROVINCE                   as province,
  YEAR                       as year,
  CATEGORY                   as category,
  TOTAL_ALL_CATEGORIES       as total_spending,
  POPULATION_K::float        as population_k,
  SPENDING::float            as spending,
  SPENDING / POPULATION_K    as spending_per_capita,
  lag(SPENDING / POPULATION_K)
    over (partition by PROVINCE, CATEGORY order by YEAR)
    as prev_spending_pc
from raw
