FROM python:3.11

RUN apt-get install git make automake gcc g++ subversion

RUN git clone -n --depth=1 --filter=tree:0 https://github.com/nmirson-ml/wolt_interview.git /datamart

WORKDIR /datamart

RUN git sparse-checkout set --no-cone wolt_data_model

RUN git checkout

WORKDIR /datamart/wolt_data_model

RUN pip install uv

COPY sqlmesh-dbt/requirements.txt sqlmesh-dbt/config.py /datamart/wolt_data_model/

RUN uv pip install --system -r requirements.txt

RUN dbt deps

CMD ["sqlmesh", "ui", "--host", "0.0.0.0"]
