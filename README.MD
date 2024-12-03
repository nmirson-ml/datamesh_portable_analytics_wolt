# Portable Data Stack with SQLMesh

This application is a containerized Analytics suite for analyzing the data from Wolt-Snack-Store project.


## Stack

- Docker (docker compose)
- DuckDB
- SQLMesh using dbt adapter
- Superset

## Interested in the data model?

The data model is based on the [wolt_snack_store](https://github.com/nmirson-ml/wolt_interview) project, which simulates a snack store's transactional data. The model follows a star schema design with fact and dimension tables to analyze customer purchases, items, promotions and time-based patterns.


![Data Model](resources/data_model.png "Data Model")


### Used as starting point were these two projects:

* [postcard-company-datamart](https://github.com/cnstlungu/postcard-company-datamart)
* [portable-data-stack-sqlmesh](https://github.com/cnstlungu/portable-data-stack-sqlmesh)


### System requirements
* [Docker](https://docs.docker.com/engine/install/)

## Setup

1. Rename `.env.example` file to `.env` and set your desired Superset password.

2. Rename `shared/db/datamart.duckdb.example` to `shared/db/datamart.duckdb` or init an empty database file there with that name.

3. With **Docker engine** installed, change directory to the root folder of the project (also the one that contains docker-compose.yml) and run

    `docker compose up --build`

4. Once the Docker suite has finished loading, open up [SQLMesh Web UI](http://localhost:8000)

5. To explore the data and build dashboards you can open the [Superset interface](http://localhost:8088)


### Demo Credentials

Demo credentials are set in the .env file mentioned above. 

### Ports exposed locally
* SQLMesh: 8000
* Superset: 8088

The data comes from the CSV files shared in Wolt-Snack-Store project. 

### General flow

1. The data is modelled, building fact and dimension tables, loading the Data Warehouse using SqlMesh (with the dbt adapter for model compatibility)
2. Analyze and visually explore the data using Superset or directly querying the datamart via the SQL IDE provided by SQLMesh

For superset, the default credentials are set in the .env file: user = admin, password = admin


## Overview of architecture

The docker process will begin building the application suite. The suite is made up of the following components, each within its own docker container:
* **sqlmesh-dbt**: the data model, sourced from [wolt_snack_store](https://github.com/nmirson-ml/wolt_interview) project
* **superset**: this contains the web-based Business Intelligence application we will use to explore the data; exposed on port 8088.


After the DAGs have completed you can either analyze the data using the querying and visualization tools provided by Superset (available locally on port 8088), or query the Data Warehouse (available as a DuckDB Database)

![Apache Superset](resources/superset.png "Superset")