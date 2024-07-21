CREATE TABLE productcategories(
    category_id SERIAL PRIMARY KEY,
    pc_categoryname VARCHAR(50) CHECK (pc_categoryname IN ('Consumer Electronics','Home and Kitchen Appliances','Clothing and Fashion','Health and Beauty','Furniture and Home Decor','Books and Media','Sports and Outdoors','Automotive','Toys and Games','Groceries and Food','Office Supplies','Jewelry and Accessories','Pet Supplies','Electrical and Industrial Supplies','Software and Digital Products')),
    parentcategory_id INT REFERENCES productcategories(category_id)
);


CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    p_productname VARCHAR(50),
    category_id INT REFERENCES productcategories(category_id),
    p_price REAL,
    p_stocklevel INTEGER CHECK (p_stocklevel >= 0),
    p_description TEXT NULL
);


CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    c_firstname VARCHAR(50),
    c_surname VARCHAR(50),
    c_street VARCHAR (50),
    c_city VARCHAR (20),
    c_postalcode VARCHAR (10),
    c_country VARCHAR (50),
    c_registrationdate DATE CHECK (c_registrationdate <= CURRENT_DATE),
    c_contact VARCHAR(20) CHECK (c_contact LIKE '__________'),
    c_email VARCHAR(320) CHECK (c_email LIKE '%_@__%.__%')
);


CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    o_orderdate DATE,
    o_orderquantity INT,
    o_orderstatus VARCHAR(20) CHECK (o_orderstatus IN ('Pending', 'Shipped','Delivered'))
);


CREATE TABLE orderitems(
    orderitem_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    oi_quantity INT,
    oi_priceperunit REAL
);


CREATE TABLE shippingdetails(
    shipping_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    sd_shippingmethod VARCHAR(10) CHECK (sd_shippingmethod IN ('Air', 'Land','Sea')),
    sd_trackingnumber VARCHAR(50) UNIQUE,
    sd_deliverystatus VARCHAR(20) CHECK (sd_deliverystatus IN ('Pending', 'Shipped','Delivered')),
    sd_estimateddeliverydate DATE
);



-- ADDITIONAL FEATURES

-- a trigger or stored procedure to automatically update stock levels after each order
CREATE FUNCTION update_stock_levels()
RETURNS TRIGGER AS $$
BEGIN
    -- Update stock levels after each order
    UPDATE products
    SET p_stocklevel = p_stocklevel - NEW.o_orderquantity
    WHERE product_id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_stock_trigger
AFTER INSERT ON orderitems
FOR EACH ROW
EXECUTE FUNCTION update_stock_levels();


-- a check constraint for low stock levels
ALTER TABLE products
ADD CONSTRAINT chk_low_stock CHECK (p_stocklevel >= 0);


-- Introduce additional tables to track customer behavior, preferences, and feedback
CREATE TABLE customerfeedback (
    feedback_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    feedback_text TEXT,
    feedback_date DATE
);


-- Modify the orders table to include real-time tracking information for customers
ALTER TABLE orders ADD COLUMN o_delivery_status VARCHAR(20) CHECK (o_delivery_status IN ('Pending', 'Shipped', 'Delivered'));


-- Create views to store analytics data
CREATE VIEW orderanalytics AS
SELECT
    oi.order_id,
    oi.product_id,
    p.p_productname,
    oi.oi_quantity AS quantity_sold,
    oi.oi_quantity * oi.oi_priceperunit AS revenue
FROM
    orderitems oi
JOIN
    products p ON oi.product_id = p.product_id;