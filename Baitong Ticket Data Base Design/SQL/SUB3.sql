-- ======================================
-- หาลูกค้าที่มีตั๋วจริง > มากกว่าAVG
-- ======================================
SELECT
    c.cust_id,
    c.cust_name,
    COUNT(tp.ticket_id) AS ticket_count
FROM CUSTOMER AS c
JOIN ORDERS AS o
    ON c.cust_id = o.cust_id
JOIN ORDER_ITEM AS oi
    ON o.order_id = oi.order_id
JOIN TICKET_PASS AS tp
    ON oi.order_item_id = tp.order_item_id
GROUP BY c.cust_id, c.cust_name
HAVING COUNT(tp.ticket_id) >
       (
           SELECT AVG(t.cnt)
           FROM (
               SELECT
                   c2.cust_id,
                   COUNT(tp2.ticket_id) AS cnt
               FROM CUSTOMER AS c2
               JOIN ORDERS AS o2
                   ON c2.cust_id = o2.cust_id
               JOIN ORDER_ITEM AS oi2
                   ON o2.order_id = oi2.order_id
               JOIN TICKET_PASS AS tp2
                   ON oi2.order_item_id = tp2.order_item_id
               GROUP BY c2.cust_id
           ) AS t
       )
ORDER BY ticket_count DESC;
