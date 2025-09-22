#  Heart Disease Analytics Pipeline

## Overview  
This project implements a **production-style analytics workflow** using **dbt Cloud** and **Snowflake** to analyze heart disease metrics by age.  

The pipeline follows a three-layer architecture:  
1. **Raw** → load CSV data (`heart.csv`) into Snowflake  
2. **Staging** → clean & standardize into a dbt staging model (`stg_heart`)  
3. **Mart** → aggregate metrics by age into a mart table (`heart_summary`)  

---

## Key Features  
- **Layered dbt models**: raw → staging → marts  
- **Automated testing** with `not_null`, `accepted_values`, and `not_empty` checks  
- **Single-command run** with `dbt build`  
- **Auto-generated documentation** and lineage graph via `dbt docs`  
- **Version-controlled** in GitHub with CI/CD integration  

---

## Architecture  

 **Raw Layer**
   └── ANALYTICS_DB.RAW.HEART_RAW  (CSV source)

**Staging Layer**
   └── stg_heart.sql → cleanses raw columns, enforces types

**Mart Layer**
   └── heart_summary.sql → aggregates cholesterol & cases by age


⸻

Repository Structure
```
.
├── dbt_project.yml         # dbt project config
├── README.md               # Project overview
└── models
    ├── sources.yml         # Defines HEART_RAW as a dbt source
    ├── staging
    │   ├── stg_heart.sql   # Cleans raw data
    │   └── schema.yml      # Tests & docs for staging
    └── marts
        ├── heart_summary.sql  # Aggregates metrics by age
        └── schema.yml         # Tests & docs for mart

```
⸻

Getting Started

**1. Clone the repository**
```bash
git clone https://github.com/SeanYooon/Snowflake_dbt.git
cd Snowflake_dbt
```
**2. Install dependencies (if running locally)**

dbt deps

**3. Connect to Snowflake in dbt Cloud**

Configure your connection settings:
	•	Account: NDYZXFF-AU40622
	•	Database: ANALYTICS_DB
	•	Warehouse: COMPUTE_WH
	•	Role: SYSADMIN
	•	Schema: your personal dev schema (e.g., DBT_SYOON)

4. Run the pipeline
```bash
dbt build
dbt docs generate
dbt docs serve
```

⸻

Results
	•	**STG_HEART** → standardized staging table
	•	**HEART_SUMMARY** → aggregated mart table (avg cholesterol & case counts by age)
	•	All models tested and documented with lineage graph

