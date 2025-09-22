{{ config(materialized='table') }}

with staged as (
  select * from {{ ref('stg_health_spending') }}
)

select
  province,
  year,
  category,
  sum(total_spending) as total_spending,
  avg(spending_per_capita) as avg_spending_per_capita,
  avg(yoy_pct_change)            as avg_yoy_pct_change
from staged
group by province, year, category
