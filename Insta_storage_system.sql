--                                    Instagram Users Storage DBMS                                    --   
-- 1. Create Database  
create database if not exists Instagram;
use Instagram;

-- 2. create table for data store 

create table if not exists UserProfile(
UserId int primary key,
userName VARCHAR(50),
email VARCHAR(100)
);

create table if not exists UserFriends(
followerId int primary key,
followerName varchar(50),
UserId int);

create table if not exists UserPosts(
postId int primary key,
userId int,
caption varchar(100));

create table if not exists Userlogin(
UserId int primary key,
loginUserName varchar(50),
loginPassword varchar(12));

create table if not exists UserLikes(
PostId int primary key,
UserId varchar(50)
);

-- 3.check table are created or not
show tables;

-- 4. Insert data into tables
 
 INSERT INTO UserProfile(userId, userName, email)
 VALUES
 (1, "riti", "abc@gmail.com"),
 (2, "raj", "xyz@gmail.com"),
 (3, "rahul", "abc2@gmail.com");
 
 insert into UserFriends(followerId, followerName,UserId)
 values
 (100,'Durgesh Yadav', 1),
 (200,'vivek yadav', 1),
 (300,'shivank singh', 2);
 
 insert into userposts(postid,userid,caption)
 values
 (101,1,'light'),
 (102,2,'air'),
 (103,3,'water');
 
insert into userlogin(userid,loginusername,loginpassword)
values
(3,'Rahul','abc'),
(2,'Raj','bca'),
(1,'Riti','xyz');

insert into userlikes(postId,userid)
values 
(12,102),
(30,103);

-- 5. show all tables with data

select * from userprofile;
select * from userfriends;
select * from userposts;
select * from userlogin;
select * from userlikes;

-- 6 show all table in single table
SELECT 
    up.UserId,
    up.userName,
    up.email,
    ul.loginUserName,
    ul.loginPassword,
    uf.followerId,
    uf.followerName,
    upo.postId,
    upo.caption,
    ukl.PostId AS LikedPostId,
    ukl.UserId AS LikedByUser
FROM UserProfile up
LEFT JOIN UserLogin ul ON up.UserId = ul.UserId
LEFT JOIN UserFriends uf ON up.UserId = uf.UserId
LEFT JOIN UserPosts upo ON up.UserId = upo.UserId
LEFT JOIN UserLikes ukl ON upo.postId = ukl.PostId;
 
-- ********************************** END PROJECT ************************************************** -- 
