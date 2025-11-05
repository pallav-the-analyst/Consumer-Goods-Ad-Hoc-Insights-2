WITH product_sales AS (
SELECT 
  p.division,
  p.product,
  p.product_code,
  SUM(s.sold_quantity) AS total_sold_quantity
FROM
  fact_sales_monthly s
      JOIN
  dim_product p ON s.product_code = s.product_code
WHERE 
  s.fiscal_year = 2021
GROUP BY p.division, p.product, p.product_code),
ranked_products AS (
SELECT
  division,
  product_code,
  product,
  total_sold_quantity,
RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
FROM product_sales)
SELECT
  division,
  product,
  product_code,
  total_sold_quantity,
  rank_order
FROM
  ranked_products
WHERE
  rank_order <= 3
ORDER BY division,rank_order;
