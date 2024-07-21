Database Documentation: E-Commerce System with Additional Features
1. Overview

The E-Commerce System database is designed to manage product categories, products, customers, orders, order items, and shipping details for an online retail platform. The system includes additional features such as stock level management, low stock constraints, customer feedback tracking, real-time order tracking, and analytics views.
2. Table Descriptions
2.1 Product Categories Table
productcategories

    Columns:
        category_id (Primary Key): Unique identifier for each category.
        pc_categoryname: Name of the product category.
        parentcategory_id: Foreign key referencing the parent category for hierarchical categorization.

2.2 Products Table
products

    Columns:
        product_id (Primary Key): Unique identifier for each product.
        p_productname: Name of the product.
        category_id: Foreign key referencing the product category.
        p_price: Price of the product.
        p_stocklevel: Quantity of the product in stock.
        p_description: Description of the product.

2.3 Customers Table
customers

    Columns:
        customer_id (Primary Key): Unique identifier for each customer.
        c_firstname and c_surname: Customer's first and last name.
        c_street, c_city, c_postalcode, c_country: Customer's address details.
        c_registrationdate: Date of customer registration.
        c_contact: Customer's contact number.
        c_email: Customer's email address.

2.4 Orders Table
orders

    Columns:
        order_id (Primary Key): Unique identifier for each order.
        customer_id: Foreign key referencing the customer placing the order.
        o_orderdate: Date when the order was placed.
        o_orderquantity: Total quantity of items in the order.
        o_orderstatus: Status of the order (Pending, Shipped, Delivered).
        o_delivery_status: Real-time delivery status for customers.

2.5 Order Items Table
orderitems

    Columns:
        orderitem_id (Primary Key): Unique identifier for each order item.
        order_id: Foreign key referencing the order to which the item belongs.
        product_id: Foreign key referencing the product in the order.
        oi_quantity: Quantity of the product in the order.
        oi_priceperunit: Price per unit of the product in the order.

2.6 Shipping Details Table
shippingdetails

    Columns:
        shipping_id (Primary Key): Unique identifier for each shipping detail.
        order_id: Foreign key referencing the order associated with shipping.
        sd_shippingmethod: Shipping method (Air, Land, Sea).
        sd_trackingnumber: Tracking number for the shipment.
        sd_deliverystatus: Delivery status (Pending, Shipped, Delivered).
        sd_estimateddeliverydate: Estimated delivery date.

2.7 Additional Features
customerfeedback

    Columns:
        feedback_id (Primary Key): Unique identifier for each customer feedback.
        customer_id: Foreign key referencing the customer providing feedback.
        feedback_text: Textual feedback from the customer.
        feedback_date: Date when the feedback was submitted.

orderanalytics (View)

    Columns:
        order_id: Order identifier.
        product_id: Product identifier.
        p_productname: Product name.
        quantity_sold: Quantity of the product sold.
        revenue: Revenue generated from the product.

2.8 Triggers and Constraints

    Stock Level Update Trigger:
        A trigger (update_stock_trigger) is implemented to automatically update stock levels after each order.

    Low Stock Check Constraint:
        A check constraint (chk_low_stock) is added to ensure that stock levels are not negative.

3. Relationships

    Product Categories - Products Relationship:
        Products are linked to product categories through the category_id foreign key in the products table.

    Customers - Orders Relationship:
        Customers place orders, and the customer_id foreign key in the orders table associates each order with a customer.

    Orders - Order Items Relationship:
        Order items are connected to orders through the order_id foreign key in the orderitems table.

    Orders - Shipping Details Relationship:
        Shipping details are related to orders using the order_id foreign key in the shippingdetails table.

    Customers - Feedback Relationship:
        Customer feedback is associated with customers through the customer_id foreign key in the customerfeedback table.

4. Data Insertion Example
4.1 Product Categories, Products, Customers, Orders, Order Items, and Shipping Details

    Data insertion follows the same format as in the previous example.

4.2 Customer Feedback

sql

-- Insert into customerfeedback
INSERT INTO customerfeedback (customer_id, feedback_text, feedback_date)
VALUES
    (1, 'Great service!', '2023-01-15'),
    (3, 'Fast delivery, thank you!', '2023-02-22'),
    (5, 'Product quality exceeded expectations.', '2023-03-30'),
    -- Insert additional feedback records here...

5. Challenges and Design Decisions
5.1 Real-time Order Tracking

    Challenge:
        Implementing real-time order tracking for customers.
    Design Decision:
        Added the o_delivery_status column to the orders table to store real-time delivery status information.

5.2 Stock Level Management

    Challenge:
        Managing stock levels and updating them after each order.
    Design Decision:
        Implemented a trigger (update_stock_trigger) to automatically update stock levels after each order.

5.3 Low Stock Check

    Challenge:
        Ensuring that stock levels do not go below zero.
    Design Decision:
        Added a check constraint (chk_low_stock) to enforce that stock levels are non-negative.

5.4 Customer Feedback Tracking

    Challenge:
        Capturing and storing customer feedback.
    Design Decision:
        Introduced the customerfeedback table to track customer feedback, associating it with specific customers.

5.5 Analytics Views

    Challenge:
        Creating views to store analytics data.
    Design Decision:
        Created the orderanalytics view to store data for analytics purposes.