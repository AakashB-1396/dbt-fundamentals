select 
    id as payment_id,
    orderid,
    paymentmethod,
    status,
    {{ cents_to_dollars(amount) }} as amount,
    created as created_at
from {{ source('stripe_payment','payment') }}
