SELECT
  p.segment,
  COUNT(DISTINCT p.product) AS unique_product
FROM 
  dim_product p
GROUP BY segment
ORDER BY unique_product DESC;
