{{ config(materialized='table') }}

with staged as (
  select * from {{ ref('stg_health_spending') }}
)

select
  province,
  year,
  category,
  sum(total_spending)        as total_spending,
  avg(spending_per_capita)   as avg_spending_per_capita,
  avg(prev_spending_pc)      as avg_prev_spending_pc
from staged
group by province, year, category
