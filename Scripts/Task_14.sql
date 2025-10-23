WITH customer_summary AS (
    SELECT  a.customer_id, SUM(a.balance) AS total_balance, COUNT(t.transaction_id) AS transaction_count
    FROM transactions t
    JOIN accounts a ON t.account_id = a.account_id GROUP BY a.customer_id)
SELECT customer_id, total_balance,transaction_count,
    CASE  WHEN total_balance >= 250000 AND transaction_count > 8 THEN 'High'
        WHEN total_balance BETWEEN 10000 AND 249999 AND transaction_count BETWEEN 4 AND 8 THEN 'Medium'
        ELSE 'Low' END AS segment FROM customer_summary ORDER BY total_balance DESC;
