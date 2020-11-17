CREATE DATABASE mainzelliste;
CREATE ROLE mainzelliste WITH PASSWORD 'mainzelliste';
GRANT ALL PRIVILEGES ON DATABASE mainzelliste TO mainzelliste;
ALTER ROLE mainzelliste WITH LOGIN;