with source as (
    select * from {{ source('hr', 'cost_center') }}
),

clean as (
    select
        cost_center_id,
        INITCAP(name) as name,
        description
    from source
)

select * from clean
