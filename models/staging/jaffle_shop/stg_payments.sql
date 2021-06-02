with payments as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount/100 as amount,
        created as created_at
    from dbt_training_stripe.payments
)

select * from payments