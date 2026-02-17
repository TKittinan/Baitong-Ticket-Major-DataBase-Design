-- ======================================
-- หาลูกค้าที่ใช้เงิน > 50000บาท
-- ======================================
SELECT
    c.cust_id,
    c.cust_name,
    c.cust_email,
    t.total_spent
FROM CUSTOMER AS c
JOIN (
    SELECT
        o.cust_id,
        SUM(o.total_amount) AS total_spent
    FROM ORDERS AS o
    WHERE o.status = 'paid'
    GROUP BY o.cust_id
) AS t
    ON c.cust_id = t.cust_id
WHERE t.total_spent > 5000
ORDER BY t.total_spent DESC;
