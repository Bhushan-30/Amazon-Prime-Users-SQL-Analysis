-- how to create database
create database Amazon;

-- how to use database
use Amazon;

-- how to see all tables in database 
show tables;

-- how to see all records from the table
select * from updated_amazon_prime_users;

-- total number of users
select count(*) as Total_users
from updated_amazon_prime_users;

-- most used devices
select `Devices Used`,count(*) as `Number of Users`
from `updated_amazon_prime_users`
group by `Devices Used`
order by `Number of Users` desc;

-- subscription plan & renewal trends
select `Subscription Plan`,`Renewal status`,count(*) as `Number of Renewals`
from `updated_amazon_prime_users`
group by `Subscription Plan`,`Renewal status`
order by `Number of Renewals` desc;

-- users with low ratings & customers support interactions
select `User ID`,`Feedback/Ratings`,
count(`Customer Support Interactions`) as `Support Interactions`
from `updated_amazon_prime_users`
where `Feedback/Ratings` < 3
group by `User ID`,`Feedback/Ratings` 
limit 10;

-- top 10 users with highest purchases
select `User ID`,count(`Purchase History`) as `Total Purchases`
from `updated_amazon_prime_users`
group by `User ID`
order by `Total Purchases` desc
limit 10;

-- average user subscription lifetime
select avg (datediff(`Membership End Date`,`Membership Start Date`))
as `Average Lifetime (Days)`
from `updated_amazon_prime_users`
where `Membership End Date` is not null;

-- inactive users (low engaement)
select `User ID`,`Username`,`Usage Frequency`,`Engagement Metrics`
from `updated_amazon_prime_users`
where `Usage Frequency` < 2 and `Engagement Metrics` < 3 limit 10;

-- users by subscription plan
select `Subscription Plan`,count(*) as `Number of Users`
from `updated_amazon_prime_users`
group by `Subscription Plan`
order by  `Number of Users` desc;

-- users without purchase history
select `User Id` , `Username`
from `updated_amazon_prime_users` where `Purchase History` is null or `Purchase History` = '';

-- feedback rating distribution
select `Feedback/Ratings` , count(*) as `Number of Users`
from `updated_amazon_prime_users` 
group by `Feedback/Ratings`
order by `Number of Users` desc limit 15;

-- users who did not rennew subscription
select `User ID` , `Username` , `Membership End Date`
from `updated_amazon_prime_users` where `Renewal Status` != 'Renewed';

-- user feedback by location
select `Location` , `Feedback/Ratings` , count(*) as `Number of Users`
from `updated_amazon_prime_users`
group by `Location` , `Feedback/Ratings`
order by `Number of Users` desc;