with source as (
    select * from {{ source('hr', 'benefit') }}
),

clean as (
    select
        benefit_id::integer,
        employee_id::integer,
        benefit_type::varchar(100),
        description::text,
        TO_DATE(start_date, 'YYYY-MM-DD') as start_date,
        CAST(active as boolean) as active,
    from source
)

select * from clean
