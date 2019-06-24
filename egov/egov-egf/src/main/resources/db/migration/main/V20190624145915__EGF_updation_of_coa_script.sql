-- For 210-40
INSERT INTO chartofaccounts (id, glcode, name, description, isactiveforposting, parentid, lastmodifieddate, lastmodifiedby, createddate, purposeid, operation, type, class, classification, functionreqd, budgetcheckreq, scheduleid, receiptscheduleid, receiptoperation, paymentscheduleid, paymentoperation, majorcode, createdby, fiescheduleid, fieoperation) VALUES (nextval('seq_chartofaccounts'), '2104004', 'Retired Employees Benefits', NULL, true, (select id from chartofaccounts where glcode='21040'), NULL, 1, now(), NULL, NULL, 'E', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '210', 1, NULL, NULL) ON CONFLICT DO NOTHING;

-- For 220-80
INSERT INTO chartofaccounts (id, glcode, name, description, isactiveforposting, parentid, lastmodifieddate, lastmodifiedby, createddate, purposeid, operation, type, class, classification, functionreqd, budgetcheckreq, scheduleid, receiptscheduleid, receiptoperation, paymentscheduleid, paymentoperation, majorcode, createdby, fiescheduleid, fieoperation) VALUES (nextval('seq_chartofaccounts'), '2208016', 'Night Shelter Expense', NULL, true, (select id from chartofaccounts where glcode='22080'), NULL, 1, now(), NULL, NULL, 'E', NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '220', 1, NULL, NULL) ON CONFLICT DO NOTHING;