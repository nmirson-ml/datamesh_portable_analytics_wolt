FROM apache/superset:3.1.3 

ARG SUPERSET_ADMIN
ARG SUPERSET_PASSWORD
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG SUPERSET_SECRET_KEY
# Switching to root to install the required packages
USER root

RUN pip install uv

RUN uv pip install --system duckdb-engine==0.13.0 duckdb==1.0.0

# Run the initialization script before starting Superset
# RUN python init_duckdb.py

USER superset
RUN superset fab create-admin \
              --username ${SUPERSET_ADMIN} \
              --firstname Superset \
              --lastname Admin \
              --email admin@example.com \
              --password ${SUPERSET_PASSWORD}
RUN superset db upgrade
RUN superset init

RUN superset set_database_uri -d DW  -u duckdb:///superset_home/db/datamart.duckdb
# Point to the in-memory copy instead of the original
# RUN superset set_database_uri -d DW -u duckdb:///app/superset_home/db/superset_memory.duckdb