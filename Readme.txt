# Customer Support KPI Analytics

## Overview
This project analyzes customer support data using Databricks-style SQL.
It focuses on calculating key performance indicators (KPIs) such as
repeat contact rate, resolution time, and channel distribution.

## Data Sources
- cases.csv: Support ticket details
- calls.csv: Call interaction data
- messages.csv: Chat/email message data

## Architecture
This project follows a Medallion Architecture approach:
- Bronze Layer: Raw CSV data
- Silver Layer: Cleaned and enriched data
- Gold Layer: KPI aggregations
## Silver Layer
The Silver layer cleans raw Bronze data and enriches it with
derived metrics such as resolution time and case aging using
Databricks-style SQL.
## Gold Layer (KPIs)
The Gold layer aggregates business KPIs from the Silver layer, including:
- Total cases
- Repeat contact rate
- Average resolution time
- Channel-wise case distribution
- Daily case trends

These KPIs help stakeholders measure customer support performance
and identify improvement areas.



## Tools Used
- Databricks-style SQL
- Excel (for data creation)
- GitHub

## Business Value
The analysis helps support teams identify repeat issues,
optimize resolution time, and improve customer experience.
