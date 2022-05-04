SELECT  usage_month,
        warehouse_name,
        sum(dollars_spent) as spend
FROM {{ref('snowflake_warehouse_metering_xf')}}
WHERE usage_month < date_trunc('month', CURRENT_TIMESTAMP)::date
GROUP BY 1, 2
ORDER BY 1 DESC
