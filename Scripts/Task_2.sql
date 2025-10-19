SELECT city, round (avg(balance), 2) AS avg_city_balance, count(transaction_id) AS transaction_count 
FROM customers LEFT JOIN accounts USING (customer_id)
LEFT JOIN transactions USING (account_id) GROUP BY city ORDER BY avg(balance) DESC;
