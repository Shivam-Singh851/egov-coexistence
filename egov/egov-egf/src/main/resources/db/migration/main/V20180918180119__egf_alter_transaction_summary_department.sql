ALTER TABLE TRANSACTIONSUMMARY RENAME COLUMN departmentid TO departmentcode;
ALTER TABLE TRANSACTIONSUMMARY ALTER COLUMN departmentcode TYPE character varying(50);
