--Q1: Who is the senior most employee based on job title?
select * from employee
order by levels desc
limit 1;

--Q2: Which countries have the most Invoices?
select count (*) as c,  billing_country from invoice
group by billing_country
order by c desc
limit 1;

--Q3: What are top 3 values of total invoice?
select * from invoice
order by amount desc
limit 3

--Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
--Write a query that returns one city that has the highest sum of invoice totals. 
--Return both the city name & sum of all invoice totals

SELECT billing_city,SUM(amount) AS Invoice_Total
FROM invoice
GROUP BY billing_city
ORDER BY Invoice_Total DESC
LIMIT 1;

--Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
--Write a query that returns the person who has spent the most money.
select first_name from customer
SELECT customer.customer_id, SUM(invoice.amount) AS total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1; 




