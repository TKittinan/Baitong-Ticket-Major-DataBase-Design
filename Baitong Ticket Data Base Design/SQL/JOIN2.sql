-- ======================================
-- ดูของในตะกร้า
-- ======================================
SELECT
    ca.cart_id,
    c.cust_name,
    ca.status AS cart_status,
    ci.cart_item_id,
    COALESCE(p.product_name, et.ticket_name) AS item_name,
    CASE
        WHEN p.product_id IS NOT NULL THEN 'product'
        WHEN et.event_ticket_id IS NOT NULL THEN 'event_ticket'
        ELSE 'unknown'
    END AS item_type,
    ci.quantity,
    ci.price_at_time,
    (ci.quantity * ci.price_at_time) AS line_total
FROM CART AS ca
JOIN CUSTOMER AS c
    ON ca.cust_id = c.cust_id
JOIN CART_ITEM AS ci
    ON ca.cart_id = ci.cart_id
LEFT JOIN PRODUCT AS p
    ON ci.product_id = p.product_id
LEFT JOIN EVENT_TICKET AS et
    ON ci.event_ticket_id = et.event_ticket_id
ORDER BY ca.cart_id, ci.cart_item_id;
