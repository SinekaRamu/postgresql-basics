--DDL scripts

CREATE DATABASE instaclone;
\connect instaclone;

CREATE TABLE users(
    userid SERIAL PRIMARY KEY NOT NULL, 
    username VARCHAR NOT NULL
    );
CREATE TABLE posts(
    postid SERIAL PRIMARY KEY NOT NULL, 
    postcontent VARCHAR NOT NULL, 
    postdate DATE NOT NULL DEFAULT CURRENT_DATE, 
    userid SERIAL REFERENCES users(userid)
    );
CREATE TABLE likes(
    likeid SERIAL PRIMARY KEY NOT NULL, 
    postid SERIAL REFERENCES posts(postid),
    userid SERIAL REFERENCES users(userid)
    );

INSERT INTO users(username) VALUES('Edina'),('Colin'),('Glenda'),('Paula');
INSERT INTO posts(postcontent, userid) VALUES('craft',1),('sale',1),('design',1),('tips',1),('lesson',1);
INSERT INTO posts(postcontent, userid) VALUES('Animal',2),('Cartoon',2),('Gift',1),('Meme',2),('Craft',2);
INSERT INTO posts(postcontent, userid) VALUES('Forest',3),('Bike Sale',3),('Book',3),('Award',3),('Comedy',3);
INSERT INTO posts(postcontent, userid) VALUES('Gold',4),('Awarness',4),('Experiments',4),('Land Sale',4),('Tricks',4);
INSERT INTO likes(postid, userid) VALUES(13, 3),(13,4),(13,1),(13,2),(14,1),(14,2),(15,4),(15,2),(17,3),(17,1),(19,3),
(19,2),(1,4),(1,3),(4,3),(4,4),(4,2),(7,3),(7,4),(7,1),(7,2),(8,4),(8,1),(9,4),(9,1),(9,3);

-- DML scripts

-- 1. list all users 
SELECT * from users;

-- 2. list all posts 
SELECT * from posts;

-- 3. List posts that are liked by colin select posts.postcontent as likedByColin from posts left join likes on posts.postid = likes.postid where likes.userid = 2;
select posts.postcontent as likedByColin from posts left join likes on posts.postid = likes.postid where likes.userid = 2;

-- 4. As a Glenda, she wants to know who are all liked her post book. select users.username as liked_glenda_post from users inner join likes on users.userid=likes.userid where likes.postid=13;
select users.username as liked_glenda_post from users inner join likes on users.userid=likes.userid where likes.postid=13;

-- 5. Edina needs to know the post count which are liked by others.
SELECT COUNT(DISTINCT posts.postid)
FROM posts inner join likes on posts.postid=likes.postid where posts.userid = 1;

-- 6. Paula needs to check the count of awarness and trickes likes count, here awarness id is 17 and trickes id is 20.
SELECT COUNT(likes.likeid)
FROM likes where likes.postid = 17 or likes.postid=20;

--here we checked the likes for awarness-17 and landsale-19.

SELECT COUNT(likes.likeid) as sum_of_posts
FROM likes where likes.postid = 17 or likes.postid=19;

-- 7. List Posts of Edina which has likes and also not liked posts.
SELECT posts.postcontent as PostOfEdina FROM posts where posts.userid = 1;

-- 8. Search all users posts with Text "sal" The LIKE operator is case sensitive, if you want to do a case insensitive search, use the ILIKE operator instead.
SELECT * FROM posts
WHERE posts.postcontent ILIKE '%sal%';

-- 9. Get the count of colin posts
SELECT COUNT(posts.postid) AS no_of_colin_post FROM posts
WHERE  posts.userid=2;

-- 10. Get count of likes for the post cartoon. user colin
select COUNT(likes.likeid) AS cartoon_likes from likes where likes.postid = 7;

-- 11. Get the maximum likes posts.
select postid, count(postid) from likes GROUP BY postid HAVING COUNT(postid)>1 order by count(postid) desc limit 2;

-- 12. In Edina, sort posts by title in forward. post content is ordered by ascending order for the user edina.
select * from posts where userid=1 ORDER BY postcontent;

-- 13. In Paula, sort post by date backward.
select * from posts where userid=4 ORDER BY postdate DESC;

-- 14. Filter today posted posts.
select * from posts where postdate= 'today';
