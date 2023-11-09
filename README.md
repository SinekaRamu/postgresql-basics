# postgresql-basics
postgresql is the database that we are using to store the values from the API.

## setup postgresql
we pull the database from the docker and run the database in the dbeaver.
- first, install the docker and postgresql
- then, docker pull postgres

## postgres setup in docker
- create the container to run postgres
- start the container
- run the container
- start the postgres using the command 'psql -U postgres'

## Create Database
- To create database, `CREATE DATABASE instaclone`
- To connect the database, `\c instaclone`
- Now, add the database in the dbeaver, with the instaclone database name.
- In this database, we are going to create the tables for users, posts, likes.
- To create users table, `CREATE TABLE users(userid SERIAL PRIMARY KEY NOT NULL, username VARCHAR NOT NULL);`
- To create posts table, `CREATE TABLE posts(postid SERIAL PRIMARY KEY NOT NULL, postcontent VARCHAR NOT NULL, postdate DATE NOT NULL DEFAULT CURRENT_DATE, userid SERIAL REFERENCES users(userid));`
- To create likes table, `CREATE TABLE likes(likeid SERIAL PRIMARY KEY NOT NULL, postid SERIAL REFERENCES posts(postid),userid SERIAL REFERENCES users(userid))`
- To insert the information into the table use the command,
  - `INSERT INTO users(username) VALUES('Edina'),('Colin'),('Glenda'),('Paula')`
  - 1-Edina, 2-Colin, 3-Glenda, 4-Paula
  - `INSERT INTO posts(postcontent, userid) VALUES('craft',1),('sale',1),('design',1),('tips',1),('lesson',1)`
  - 1-Crafts-1, 2-sale-1, 3-design, 4-tips, 5-lesson, 6-animal, 7-cartoon, 8-gift, 9-meme, 10-craft, 11-forest, 12-bikesale, 13-book, 14-award, 15-comedy, 16-gold, 17-awarness, 18-Experiments, 19-landsale, 20-tricks.
  - `INSERT INTO likes(postid, userid) VALUES(13, 3),(13,4),(13,1),(13,3),(14,1),(14,2),(15,4),(15,2),(17,3),(17,1),(19,3),(19,2),(1,4),(1,3),(4,3),(4,4),(4,2),(7,3),(7,4),(7,1),(7,2),(8,4),(8,1),(9,4),(9,1),(9,3)`
 
  ## Data Querying DML

  - 1. list all users `SELECT * from users;`
```
instaclone=# SELECT * from users;
 userid | username
--------+----------
      1 | Edina
      2 | Colin
      3 | Glenda
      4 | Paula
```
- 2. list all posts `SELECT * from posts;`
```
instaclone=# SELECT * from posts

 postid | postcontent |  postdate  | userid
--------+-------------+------------+--------
      1 | Craft       | 2023-11-08 |      1
      2 | Sale        | 2023-11-08 |      1
      3 | Design      | 2023-11-08 |      1
      4 | Tips        | 2023-11-08 |      1
      5 | Lesson      | 2023-11-08 |      1
      6 | Animal      | 2023-11-08 |      2
      7 | Cartoon     | 2023-11-08 |      2
      8 | Gift        | 2023-11-08 |      2
      9 | Meme        | 2023-11-08 |      2
     10 | Craft       | 2023-11-08 |      2
     11 | Forest      | 2023-11-08 |      3
     12 | BikeSale    | 2023-11-08 |      3
     13 | Book        | 2023-11-08 |      3
     14 | Award       | 2023-11-08 |      3
     15 | Comedy      | 2023-11-08 |      3
     16 | Gold        | 2023-11-08 |      4
     17 | Awarness    | 2023-11-08 |      4
     18 | Experiments | 2023-11-08 |      4
     19 | LandSale    | 2023-11-08 |      4
     20 | Tricks      | 2023-11-08 |      4
(20 rows)
```
