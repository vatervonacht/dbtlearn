with
reviews as (
    select *
    from
        {{ ref('fct_reviews') }}
),

moon as (
    select *
    from
        {{ ref('seed_full_moon_dates') }}
),

final as (
    select
        reviews.*,
        case
            when moon.full_moon_date is null then false
            else true
        end as is_full_moon
    from
        reviews
    left join moon -- assumes review is left one day after full moon
        on (to_date(reviews.review_date) = dateadd(day, 1, moon.full_moon_date))
)

select * from final
