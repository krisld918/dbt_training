with payments as (
    select * from {{ ref('stg_payments') }}
),
pivoted as (
    select
        order_id,
        {%- set sql_query %}
            select distinct payment_method from {{ ref('stg_payments') }}
        {% endset %}
        {% set payment_methods =  get_sql_results(sql_query) %}
        {%- for payment_method in payment_methods -%}
        sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount
        {%- if not loop.last -%}
        ,
        {%- endif %}
        {% endfor -%}
    from payments
    where status = 'success'
    group by order_id
)
select * from pivoted


