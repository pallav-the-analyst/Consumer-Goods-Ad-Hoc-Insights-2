WITH gross_sales AS (
SELECT
  c.channel,
  SUM(g.gross_price*s.sold_quantity)/1000000 AS gross_sales_mln
FROM
  dim_customer c
      JOIN
  fact_sales_monthly s ON c.customer_code = s.customer_code
      JOIN
  fact_gross_price g ON s.product_code = g.product_code
WHERE
  s.fiscal_year = 2021
GROUP BY c.channel)
SELECT
  channel,
  ROUND(gross_sales_mln,2) AS Gross_Sales_Mln,
  ROUND((gross_sales_mln/SUM(gross_sales_mln) OVER())*100,2) AS percentage
FROM gross_sales
ORDER BY Gross_Sales_Mln DESC;
