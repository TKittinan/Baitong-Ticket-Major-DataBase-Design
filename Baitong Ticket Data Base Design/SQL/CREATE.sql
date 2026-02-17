-- ================================
-- USER
-- ================================
CREATE TABLE USERS (
    user_id VARCHAR(10) PRIMARY KEY,
    user_name VARCHAR(100),
    user_email VARCHAR(100) UNIQUE,
    user_firebase_uid VARCHAR(200) UNIQUE,
    phone VARCHAR(20),
    status VARCHAR(20),
    created TIMESTAMP,
    updated TIMESTAMP
);

-- ================================
-- CUSTOMER
-- ================================
CREATE TABLE CUSTOMER (
    cust_id VARCHAR(10) PRIMARY KEY,
    cust_name VARCHAR(100),
    cust_email VARCHAR(100) UNIQUE,
    cust_firebase_uid VARCHAR(200) UNIQUE,
    phone VARCHAR(20),
    status VARCHAR(20),
    created TIMESTAMP,
    updated TIMESTAMP
);

-- ================================
-- EVENT_CATEGORY
-- ================================
CREATE TABLE EVENT_CATEGORY (
    event_category_id VARCHAR(10) PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE,
    status VARCHAR(20)
);

-- ================================
-- EVENT
-- ================================
CREATE TABLE EVENTS (
    event_id VARCHAR(10) PRIMARY KEY,
    event_name VARCHAR(200),
    description TEXT,
    event_date DATE,
    location VARCHAR(200),
    cover_image VARCHAR(200),
    status VARCHAR(20),
    event_category_id VARCHAR(10),
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    CONSTRAINT fk_event_category
        FOREIGN KEY (event_category_id)
        REFERENCES EVENT_CATEGORY(event_category_id)
);

-- ================================
-- EVENT_TICKET
-- ================================
CREATE TABLE EVENT_TICKET (
    event_ticket_id VARCHAR(10) PRIMARY KEY,
    event_id VARCHAR(10),
    ticket_name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    sale_start TIMESTAMP,
    sale_end TIMESTAMP,
    status VARCHAR(20),
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    CONSTRAINT fk_event_ticket_event
        FOREIGN KEY (event_id)
        REFERENCES EVENTS(event_id)
);

-- ================================
-- PRODUCT
-- ================================
CREATE TABLE PRODUCT (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    product_type VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    image_url VARCHAR(200),
    status VARCHAR(20),
    created_by_user_id VARCHAR(10),
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    CONSTRAINT fk_product_user
        FOREIGN KEY (created_by_user_id)
        REFERENCES USERS(user_id)
);

-- ================================
-- PROMOTION
-- ================================
CREATE TABLE PROMOTION (
    promo_id VARCHAR(10) PRIMARY KEY,
    promo_name VARCHAR(100),
    discount_type VARCHAR(20),
    value DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    created_by_user_id VARCHAR(10),
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    CONSTRAINT fk_promo_user
        FOREIGN KEY (created_by_user_id)
        REFERENCES USERS(user_id)
);

-- ================================
-- CART
-- ================================
CREATE TABLE CART (
    cart_id VARCHAR(10) PRIMARY KEY,
    cust_id VARCHAR(10),
    status VARCHAR(20),
    created TIMESTAMP,
    updated TIMESTAMP,
    CONSTRAINT fk_cart_customer
        FOREIGN KEY (cust_id)
        REFERENCES CUSTOMER(cust_id)
);

-- ================================
-- CART_ITEM
-- ================================
CREATE TABLE CART_ITEM (
    cart_item_id VARCHAR(10) PRIMARY KEY,
    cart_id VARCHAR(10),
    product_id VARCHAR(10),
    event_ticket_id VARCHAR(10),
    quantity INT,
    price_at_time DECIMAL(10,2),
    created TIMESTAMP,
    updated TIMESTAMP,
    CONSTRAINT fk_cartitem_cart
        FOREIGN KEY (cart_id)
        REFERENCES CART(cart_id),
    CONSTRAINT fk_cartitem_product
        FOREIGN KEY (product_id)
        REFERENCES PRODUCT(product_id),
    CONSTRAINT fk_cartitem_ticket
        FOREIGN KEY (event_ticket_id)
        REFERENCES EVENT_TICKET(event_ticket_id)
);

-- ================================
-- ORDER
-- ================================
CREATE TABLE ORDERS (
    order_id VARCHAR(10) PRIMARY KEY,
    cust_id VARCHAR(10),
    order_date TIMESTAMP,
    total_before_discount DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    status VARCHAR(20),
    promo_id VARCHAR(10),
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    CONSTRAINT fk_order_customer
        FOREIGN KEY (cust_id)
        REFERENCES CUSTOMER(cust_id),
    CONSTRAINT fk_order_promo
        FOREIGN KEY (promo_id)
        REFERENCES PROMOTION(promo_id)
);

-- ================================
-- ORDER_ITEM
-- ================================
CREATE TABLE ORDER_ITEM (
    order_item_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    event_ticket_id VARCHAR(10),
    quantity INT,
    unit_price DECIMAL(10,2),
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    CONSTRAINT fk_oi_order
        FOREIGN KEY (order_id)
        REFERENCES ORDERS(order_id),
    CONSTRAINT fk_oi_product
        FOREIGN KEY (product_id)
        REFERENCES PRODUCT(product_id),
    CONSTRAINT fk_oi_ticket
        FOREIGN KEY (event_ticket_id)
        REFERENCES EVENT_TICKET(event_ticket_id)
);

-- ================================
-- TICKET_PASS
-- ================================
CREATE TABLE TICKET_PASS (
    ticket_id VARCHAR(10) PRIMARY KEY,
    order_item_id VARCHAR(10),
    seat VARCHAR(20),
    qr_code VARCHAR(50) UNIQUE,
    status VARCHAR(20),
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    CONSTRAINT fk_ticketpass_oi
        FOREIGN KEY (order_item_id)
        REFERENCES ORDER_ITEM(order_item_id)
);
