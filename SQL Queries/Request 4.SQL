WITH product_2020 AS (
SELECT
  p.segment,
  COUNT(DISTINCT p.product_code) AS product_count_2020
FROM
  dim_product p
      JOIN
  fact_sales_monthly s ON p.product_code = s.product_code
WHERE
  fiscal_year = 2020
GROUP BY p.segment),
product_2021 AS (
SELECT
  p.segment,
  COUNT(DISTINCT p.product_code) AS product_count_2021
FROM
  dim_product p
      JOIN
  fact_sales_monthly s ON p.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY p.segment)
SELECT
  p21.segment,
  p20.product_count_2020,
  p21.product_count_2021,
  (p21.product_count_2021 - p20.product_count_2020) AS difference
FROM product_2020 p20
      JOIN
  product_2021 p21 ON p20.segment=p21.segment
ORDER BY difference;
