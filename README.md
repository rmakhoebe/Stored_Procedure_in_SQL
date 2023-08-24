# Stored_Procedure_in_SQL
An electronics shop has tables in its database automatically updated to reflect when a customer makes a purchase in their store.

Problem Statement: Tech Land Inc is a store that sells electronics. They have therefore ventured into selling their products online and they need help to automatically update their online transactions in order to reflect the sales that have been made and update the quantity of products available in their database. For every given product and the quantity,
1)	Check if product is available based on the required quantity.
2)	If available, then modify the database tables accordingly.

For this case, we have two tables (Products table and Sales table) that contain records for Tech Land Inc. sales thus far.

![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/add46ec8-1b08-4372-85ce-20f659005a8d)

  
We first check whether the quantity required by customer does not exceed quantity of products available in stock.

![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/2d81633c-a9a0-4d7c-9d27-2d952472d373)

 
If the remaining quantity is sufficient for customer requirement, the procedure will continue to modify database tables accordingly.

![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/82079f85-aed6-4fda-98eb-2ef073d37810)
 


Results obtained after running the stored procedure


Products table before Order execution

 ![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/0be9686a-cdd1-49ab-bdd5-7a102e8ceed0)


Assuming the customer ordered iPad Air, quantity of 5. Order was successful

 ![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/66d11c3b-1d1b-4215-9799-5485949892d0)



Products table after order execution

 ![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/d65368c7-ee68-46a3-a1b5-b710dc5ec53b)



This is the Sales table before the customer ordered

 ![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/96163d60-7cad-4be3-a054-8ab4a0ab313f)


Sales table after customer ordered 5 iPad Air

 ![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/ccf4d2e2-deda-4f9a-acfb-1c778aeaa21d)



In case where the requested quantity exceeds available quantity, the following message is returned on customer end as intended. And the tables remain unchanged.

![image](https://github.com/rmakhoebe/Stored_Procedure_in_SQL/assets/97227644/ecaf7e84-42b7-4e52-aa3c-2accacb3ac72)

  
