#!/bin/bash
set -e

# Perform all actions as the postgres user
export PGUSER=postgres

# Create the car_dealership database
psql <<- EOSQL
    CREATE DATABASE car_dealership;
EOSQL

# 
psql -d car_dealership <<- EOSQL
    CREATE TABLE Car (
        serial_number VARCHAR(100) PRIMARY KEY,
        manufacturer VARCHAR(100) NOT NULL,
        model_name VARCHAR(100) NOT NULL,
        weight NUMERIC(10, 2) NOT NULL,
        price NUMERIC(10, 2) NOT NULL
    );

    CREATE TABLE Customer (
        customer_id SERIAL PRIMARY KEY,
        customer_name VARCHAR(100) NOT NULL,
        customer_phone VARCHAR(15) NOT NULL
    );

    CREATE TABLE Salesperson (
        salesperson_id SERIAL PRIMARY KEY,
        salesperson_name VARCHAR(100) NOT NULL
    );

    CREATE TABLE Transaction (
        transaction_id SERIAL PRIMARY KEY,
        transaction_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        customer_id INT NOT NULL,
        salesperson_id INT NOT NULL,
        car_serial_number VARCHAR(100) NOT NULL,
        FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
        FOREIGN KEY (salesperson_id) REFERENCES Salesperson(salesperson_id),
        FOREIGN KEY (car_serial_number) REFERENCES Car(serial_number)
    );
EOSQL
