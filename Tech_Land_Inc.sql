CREATE DATABASE Tech_land;
USE Tech_land;

CREATE TABLE Products(
product_code nvarchar(10) PRIMARY KEY,
product_name varchar(100),
price float,
quantity_remaining int,
quantity_sold int
);

INSERT INTO Products VALUES ('P1', 'iPhone 13 Pro Max', '1200', 100, 195)
INSERT INTO Products VALUES ('P2', 'Airpods Pro', 279, 150, 90)
INSERT INTO Products VALUES ('P3', 'Macbook Pro 16', '5000', 2, 48)
INSERT INTO Products VALUES ('P4', 'iPad Air', '650', 30, 19)


select* from products

CREATE TABLE Sales(
order_id int PRIMARY KEY IDENTITY,
order_date DATE,
product_code nvarchar (10),
quantity_ordered int,
sale_price float
);

INSERT INTO sales VALUES ( '2022-05-11', 'P4', 9, 5850)

select* from products
select* from sales


-----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--Stored Procedure requirement: 1)	Check if product is available based on the required quantity.
--								2)	If available, then modify the database tables accordingly.

--To check whether the product is available based on the required quantity,
CREATE or ALTER PROCEDURE techland(@p_product_name varchar(50), @p_quantity int)
AS
	DECLARE @v_count int,
			@v_code nvarchar(10),
			@v_price float
	BEGIN
	
		select @v_count = count(1)
		from Products
		where product_name = @p_product_name
		and quantity_remaining >= @p_quantity --if the remaining quantity is sufficient for customer requirement,
											--the procedure will go to the 'begin' that is inside the 'if' statement. Else
											-- 'Insufficient quantity' is returned.
		if @v_count > 0
			begin
				select @v_code = product_code, @v_price = price
				from products
				where product_name = @p_product_name;

		--after the product has been purchased by the customer, we then update the Sales table with the purchase_date,product_code,
		--quantity_ordered, as well as total sale_price of the order.
				insert into sales(order_date, product_code, quantity_ordered, sale_price)
				values (getdate(), @v_code, @p_quantity,(@v_price*@p_quantity));

		--In the Products table, the quantity_remaining and quantity_sold are updated accordingly
				update products
				set quantity_remaining = (quantity_remaining - @p_quantity),
					quantity_sold = (quantity_sold + @p_quantity)
				where product_code = @v_code;

				print('Order Successful!'); --The message printed on customer end to confirm that the order has been executed successfully
				
			end

		else
			print('Insufficient quantity'); --message printed on customer end if the quantity required exceeds quantity in database
	END;

	select* from products
	select* from sales

	EXEC techland 'Macbook Pro 16',3;