CREATE DEFINER=`root`@`localhost` PROCEDURE `supplierid_name_rating_service`()
BEGIN
select `order`.ORD_ID, `order`.PRICING_ID, rating.RAT_RATSTARS from `order` inner join rating where `order`.ORD_ID=rating.ORD_ID;
SELECT 
    `order`.PRICING_ID,
    AVG(rating.RAT_RATSTARS) AS rating,
    CASE
        WHEN AVG(rating.RAT_RATSTARS) = 5 THEN 'Excellent Service'
        WHEN AVG(rating.RAT_RATSTARS) > 4 THEN 'Good Service'
        WHEN AVG(rating.RAT_RATSTARS) > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
FROM
    `order`
        INNER JOIN
    rating
WHERE
    `order`.ORD_ID = rating.ORD_ID
GROUP BY `order`.PRICING_ID;
END