# Juan Bautista Gimenez Sendiu - Exercise project

TODO
Laravel Project
Mysql and Ngix exposed ports are 4306 and 8081 due having running native db and apache on my machine


# How to run this project

Clone the project 
    git clone git@github.com:neojoda/sequra-exercise.git

Run the docker instance
    docker-compose build
    docker-compose up

Initialize the Database schema and data (For simplicity pwd is root.)
    docker exec -it db bash
    mysql -u root -p < init-db.sql 
    exit



 