CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,
    f_name TEXT,
    l_name TEXT,
    birth_date DATE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS accounts (
    id INT PRIMARY KEY,
    balance BIGINT,
    created_at DATE,
    daily_limit BIGINT
);

CREATE TABLE IF NOT EXISTS users_to_accounts (
    user_id INT NOT NULL,
    account_id INT NOT NULL,
    PRIMARY KEY (user_id, account_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

CREATE TABLE IF NOT EXISTS money_tansfers (
    id INT PRIMARY KEY,
    transfer_datetime TIMESTAMP NOT NULL,
    amount BIGINT,
    from_account_id INT NOT NULL,
    to_account_id INT NOT NULL,
    FOREIGN KEY (from_account_id) REFERENCES accounts(id),
    FOREIGN KEY (to_account_id) REFERENCES accounts(id)
);