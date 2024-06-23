# Setting Up PostgreSQL Database with Docker

## Prerequisites
Ensure Docker is installed on your system. You can download and install Docker from [Docker's official website](https://www.docker.com/products/docker-desktop/).

Steps
1. Pull PostgreSQL Docker Image: Pull the latest PostgreSQL image from Docker Hub:
`docker pull postgres`

2. Run PostgreSQL Container
`docker run --name car_dealership_db -e POSTGRES_PASSWORD=password -d car_dealership_db`

3. Then Verify the Container is Running
`docker ps`

You should see your my_postgres container listed.

4. Connect to PostgreSQL Database
`docker exec -it my_postgres psql -U postgres`

### There should be 4 datatables in car_dealership database: Car, Customer, Salesperson, Transactions
