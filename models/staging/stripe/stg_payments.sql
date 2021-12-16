select * from {{ source('stripe_payment','payment') }}
