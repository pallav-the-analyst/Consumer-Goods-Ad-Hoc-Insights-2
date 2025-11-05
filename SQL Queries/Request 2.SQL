WITH product_2020 AS (
SELECT
  COUNT(DISTINCT p.product_code) AS unique_product_2020
FROM
  dim_product p
      JOIN
  fact_sales_monthly s ON p.product_code = s.product_code
WHERE fiscal_year = 2020),
product_2021 AS (
SELECT
  COUNT(DISTINCT p.product_code) AS unique_product_2021
FROM
  dim_product p
      JOIN
  fact_sales_monthly s ON p.product_code = s.product_code
WHERE fiscal_year = 2021)
SELECT
  p20.unique_product_2020,
  p21.unique_product_2021,
  ROUND((unique_product_2021 - unique_product_2020) * 100 / unique_product_2020,2) AS percentage_change
FROM
  product_2020 p20
CROSS JOIN product_2021 p21;
