-- make sure event scheduler is on, SET GLOBAL event_scheduler = ON;

-- to create and schedule a new one-time event that inserts a message into a table called messages you do the following steps:
CREATE TABLE IF NOT EXISTS messages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL
);

-- create an event,
CREATE EVENT IF NOT EXISTS test_event_01
ON SCHEDULE AT CURRENT_TIMESTAMP
-- to preserve use ON COMPLETION PRESERVE
DO
  INSERT INTO messages(message,created_at)
  VALUES('Test MySQL Event 1',NOW());

-- to show all events of a db schema, nothing will come up in this case cause it was one time event and expired when it's executing completed. to change this behaviour use ON COMPLETION PRESERVER clause.
SHOW EVENTS FROM db_name;

-- this created a recurring event that executes every minute and is expired in 1 hour from its creating time.
CREATE EVENT test_event_03
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
   INSERT INTO messages(message,created_at)
   VALUES('Test MySQL recurring Event',NOW());

-- drop mysql event, For example, to drop the  test_event_03 event
DROP EVENT [IF EXIST] test_event_03; -- DROP EVENT IF EXISTS event_name;

