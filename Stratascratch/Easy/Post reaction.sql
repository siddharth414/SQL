Find all posts which were reacted to with a heart

https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?code_type=3

select * from facebook_posts 
    where  post_id in (select post_id from facebook_reactions where reaction = 'heart' )
