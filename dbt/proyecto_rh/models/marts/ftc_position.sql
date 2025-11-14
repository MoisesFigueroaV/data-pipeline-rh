with source as (
    select
        position_id,
        department_id,
        INITCAP(name) as name,
        level,
        description
    from {{ ref('stg_position') }}
)

select * from source