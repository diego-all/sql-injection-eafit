# FROM postgres:12.5-alpine
FROM --platform=linux/amd64 postgres:12.5-alpine

COPY up.sql /docker-entrypoint-initdb.d/1.sql

CMD ["postgres"]