-- ======================================
-- หางานที่ยังไม่เคยขายบัตร
-- ======================================
SELECT
    e.event_id,
    e.event_name,
    e.event_date
FROM EVENTS AS e
WHERE NOT EXISTS (
    SELECT 1
    FROM EVENT_TICKET AS et
    JOIN ORDER_ITEM AS oi
        ON et.event_ticket_id = oi.event_ticket_id
    WHERE et.event_id = e.event_id
);
