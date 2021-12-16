{{ config(materialized='table') }}

with orders as (
    select * from {{ref('stg_orders') }}
),

payments as (
   select * from {{ref('stg_payments') }}
),

orders_payment as (
    select ORDERID as order_id,
    sum(case when status = 'success' then amount end) as amount
    from payments
    group by 1
),

customer_payments as (

    select
      
        orders.customer_id,
        orders.order_id,
        coalesce(orders_payment.AMOUNT, 0) as AMOUNT

    from orders

    left join orders_payment using (order_id)
)

select * from customer_payments