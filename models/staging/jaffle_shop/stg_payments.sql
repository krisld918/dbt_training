with payments as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        {{ cents_to_dollars('amount') }} as amount,
        created as created_at
    from {{ source('dbt_training_stripe','payments') }}
)
select * from payments