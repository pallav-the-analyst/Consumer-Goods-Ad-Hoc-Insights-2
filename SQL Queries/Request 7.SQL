SELECT
  month(s.date) AS month,
  year(s.date) AS year,
  ROUND(SUM(g.gross_price*s.sold_quantity),2) AS gross_sales_amount
FROM
  dim_customer c
      JOIN
  fact_sales_monthly s ON c.customer_code = s.customer_code
      JOIN
  fact_gross_price g on s.product_code = g.product_code
WHERE customer = "Atliq Exclusive"
GROUP BY month;
