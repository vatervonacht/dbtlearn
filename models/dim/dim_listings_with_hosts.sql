{{
  config (
    materialized = 'table'
  )
}}

with
l as (
    select *
    from
        {{ ref('dim_listings') }}
),

h as (
    select *
    from
        {{ ref('dim_hosts') }}
),

l_with_h as (
    select
        l.listing_id,
        l.listing_name,
        l.room_type,
        l.minimum_nights,
        l.price,
        l.host_id,
        h.host_name,
        h.is_superhost as host_is_superhost,
        l.created_at,
        greatest(l.updated_at, h.updated_at) as updated_at
    from l
    left join h on (l.host_id = h.host_id)
)

select * from l_with_h
