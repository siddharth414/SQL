Compare the total number of comments made by users in each country during December 2019 and January 2020.
For each month, rank countries by their total number of comments in descending order. 
  Countries with the same total should share the same rank, and the next rank should increase by one (without skipping numbers).
Return the names of the countries whose rank improved from December to January (that is, their rank number became smaller).

https://platform.stratascratch.com/coding/2007-rank-variance-per-country?code_type=3


with dec_2019 as(
select b.country, sum(a.number_of_comments) as total_comments,
    dense_rank() over(order by  sum(a.number_of_comments) desc ) as r_2019
    from fb_comments_count a join fb_active_users b on a.user_id = b.user_id
    where month(a.created_at) = 12 and year(a.created_at) = 2019
    group by b.country

),
 jan_2020 as(
select b.country, sum(a.number_of_comments) as total_comments,
    dense_rank() over(order by  sum(a.number_of_comments) desc ) as r_2020
    from fb_comments_count a join fb_active_users b on a.user_id = b.user_id
    where month(a.created_at) = 01 and year(a.created_at) = 2020
    group by b.country
)


select a.country 
from dec_2019 a join jan_2020 b on a.country = b.country where   b.r_2020 < a.r_2019
