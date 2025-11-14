with source as (
    select * from {{ source('hr', 'training') }}
),

clean as (
    select
        training_id,
        INITCAP(name) as name,
        description,
        to_date(start_date, '%Y-%m-%d') as start_date,
        to_date(end_date, '%Y-%m-%d') as end_date
    from source
)

select * from clean;
