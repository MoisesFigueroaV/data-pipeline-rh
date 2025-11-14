with source as (
    select * from {{ source('hr', 'department') }}
),

clean as (
    select
        department_id,
        management_id,
        INITCAP(name) as name,
        description
    from source
)

select * from clean
