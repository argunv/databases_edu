WITH incoming AS (
    SELECT 
        to_account_id AS account_id,
        SUM(amount) AS total_incoming
    FROM money_tansfers
    WHERE YEAR(transfer_datetime) = YEAR(CURRENT_DATE)
      AND MONTH(transfer_datetime) = MONTH(CURRENT_DATE)
    GROUP BY to_account_id
),
outgoing AS (
    SELECT 
        from_account_id AS account_id,
        SUM(amount) AS total_outgoing
    FROM money_tansfers
    WHERE YEAR(transfer_datetime) = YEAR(CURRENT_DATE)
      AND MONTH(transfer_datetime) = MONTH(CURRENT_DATE)
    GROUP BY from_account_id
)
SELECT 
    u.id AS user_id,
    u.f_name,
    u.l_name,
    SUM(COALESCE(i.total_incoming, 0)) AS total_incoming,
    SUM(COALESCE(o.total_outgoing, 0)) AS total_outgoing
FROM users u
JOIN users_to_accounts uta ON u.id = uta.user_id
LEFT JOIN incoming i ON uta.account_id = i.account_id
LEFT JOIN outgoing o ON uta.account_id = o.account_id
GROUP BY u.id, u.f_name, u.l_name
HAVING SUM(COALESCE(i.total_incoming, 0)) > SUM(COALESCE(o.total_outgoing, 0))
ORDER BY u.id;