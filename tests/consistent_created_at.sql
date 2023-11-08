with r as (
    select * from {{ ref("fct_reviews") }}
),

l as (
    select * from {{ ref("dim_listings") }}
),

c as (
    select
        l.listing_id,
        l.created_at,
        r.review_date
    from l inner join r on l.listing_id = r.listing_id
    where l.created_at > r.review_date
)

select * from c
