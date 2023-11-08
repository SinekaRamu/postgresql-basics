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
