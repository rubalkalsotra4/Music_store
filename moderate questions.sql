--Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--Return your list ordered alphabetically by email starting with A.

select distinct email as Email, first_name , last_name, genre.name as genre_name
from customer
join invoice on invoice.customer_id = customer.customer_id
join invoice_line on invoice_line.invoice_id = invoice.invoice_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
order by email;

-- Q2: Let's invite the artists who have written the most rock music in our dataset. 
--Write a query that returns the Artist name and total track count of the top 10 rock bands.

select artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.name
order by number_of_songs desc
limit 10;

--Q3: Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.
select * from track
select name, milliseconds from track
where milliseconds > (
select avg(milliseconds) as avg_length
from track)
order by milliseconds desc;


