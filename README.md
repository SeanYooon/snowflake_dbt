# Heart Disease Analytics Pipeline

## Overview  
Built with **dbt Cloud** & **Snowflake**, this project implements a production-grade, three-layer analytics pipeline to analyze heart disease metrics by age.

**Workflow**:  
1. Load raw data (`heart.csv`) into Snowflake  
2. Clean & standardize in staging (`stg_heart`)  
3. Aggregate metrics by age in mart (`heart_summary`)  

## Key Features  
- Modular SQL models in dbt  
- Automated tests: `not_null`, `accepted_values`, `not_empty`  
- Single-command run: `dbt build`  
- Auto-generated documentation via `dbt docs`  
- Version-controlled in GitHub  

## Repository Structure  
```
.
├── dbt_project.yml         # dbt config
├── README.md               # Project overview
└── models
    ├── sources.yml         # Raw source definitions
    ├── staging
    │   ├── stg_heart.sql   # Cleans raw data
    │   └── schema.yml      # Tests & docs for staging
    └── marts
        ├── heart_summary.sql  # Aggregates metrics
        └── schema.yml         # Tests & docs for mart
```

## Getting Started

1. **Clone**  
   ```
   git clone https://github.com/SeanYooon/Snowflake_dbt.git
   cd Snowflake_dbt
   ```

2. **Install dependencies**  
   ```
   dbt deps
   ```

3. **Connect to Snowflake**  
   In dbt Cloud’s **Connection Settings**, ensure:
   - Account: `NDYZXFF-AU40622`  
   - Database: `ANALYTICS_DB`  
   - Warehouse: `COMPUTE_WH`  
   - Role: `SYSADMIN`  

4. **Run Pipeline**  
   ```
   dbt build
   dbt docs generate
   dbt docs serve
   ```

## Results  
- **STG_HEART**: cleansed table in `DBT_SYOON_STAGING`  
- **HEART_SUMMARY**: aggregated metrics table in `DBT_SYOON_MARTS`  
- Tests all pass, and docs site displays model lineage & descriptions

## Next Steps  
- Extend to incremental models or snapshots  
- Add demographic breakdowns (gender, chest pain type)  
- Build a BI dashboard using `heart_summary`

---

_Add this project to your portfolio:_  
**[Data Analysis Portfolio](https://github.com/SeanYooon/Data-Analysis-Portfolio)**

Sources
