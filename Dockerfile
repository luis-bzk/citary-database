FROM postgres:15

ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=root
ENV POSTGRES_DB=my_database_pg

COPY core.sql data.sql views.sql init.sql /docker-entrypoint-initdb.d/
