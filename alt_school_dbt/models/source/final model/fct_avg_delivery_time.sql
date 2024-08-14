select
    order_id,
    customer_state,
    avg_delivery_time
from 
    {{ ref('int_avg_delivery_time') }}
order by 
    order_id