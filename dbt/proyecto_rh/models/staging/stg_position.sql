with source as (
    select * from {{ source('hr', 'position') }}
),

clean as (
    select
        position_id,
        department_id,
        INITCAP(name) as name,
        level,
        description
    from source
)

select * from clean
