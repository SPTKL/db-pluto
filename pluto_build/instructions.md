# Instructions

## Create local Postgres-Postgis database
0. make sure you have docker installed
1. `docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgis/postgis:12-3.0-alpine`
> this will create a postgres/postgis docker container locally for development purposes

## Install DBT
0. navigate to `pluto_build`
1. create virtualenv `python -m virtualenv .venv`
2. activate virtualenv `source .venv/bin/activate`
3. install dependencies `pip install -r requirements.txt`
4. install dbt packages `dbt deps`

## Set up DBT profile
0. first time setup -> `touch ~/.dbt/profiles.yml`
1. add the following to the `profiles.yml`
```yml
nycplanning:
  target: pluto-dev
  outputs:
    pluto-dev:
      type: postgres
      host: localhost
      user: postgres
      password: postgres
      port: 5432
      dbname: postgres
      schema: public
      threads: 4
```

## Example Commands
1. `dbt run -s staging.stg_pts`

## Execution Order
1. you will still need to run `bash 01_dataloading.sh` to import source data
2. once dataloading is complete, you can then proceed to run dbt commands