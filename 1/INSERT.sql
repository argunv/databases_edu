
INSERT INTO users (id, f_name, l_name, birth_date, phone) VALUES
(1, 'Ivan', 'Ivanov', '1990-01-01', '111-111-1111'),
(2, 'Petr', 'Petrov', '1985-05-05', '222-222-2222'),
(3, 'Sidor', 'Sidorov', '1970-10-10', '333-333-3333');

INSERT INTO accounts (id, balance, created_at, daily_limit) VALUES
(1, 10000, '2025-01-01', 5000),
(2, 20000, '2025-01-05', 10000),
(3, 15000, '2025-01-10', 7000);

INSERT INTO users_to_accounts (user_id, account_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 3);

INSERT INTO money_tansfers (id, transfer_datetime, amount, from_account_id, to_account_id) VALUES
(1, CURRENT_TIMESTAMP, 1000, 1, 2),
(2, CURRENT_TIMESTAMP, 2000, 2, 3),
(3, CURRENT_TIMESTAMP, 1500, 1, 3),
(4, CURRENT_TIMESTAMP, 500,  3, 1),
(5, '2024-12-15 12:00:00', 3000, 2, 1);
