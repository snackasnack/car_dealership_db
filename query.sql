`1. Output the list of customers and their spending`

SELECT c.customer_name,
        sum(t.price) AS total_spending
FROM Customer c
LEFT JOIN 
(
    SELECT t.customer_id,
            sum(c.price) AS price
    FROM Transaction t
    JOIN Car c on t.car_serial_number = c.serial_number
    GROUP BY t.customer_id
) t on c.customer_id = t.customer_id
GROUP BY c.customer_name
ORDER BY total_spending DESC;


`2. Output the top 3 car manufacturers that the customers bought by sales quantity and the sales number for it in the current month`

SELECT cr.manufacturer,
        COUNT(*) AS sales_quantity,
        SUM(cr.price) AS sales_amount
FROM Transaction t
JOIN Car cr ON t.car_serial_number = cr.serial_number
WHERE DATE_TRUNC('month', t.transaction_date) = DATE_TRUNC('month', CURRENT_DATE)
GROUP BY cr.manufacturer
ORDER BY sales_quantity DESC
LIMIT 3;