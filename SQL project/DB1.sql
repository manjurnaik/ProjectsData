
CREATE TABLE users(
users_id number(5) CONSTRAINT users_pkk PRIMARY KEY,
name varchar(20) CONSTRAINT users_name_nnn NOT NULL,
email varchar(25) CONSTRAINT users_emai_ukk UNIQUE 
CONSTRAINT users_email_nnn NOT NULL,
phone_number number(10) CONSTRAINT users_phone_number_ukk UNIQUE);

CREATE TABLE posts(
post_id number(5) CONSTRAINT post_id_pk PRIMARY KEY,
users_id number(5) CONSTRAINT posts_users_id_nn NOT NULL CONSTRAINT posts_users_id_fk REFERENCES users(users_id),
image_url varchar(200),
caption varchar(20),
created_at DATE);

CREATE TABLE comments(
comment_id number(5) CONSTRAINT comment_id_pk PRIMARY KEY,
post_id number(5) CONSTRAINT comment_post_id_nn NOT NULL CONSTRAINT comment_post_id_fk REFERENCES posts(post_id),
users_id number(5) CONSTRAINT comment_users_id_nn NOT NULL CONSTRAINT comment_users_id_fk REFERENCES users(users_id),
comment_text varchar(25) CONSTRAINT comment_text_nn NOT NULL,
created_at DATE);

CREATE TABLE likes(
like_id number(5) CONSTRAINT like_id_pk PRIMARY KEY,
post_id number(5) CONSTRAINT like_post_id_nn NOT NULL CONSTRAINT like_post_id_pk REFERENCES posts(post_id),
users_id number(5) CONSTRAINT like_users_id_nn NOT NULL CONSTRAINT like_users_id_pk REFERENCES users(users_id),
created_at DATE
);

CREATE TABLE followers(
follower_id number(5) CONSTRAINT follower_id_pk PRIMARY KEY,
user_id number(5) CONSTRAINT follower_post_id_nn NOT NULL CONSTRAINT follower_post_id_fk REFERENCES posts(post_id),
follower_user_id number(5) CONSTRAINT follower_user_id_nn NOT NULL CONSTRAINT follower_user_id_fk REFERENCES users(users_id),
created_at DATE);

insert all
into users(users_id,name,email,phone_number) values(1,'John Smith', 'johnsmith@gmail.com', '1234567890')
into users(users_id,name,email,phone_number) values(2,'Jane Doe', 'janedoe@yahoo.com', '0987654321')
into users(users_id,name,email,phone_number) values(3,'Bob Johnson', 'bjohnson@gmail.com', '1112223333')
into users(users_id,name,email,phone_number) values(4,'Alice Brown', 'abrown@yahoo.com', NULL)
into users(users_id,name,email,phone_number) values(5,'Mike Davis', 'mdavis@gmail.com', '5556667777')
select * from dual;

alter table posts modify caption varchar(100);
desc posts;

insert all
into posts(post_id,users_id,image_url,caption,created_at) values(1,1, 'Beautiful sunset', '<https://www.example.com/sunset.jpg>','11-08-2024')
into posts(post_id,users_id,image_url,caption,created_at) values(2,2, 'My new puppy', '<https://www.example.com/puppy.jpg>','11-08-2024')
into posts(post_id,users_id,image_url,caption,created_at) values(3,3, 'Delicious pizza', '<https://www.example.com/pizza.jpg>','11-08-2024')
into posts(post_id,users_id,image_url,caption,created_at) values(4,4, 'Throwback to my vacation', '<https://www.example.com/vacation.jpg>','11-08-2024')
into posts(post_id,users_id,image_url,caption,created_at) values(5,5, 'Amazing concert', '<https://www.example.com/concert.jpg>','11-08-2024')
select * from dual;



alter table comments modify comment_text varchar(100);


insert all
into comments(comment_id,post_id,users_id,comment_text,created_at) values(1,1, 2, 'Wow! Stunning.','11-08-2024')
into comments(comment_id,post_id,users_id,comment_text,created_at) values(2,1, 3, 'Beautiful colors.','11-08-2024')
into comments(comment_id,post_id,users_id,comment_text,created_at) values(3,2, 1, 'What a cutie!','11-08-2024')
into comments(comment_id,post_id,users_id,comment_text,created_at) values(4,2, 4, 'Aww, I want one.','11-08-2024')
into comments(comment_id,post_id,users_id,comment_text,created_at) values(5,3, 5, 'Yum!','11-08-2024')
into comments(comment_id,post_id,users_id,comment_text,created_at) values(6,4, 1, 'Looks like an awesome trip.','11-08-2024')
into comments(comment_id,post_id,users_id,comment_text,created_at) values(7,5, 3, 'Wish I was there!','11-08-2024')
select * from dual;

insert all
into likes(like_id,post_id,users_id,created_at) values(1,1, 2,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(2,1, 4,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(3,2, 1,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(4,2, 3,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(5,3, 5,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(6,4, 1,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(7,4, 2,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(8,4, 3,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(9,5, 4,'11-08-2024')
into likes(like_id,post_id,users_id,created_at) values(10,5, 5,'11-08-2024')
select * from dual;

select * from likes;

insert all
into followers(follower_id,user_id,follower_user_id,created_at) values(1,1, 2,'11-08-2024')
into followers(follower_id,user_id,follower_user_id,created_at) values(2,2, 1,'11-08-2024')
into followers(follower_id,user_id,follower_user_id,created_at) values(3,1, 3,'11-08-2024')
into followers(follower_id,user_id,follower_user_id,created_at) values(4,3, 1,'11-08-2024')
into followers(follower_id,user_id,follower_user_id,created_at) values(5,1, 4,'11-08-2024')
into followers(follower_id,user_id,follower_user_id,created_at) values(6,4, 1,'11-08-2024')
into followers(follower_id,user_id,follower_user_id,created_at) values(7,1, 5,'11-08-2024')
into followers(follower_id,user_id,follower_user_id,created_at) values(8,5, 1,'11-08-2024')
select * from dual;

select * from followers;
desc followers;
commit;

select * from posts;

--- Updating caption of post_id
UPDATE posts
SET caption ='best pizza ever'
WHERE post_id = 3;

---Selecting all the post where user id is 1
SELECT *
FROM posts
WHERE users_id = 1;

-- Selecting all the posts and ordering them by created_at descending order
SELECT *
FROM posts
ORDER BY created_at DESC;

--Counting the number of likes for each posts display only the posts with more than 2 likes
SELECT p.post_id,count(l.like_id) as number_of_likes
FROM posts p INNER JOIN likes l
ON p.post_id=l.post_id
GROUP BY p.post_id
HAVING COUNT(l.like_id)>2;

--Find the total number of likes for all posts.
WITH CTE as(
SELECT p.post_id,count(l.like_id) as number_of_likes
FROM posts p INNER JOIN likes l
ON p.post_id=l.post_id
GROUP BY p.post_id)

SELECT SUM(number_of_likes) as total_likes
FROM CTE;

--Finding all the users who have commented on post_id 1
SELECT u.name 
FROM users u INNER JOIN comments c
ON u.users_id=c.users_id
where post_id=1;

---Ranking the posts based on the number of likes 
WITH cte as (
SELECT p.post_id,COUNT(l.like_id) as number_likes
FROM posts p INNER JOIN likes l 
ON p.post_id=l.post_id
GROUP BY p.post_id)


SELECT 
post_id,
number_likes,
DENSE_RANK() OVER(ORDER BY number_likes DESC) as rank
FROM cte;

---Find all the posts and thier comments Using Common table Expression (CTE)
WITH cte as
(SELECT p.post_id,p.caption,c.comment_text
FROM posts p JOIN comments c
ON p.post_id=c.post_id)

SELECT * 
FROM cte;

---Categorizing the posts based on the number of likes

WITH cte as (
SELECT p.post_id,COUNT(l.like_id) as number_likes
FROM posts p INNER JOIN likes l 
ON p.post_id=l.post_id
GROUP BY p.post_id)

SELECT 
    post_id,
    number_likes,
    CASE 
        WHEN number_likes <2 THEN 'low likes'
        WHEN number_likes=2 THEN 'few likes'
        WHEN number_likes>2 THEN 'lot of likes'
        ELSE 'no data'
    END AS like_category
FROM cte;

--
WITH cte as (
SELECT p.post_id,COUNT(l.like_id) as number_likes,p.created_at
FROM posts p INNER JOIN likes l 
ON p.post_id=l.post_id
GROUP BY p.post_id)


SELECT 
post_id,
number_likes,
SUM(number_likes) OVER(ORDER BY created_at ) as cumulative_likes
FROM cte;

commit;