{{ config(materialized='ephemeral') }}

with hosts as (
    select
        id as host_id,
        name as host_name,
        coalesce(is_superhost = 't', false) as is_superhost,
        created_at,
        updated_at
    from
        {{ source('airbnb', 'hosts') }}
)

select * from hosts
