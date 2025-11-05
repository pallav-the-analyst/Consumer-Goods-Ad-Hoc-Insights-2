WITH sales_quarter AS (
SELECT
  s.date,
  MONTH(s.date) AS month_num,
CASE
  WHEN MONTH(s.date) IN (9,10,11) THEN "Q1"
  WHEN MONTH(s.date) IN (12,1,2) THEN "Q2"
  WHEN MONTH(s.date) IN (3,4,5) THEN "Q3"
  WHEN MONTH(s.date) IN (6,7,8) THEN "Q4"
END AS quarter,
  sold_quantity,
  fiscal_year
FROM fact_sales_monthly s )
SELECT
  quarter,
  SUM(sold_quantity) AS total_sold_quantity
FROM sales_quarter
WHERE fiscal_year = 2020
GROUP BY quarter
ORDER BY total_sold_quantity DESC;
