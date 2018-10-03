-- this statement creates an event that inserts a new record every minute into the messages table.
CREATE EVENT test_event_04
ON SCHEDULE EVERY 1 MINUTE
DO
   INSERT INTO messages(message,created_at)
   VALUES('Test ALTER EVENT statement',NOW());

-- changing schedules:
ALTER EVENT test_event_04
ON SCHEDULE EVERY 2 MINUTE;

-- changing event body
ALTER EVENT test_event_04
DO
   INSERT INTO messages(message,created_at)
   VALUES('Message from event',NOW());

-- disable event
ALTER EVENT test_event_04
DISABLE;

-- check the status of event
SHOW EVENTS FROM classicmodels;

-- Enable events
ALTER EVENT test_event_04
ENABLE;

-- Rename event
ALTER EVENT test_event_04
RENAME TO test_event_05;

-- Move events to another database
ALTER EVENT classicmodels.test_event_05
RENAME TO newdb.test_event_05