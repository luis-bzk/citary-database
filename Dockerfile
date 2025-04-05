FROM postgres:15

ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=root
ENV POSTGRES_DB=my_database_pg

# Ejecuta estos scripts en orden
COPY ./core.sql /docker-entrypoint-initdb.d/core.sql
COPY ./data.sql /docker-entrypoint-initdb.d/data.sql
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql