select * from {{ref('fct_reviews')}} f
inner join {{ref('dim_listings_cleansed')}} l USING (listing_id)
where f.review_date < l.created_at
