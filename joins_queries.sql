--INNER JOIN (Orders + Customers)
SELECT 
    i.InvoiceId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    i.InvoiceDate,
    i.Total
FROM Invoice i
INNER JOIN Customer c 
ON i.CustomerId = c.CustomerId;

--LEFT JOIN (Customers with NO Orders)
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country
FROM Customer c
LEFT JOIN Invoice i 
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

--Revenue per Product (Track)
SELECT 
    t.TrackId,
    t.Name AS TrackName,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t 
ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY Revenue DESC;

--Category-wise Revenue (Genre)
SELECT 
    g.Name AS Genre,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM InvoiceLine il
JOIN Track t 
ON il.TrackId = t.TrackId
JOIN Genre g 
ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;
