with source as (
    select * from {{ source('hr', 'employee_document') }}
),

clean as (
    select
        document_id::integer,
        employee_id::integer,
        document_type::varchar2(100),
        TO_DATE(date, 'YYYY-MM-DD') as date,
    from source
)

select * from clean
