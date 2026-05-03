WITH l AS (
    SELECT * FROM {{ ref('dim_listings_cleansed')}}
),
h as (
    select * from {{ ref('dim_hosts_cleansed')}}
)
select 
    l.LISTING_ID, 
    l.LISTING_NAME, 
    l.ROOM_TYPE, 
    l.MINIMUM_NIGHTS, 
    l.PRICE,
    l.HOST_ID,
    h.HOST_NAME, 
    h.IS_SUPERHOST as host_is_superhost,
    l.CREATED_AT,
    greatest(l.UPDATED_AT,h.UPDATED_AT) as UPDATED_AT
from l
left join h on (h.host_id = l.host_id)