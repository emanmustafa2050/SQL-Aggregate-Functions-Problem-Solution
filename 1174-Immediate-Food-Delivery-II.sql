# Write your MySQL query statement below
/*
SELECT 
    SUM(
        CASE 
            WHEN datee = customer_pref_delivery_date 
            THEN 1 ELSE 0 
        END
    ) / COUNT(DISTINCT customer_id) * 100 AS immediate_percentage
FROM (
    -- Select customer_id as well so it can be used in the main query
    SELECT 
        MIN(order_date) AS datee,
        customer_id, -- Include customer_id
        customer_pref_delivery_date 
    FROM Delivery
    GROUP BY customer_id
) AS New;
*/
SELECT 
    Round(SUM(
        CASE 
            WHEN datee = customer_pref_delivery_date 
            THEN 1 ELSE 0 
        END
    ) / COUNT(DISTINCT customer_id) * 100,2) AS immediate_percentage
FROM (
    -- Select the entire row for the first order (with MIN(order_date)) for each customer
    SELECT d.order_date AS datee,
           d.customer_id,
           d.customer_pref_delivery_date
    FROM Delivery d
    JOIN (
        -- Find the first order (earliest order_date) for each customer
        SELECT customer_id, MIN(order_date) AS first_order_date
        FROM Delivery
        GROUP BY customer_id
    ) first_orders
    ON d.customer_id = first_orders.customer_id AND d.order_date = first_orders.first_order_date
) AS New;



