You have been tasked with finding the top two single-channel media types (ranked in decreasing order) that correspond 
  to the most money the grocery chain had spent on its promotional campaigns.

Your output should contain the media type and the total amount spent on the advertising campaign. 
  In the event of a tie, output all results and do not skip ranks.

https://platform.stratascratch.com/coding/2124-top-two-media-types?code_type=3

with cte as (
        select media_type , 
               sum(cost) as total_campaign_cost,
               dense_rank() over(order by sum(cost) desc ) as r
            from online_sales_promotions
            group by media_type 
            )
            
select media_type, total_campaign_cost from cte where r < 3
