use greesdb;
-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Scenario 1: Process monthly interest for all savings accounts (1%)
DELIMITER //
CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
    UPDATE Accounts
    SET Balance = Balance * 1.01
    WHERE AccountType = 'Savings';
END;
//
DELIMITER ;

-- Example execution:
-- CALL ProcessMonthlyInterest();

-- Scenario 2: Add bonus to employee salaries in a department
DELIMITER //
CREATE PROCEDURE UpdateEmployeeBonus(
    IN dept_name VARCHAR(50),
    IN bonus_percent DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonus_percent / 100)
    WHERE Department = dept_name;
END;
//
DELIMITER ;

-- Example execution:
-- CALL UpdateEmployeeBonus('IT', 10);

-- Scenario 3: Transfer funds between accounts (with balance check)
DELIMITER //
CREATE PROCEDURE TransferFunds(
    IN from_account_id INT,
    IN to_account_id INT,
    IN transfer_amount DECIMAL(10,2)
)
BEGIN
    DECLARE sender_balance DECIMAL(10,2);

    -- Get balance of source account
    SELECT Balance INTO sender_balance
    FROM Accounts
    WHERE AccountID = from_account_id;

    -- Check for sufficient balance
    IF sender_balance >= transfer_amount THEN
        UPDATE Accounts
        SET Balance = Balance - transfer_amount
        WHERE AccountID = from_account_id;

        UPDATE Accounts
        SET Balance = Balance + transfer_amount
        WHERE AccountID = to_account_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient funds in source account';
    END IF;
END;
//
DELIMITER ;

-- Example execution:
-- CALL TransferFunds(1, 2, 200);