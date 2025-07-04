-- Non-Correlated Subquery: Properties with average rating > 4.0
SELECT 
    p.property_id,
    p.name,
    p.location,
    AVG(r.rating) AS average_rating
FROM 
    Property p
JOIN 
    Review r ON p.property_id = r.property_id
GROUP BY 
    p.property_id, p.name, p.location
HAVING 
    AVG(r.rating) > 4.0;

-- Correlated Subquery: Users with more than 3 bookings
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) AS booking_count
FROM
    User u
WHERE
    (
        SELECT COUNT(*)
        FROM Booking b
        WHERE b.user_id = u.user_id
    ) > 3;

