with hosts as (
    select
        host_id,
        coalesce(host_name, 'Anonymous') as host_name,
        is_superhost,
        created_at,
        updated_at
    from {{ ref('src_hosts') }}
)

select * from hosts
