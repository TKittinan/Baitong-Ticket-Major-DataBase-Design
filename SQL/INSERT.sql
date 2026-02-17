-- ================================
-- USER
-- ================================
INSERT INTO USERS (user_id, user_name, user_email, user_firebase_uid, phone, status, created, updated)
VALUES
('U001', 'Admin1', 'admin1@baitong.ticket.com', 'uid_admin1', '0811111111', 'active','2025-11-10 10:00', '2025-11-10 10:30'),
('U002', 'Admin2', 'admin2@baitong.ticket.com', 'uid_admin2', '0822222222', 'active','2025-11-10 11:00', '2025-11-10 11:30');

-- ================================
-- CUSTOMER
-- ================================
INSERT INTO CUSTOMER (cust_id, cust_name, cust_email, cust_firebase_uid, phone, status, created, updated)
VALUES
('C001','Alice','alice@example.com','uid_c001','0891000001','active',
'2025-11-11 09:00','2025-11-11 09:10'),
('C002','Bob','bob@example.com','uid_c002','0891000002','active',
'2025-11-11 09:10','2025-11-11 09:20'),
('C003','Charlie','charlie@example.com','uid_c003','0891000003','active',
'2025-11-11 09:20','2025-11-11 09:30'),
('C004','David','david@example.com','uid_c004','0891000004','active',
'2025-11-11 09:30','2025-11-11 09:40'),
('C005','Emma','emma@example.com','uid_c005','0891000005','active',
'2025-11-11 09:40','2025-11-11 09:50'),
('C006','Frank','frank@example.com','uid_c006','0891000006','active',
'2025-11-11 10:00','2025-11-11 10:10'),
('C007','Grace','grace@example.com','uid_c007','0891000007','active',
'2025-11-11 10:10','2025-11-11 10:20'),
('C008','Henry','henry@example.com','uid_c008','0891000008','active',
'2025-11-11 10:20','2025-11-11 10:30'),
('C009','Isabel','isabel@example.com','uid_c009','0891000009','active',
'2025-11-11 10:30','2025-11-11 10:40'),
('C010','Jack','jack@example.com','uid_c010','0891000010','active',
'2025-11-11 10:40','2025-11-11 10:50');

-- ================================
-- EVENT_CATEGORY
-- ================================
INSERT INTO EVENT_CATEGORY (event_category_id, category_name, status)
VALUES
('EC01','Concert','active'),
('EC02','Sports','active'),
('EC03','Performing Arts','active');

-- ================================
-- EVENT
-- ================================
INSERT INTO EVENTS (event_id, event_name, description, event_date, location,cover_image,status, event_category_id, created, updated, deleted)
VALUES
('E001','BLACKPINK WORLD TOUR','K-pop concert','2025-12-12','Impact Arena','img1.jpg',
 'published','EC01','2025-11-12 10:00','2025-11-12 10:15',NULL),
('E002','Thailand Open Final','Tennis final match','2025-01-15','Bangkok Stadium','img2.jpg',
 'published','EC02','2025-11-12 10:30','2025-11-12 10:45',NULL),
('E003','Phantom of the Opera','Musical show','2026-02-10','Thailand Cultural Center','img3.jpg',
 'published','EC03','2025-11-12 11:00','2025-11-12 11:15',NULL);

-- ================================
-- EVENT_TICKET
-- ================================
INSERT INTO EVENT_TICKET (event_ticket_id, event_id, ticket_name, price, stock,sale_start, sale_end, status, created, updated, deleted)
VALUES
('T001','E001','VIP',4500,100,'2025-11-20 10:00',
'2025-12-19 23:00','on_sale','2025-11-13 10:00','2025-11-13 10:10',NULL),
('T002','E001','Regular',1990,300,'2025-11-15 10:00',
'2025-12-20 23:00','on_sale','2025-11-13 10:15','2025-11-13 10:25',NULL),
('T003','E002','Courtside',3500,50,'2025-01-10 09:00',
'2025-02-09 22:00','on_sale','2025-11-13 10:30','2025-11-13 10:40',NULL),
('T004','E002','Standard',3200,200,'2025-01-10 09:00',
'2025-02-09 22:00','on_sale','2025-11-13 10:45','2025-11-13 10:55',NULL),
('T005','E003','Regular',4500,120,'2025-12-05 09:00',
'2026-02-09 22:00','on_sale','2025-11-13 11:00','2025-11-13 11:10',NULL);

-- ================================
-- PRODUCT
-- ================================
INSERT INTO PRODUCT (product_id, product_name,product_type,price,stock,image_url,status, created_by_user_id, created, updated, deleted)
VALUES
('P001','BP Official T-Shirt','t-shirt',890,200,'shirt.jpg','active',
'U001','2025-11-13 14:00','2025-11-13 14:10',NULL),
('P002','Tour Hoodie','hoodie',1590,120,'hoodie.jpg','active',
'U001','2025-11-13 14:15','2025-11-13 14:25',NULL),
('P003','Merch Bundle A','bundle',590,300,'bundle.jpg','active',
'U002','2025-11-13 14:30','2025-11-13 14:40',NULL),
('P004','Lightstick','accessory',1290,80,'lightstick.jpg','active',
'U002','2025-11-13 14:45','2025-11-13 14:55',NULL);

-- ================================
-- PROMOTION
-- ================================
INSERT INTO PROMOTION (promo_id, promo_name, discount_type, value,start_date, end_date, status, created_by_user_id,created, updated, deleted)
VALUES
('PR001','Flash Sale 20%','percent',20,'2025-11-15',
'2025-11-30','active','U001','2025-11-14 11:00','2025-11-14 11:15',NULL),
('PR002','Season Pass Discount','fixed',300,'2025-11-15',
'2026-01-31','active','U002','2025-11-14 11:30','2025-11-14 11:45',NULL);

-- ================================
-- CART
-- ================================
INSERT INTO CART (cart_id, cust_id, status, created, updated)
VALUES
('CA001','C001','open','2025-11-11 11:05','2025-11-11 11:20'),
('CA002','C002','open','2025-11-11 11:10','2025-11-11 11:25'),
('CA003','C003','checked_out','2025-11-11 11:15','2025-11-11 11:32'),
('CA004','C004','open','2025-11-11 11:18','2025-11-11 11:30'),
('CA005','C005','open','2025-11-11 11:20','2025-11-11 11:35'),
('CA006','C006','checked_out','2025-11-11 11:22','2025-11-11 11:40'),
('CA007','C007','open','2025-11-11 11:25','2025-11-11 11:45'),
('CA008','C008','checked_out','2025-11-11 11:27','2025-11-11 11:50'),
('CA009','C009','open','2025-11-11 11:30','2025-11-11 11:55'),
('CA010','C010','checked_out','2025-11-11 11:32','2025-11-11 12:00'),
('CA011','C001','open','2025-11-11 11:35','2025-11-11 12:05'),
('CA012','C005','open','2025-11-11 11:40','2025-11-11 12:10');

-- ================================
-- CART_ITEM
-- ================================
INSERT INTO CART_ITEM (cart_item_id, cart_id, product_id, event_ticket_id,quantity, price_at_time, created, updated)
VALUES
('CI001','CA001','P001',NULL,1,890,'2025-11-11 11:10','2025-11-11 11:20'),
('CI002','CA002','P004',NULL,2,1290,'2025-11-11 11:12','2025-11-11 11:22'),
('CI003','CA003',NULL,'T001',1,4500,'2025-11-11 11:15','2025-11-11 11:25'),
('CI004','CA004','P002',NULL,1,1590,'2025-11-11 11:18','2025-11-11 11:28'),
('CI005','CA005',NULL,'T003',1,3500,'2025-11-11 11:20','2025-11-11 11:30'),
('CI006','CA006','P003',NULL,1,590,'2025-11-11 11:22','2025-11-11 11:32'),
('CI007','CA007',NULL,'T002',1,1990,'2025-11-11 11:24','2025-11-11 11:34'),
('CI008','CA008','P001',NULL,3,890,'2025-11-11 11:26','2025-11-11 11:36'),
('CI009','CA009',NULL,'T004',2,3200,'2025-11-11 11:28','2025-11-11 11:38'),
('CI010','CA010','P002',NULL,1,1590,'2025-11-11 11:30','2025-11-11 11:40');

-- ================================
-- ORDER
-- ================================
INSERT INTO ORDERS (order_id, cust_id, order_date,total_amount,total_before_discount,payment_method, status, promo_id, created, updated, deleted)
VALUES
('O001','C001','2025-11-11 15:25',890,712,'credit_card','paid',
'PR001','2025-11-11 15:25','2025-11-11 15:35',NULL),
('O002','C002','2025-11-11 15:30',2580,2064,'credit_card','paid',
'PR001','2025-11-11 15:30','2025-11-11 15:40',NULL),
('O003','C003','2025-11-11 15:35',6490,6190,'promptpay','pending',
'PR002','2025-11-11 15:35','2025-11-11 15:45',NULL),
('O004','C004','2025-11-11 15:40',4500,4500,'credit_card','paid'
,NULL,'2025-11-11 15:40','2025-11-11 15:50',NULL),
('O005','C005','2025-11-11 15:45',3500,3500,'promptpay','paid'
,NULL,'2025-11-11 15:45','2025-11-11 15:55',NULL),
('O006','C006','2025-11-11 15:50',590,590,'promptpay','paid'
,NULL,'2025-11-11 15:50','2025-11-11 16:00',NULL),
('O007','C007','2025-11-11 15:55',1990,1690,'credit_card','paid','PR002','2025-11-11 15:55','2025-11-11 16:05',NULL),
('O008','C008','2025-11-11 16:00',890,890,'promptpay','paid'
,NULL,'2025-11-11 16:00','2025-11-11 16:10',NULL),
('O009','C009','2025-11-11 16:05',6400,5120,'credit_card','paid','PR001','2025-11-11 16:05','2025-11-11 16:15',NULL),
('O010','C010','2025-11-11 16:10',1590,1590,'promptpay','paid'
,NULL,'2025-11-11 16:10','2025-11-11 16:20',NULL),
('O011','C001','2025-11-11 16:15',890,890,'credit_card','paid'
,NULL,'2025-11-11 16:15','2025-11-11 16:25',NULL),
('O012','C005','2025-11-11 16:20',890,890,'promptpay','paid'
,NULL,'2025-11-11 16:20','2025-11-11 16:30',NULL);

-- ================================
-- ORDER_ITEM
-- ================================
INSERT INTO ORDER_ITEM (order_item_id, order_id, product_id, event_ticket_id,quantity, unit_price, created, updated, deleted)
VALUES
('OI001','O001','P001',NULL,1,890,'2025-11-11 15:30','2025-11-11 15:40',NULL),
('OI002','O002','P004',NULL,2,1290,'2025-11-11 15:35','2025-11-11 15:45',NULL),
('OI003','O003',NULL,'T001',1,4500,'2025-11-11 15:40','2025-11-11 15:50',NULL),
('OI004','O003',NULL,'T002',1,1990,'2025-11-11 15:42','2025-11-11 15:52',NULL),
('OI005','O004',NULL,'T001',1,4500,'2025-11-11 15:45','2025-11-11 15:55',NULL),
('OI006','O005',NULL,'T003',1,3500,'2025-11-11 15:50','2025-11-11 16:00',NULL),
('OI007','O006','P003',NULL,1,590,'2025-11-11 15:55','2025-11-11 16:05',NULL),
('OI008','O007',NULL,'T002',1,1990,'2025-11-11 16:00','2025-11-11 16:10',NULL),
('OI009','O008','P001',NULL,1,890,'2025-11-11 16:05','2025-11-11 16:15',NULL),
('OI010','O009',NULL,'T004',2,3200,'2025-11-11 16:10','2025-11-11 16:20',NULL),
('OI011','O010','P002',NULL,1,1590,'2025-11-11 16:15','2025-11-11 16:25',NULL),
('OI012','O011','P001',NULL,1,890,'2025-11-11 16:20','2025-11-11 16:30',NULL),
('OI013','O012','P001',NULL,1,890,'2025-11-11 16:25','2025-11-11 16:30',NULL);

-- ================================
-- TICKET_PASS
-- ================================
INSERT INTO TICKET_PASS (ticket_id, order_item_id, seat, qr_code,status, created, updated, deleted)
VALUES
('TK001','OI003','99','Qr101','unused','2025-11-11 11:45','2025-11-11 11:45',NULL),
('TK002','OI004','1','Qr102','unused','2025-11-11 11:45','2025-11-11 11:45',NULL),
('TK003','OI005','2','Qr103','unused','2025-11-11 11:45','2025-11-11 11:45',NULL);
