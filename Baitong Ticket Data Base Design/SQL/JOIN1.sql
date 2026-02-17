-- ======================================
-- รายการสั่งซื้อ + ชื่อลูกค้า + ส่วนลดที่ใช้
-- ======================================

SELECT
    o.order_id,
    c.cust_name,
    o.order_date,
    o.total_before_discount,
    o.total_amount,
    (o.total_before_discount - o.total_amount) AS discount_amount,
    p.promo_name,
    o.payment_method,
    o.status
FROM ORDERS AS o
JOIN CUSTOMER AS c
    ON o.cust_id = c.cust_id
LEFT JOIN PROMOTION AS p
    ON o.promo_id = p.promo_id
ORDER BY o.order_date DESC, o.order_id;
