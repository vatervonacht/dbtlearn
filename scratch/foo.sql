

insert into airbnb.raw.raw_reviews values (3176, current_timestamp(), 'Murray', 'excellent stay!', 'positive');


select * from airbnb.dev.fct_reviews where listing_id = 3176 and reviewer_name = 'Murray';


drop table airbnb.dev.dim_hosts;
drop table airbnb.dev.dim_hosts;

drop view AIRBNB.DEV.SRC_REVIEWS;

drop schema airbnb.dev cascade;

select * from airbnb.dev.mart_fullmoon_reviews where is_full_moon = true;

insert into airbnb.raw.raw_reviews values (3176, dateadd(hour, -1, current_timestamp()), 'Murray', 'excellent stay!', 'positive');