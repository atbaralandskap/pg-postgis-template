
# pg-postgis-template

A minimal, opinionated template for PostgreSQL + PostGIS projects,
designed for reproducible GIS and spatial analysis workflows in R.

## What this repo is
- A reusable project skeleton
- A standard schema layout (`staging`, `core`, `out`, `meta`)
- SQL bootstraps for PostGIS-enabled databases
- R helpers for clean database connections

## What this repo is NOT
- A database dump
- A data repository
- Project-specific analysis

## Intended workflow
1. Create a new PostgreSQL database (one per project)
2. Enable PostGIS
3. Run the SQL files in `sql/`
4. Use R as the primary interface for loading, transforming, and analysing data

Raw data, credentials, and outputs are intentionally excluded.
