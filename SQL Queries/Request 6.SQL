SELECT
  c.customer,
  c.customer_code,
  ROUND(AVG(pre_invoice_discount_pct),2) AS average_discount_percentage
FROM
  dim_customer c
      JOIN
  fact_pre_invoice_deductions i ON c.customer_code = i.customer_code
WHERE fiscal_year = 2021
      AND market = "India"
GROUP BY c.customer,c.customer_code
ORDER BY average_discount_percentage DESC LIMIT 5;
