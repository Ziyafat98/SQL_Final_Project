SELECT c.customer_id,SUM(c.credit_amount) AS total_credit,  
SUM(a.balance) AS total_balance,CASE 
        WHEN SUM(a.balance) = 0 THEN NULL  
        ELSE round(SUM(c.credit_amount) / SUM(a.balance),2) END AS credit_to_balance_ratio
FROM credits c JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id
ORDER BY credit_to_balance_ratio DESC;
