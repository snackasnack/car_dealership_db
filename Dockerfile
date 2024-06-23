# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Add the database initialization script to the Docker image
COPY init-db.sh /docker-entrypoint-initdb.d/

# Ensure the initialization script has execution permissions
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh
