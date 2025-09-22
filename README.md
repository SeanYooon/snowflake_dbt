# Heart Disease Analytics Pipeline


## Overview  
A three-layer analytics workflow built with **dbt Cloud** and **Snowflake** to derive heart disease metrics by age.

## Key Features  
- Modular dbt models (staging & mart layers)  
- Automated testing:  
  - **Staging**: `not_null` (age, heart_disease_flag, cholesterol), `accepted_values` (heart_disease_flag)  
  - **Mart**: `not_empty` (heart_summary)  
- **Single-command run**: `dbt build`  
- **Auto-generated docs**: `dbt docs serve`  
- Version control & CI in dbt Cloud

## Architecture  
1. **Raw**: CSV (`heart.csv`) → `ANALYTICS_DB.RAW.HEART_RAW`  
2. **Staging** (`DBT_SYOON_STAGING`):  
   - `stg_heart.sql` cleans & standardizes raw data  
3. **Mart** (`DBT_SYOON_MARTS`):  
   - `heart_summary.sql` aggregates average cholesterol & positive cases by age  

## Repository Structure  
```
.
├── dbt_project.yml
├── README.md
└── models
    ├── sources.yml
    ├── staging
    │   ├── stg_heart.sql
    │   └── schema.yml
    └── marts
        ├── heart_summary.sql
        └── schema.yml
```

## Getting Started

1. **Clone**  
   ```bash
   git clone https://github.com/SeanYooon/snowflake_dbt.git
   cd snowflake_dbt
   ```

2. **In dbt Cloud**  
   - Your connection to Snowflake is already configured (Account: `NDYZXFF-AU40622`, Database: `ANALYTICS_DB`, Warehouse: `COMPUTE_WH`, Role: `SYSADMIN`)  
   - No local `profiles.yml` needed  

3. **Run Pipeline**  
   ```bash
   dbt build
   dbt docs generate
   dbt docs serve
   ```

## Results  
- **STG_HEART**: cleansed staging table  
- **HEART_SUMMARY**: aggregated mart table  
- All tests pass and docs visualize model lineage.  


