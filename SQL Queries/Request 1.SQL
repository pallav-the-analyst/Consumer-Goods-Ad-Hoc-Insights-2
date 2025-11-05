SELECT DISTINCT 
  market
FROM
  dim_customer
wHERE
  customer = 'Atliq Exclusive' 
      AND region = 'APAC';
