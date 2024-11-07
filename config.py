from pathlib import Path

from sqlmesh.dbt.loader import sqlmesh_config

config = sqlmesh_config(Path(__file__).parent, variables={"DUCKDB_FILE_PATH":"./shared/db/datamart.duckdb",
"INPUT_FILES_PATH":"./shared/parquet"})

