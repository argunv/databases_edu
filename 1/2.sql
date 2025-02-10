SELECT 
    u.id AS user_id,
    u.f_name,
    u.l_name,
    COALESCE(SUM(mt.amount), 0) AS total_transferred
FROM users u
JOIN users_to_accounts uta ON u.id = uta.user_id
LEFT JOIN money_tansfers mt ON uta.account_id = mt.from_account_id
    AND YEAR(mt.transfer_datetime) = YEAR(CURRENT_DATE)
    AND MONTH(mt.transfer_datetime) = MONTH(CURRENT_DATE)
GROUP BY u.id, u.f_name, u.l_name
ORDER BY u.id;
