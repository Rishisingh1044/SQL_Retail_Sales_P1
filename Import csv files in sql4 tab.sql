## IMPORT CSV FILE IN SQL  

CREATE TABLE Customer(
customer_id int Primary Key,
first_name varchar(50),
last_name varchar(50),
email Varchar(75),
adddress_id int 
)
SELECT*FROM Customer

## QUERY TO IMOPRT CSV FILES IN SQL

COPY Customer (customer_id,first_name,last_name_email,address_id)
FROM 'E:\Customer.csv'  ## (E means where my csv files are stored)
DELIMITER ','
CSV HEADER;

SELECT*FROM Customer




  