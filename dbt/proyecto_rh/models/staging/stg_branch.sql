with source as (
    select * from {{ source('hr', 'branch') }}
),

clean as (
    select
        branch_id,
        INITCAP(name) as name,
        address,
    from source
)

select * from clean
