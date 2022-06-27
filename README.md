Hello,

This is a non workable solution. 

THe only thing I was able to accomplish is to create the 3 docker instances needed (app-web, db and nginx) and load properly the data from the csv files to the database after creating the needed tables for that purpose.

To make it "run" just clone the project and run `docker-compose up`

The basic installation of laravel is there, thorugh not configure. I still need to configure nginx to act as reverse proxy to connect to my web app.

I was eager to code, but time flew by and I wanted to be honest and not go over the 3 hours.

I had in mind a couple ways to develop the proposed solution, following the SOLID principles. 

Creating to interact with the database (I like to use CAKE-ORM with Laravel) a set of Table/Entities and Repositories to interact with them, since the data can come from anywhere. Doing that using Interfaces.

To calculate the % that go to the merchants, we are still lacking some tables... but the money is represented as string and I would use this or a similar package (https://github.com/brick/money) for the calculations. Always storing the results as strings. There are some dicussions on it (https://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency)

I am not happy about this.. But cannot do more in 3 hours.

Thanks!

Juan Gimenez
neojoda@yahoo.es
