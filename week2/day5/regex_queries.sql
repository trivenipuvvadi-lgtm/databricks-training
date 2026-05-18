**Schema (MySQL v8)**

    CREATE TABLE regex_practice (
    id INT,
    full_text VARCHAR(200),
    email VARCHAR(100),
    phone VARCHAR(30),
    mixed_value VARCHAR(100)
    );
    INSERT INTO regex_practice VALUES
    (1,'EMP001_IN_91','karthik@gmail.com','+91-9876543210','abc123xyz'),
    (2,'EMP002_US_01','rahul@yahoo.com','+1-7654321098','test45done'),
    (3,'EMP003_UK_44','john@outlook.com','+44-9988776655','run9fast'),
    (4,'EMP004_AU_61','steve@gmail.com','+61-8899776655','go88home'),
    (5,'EMP005_IN_91','arjun@company.in','+91-7788996655','data77lake'),
    (6,'EMP006_US_01','meera@gmail.com','+1-9090909090','spark12sql'),
    (7,'EMP007_UK_44','rohan@yahoo.com','+44-7878787878','etl999job'),
    (8,'EMP008_AU_61','alice@company.au','+61-6665554443','cloud7aws'),
    (9,'EMP009_IN_91','vinay@gmail.com','+91-9988776655','hdfs34node'),
    (10,'EMP010_US_01','sam@outlook.com','+1-6767676767','map5reduce'),
    (11,'USR11_IN','neha@gmail.com','91-8899001122','abc1'),
    (12,'USR12_US','tom@yahoo.com','01-9988776655','x9'),
    (13,'USR13_UK','harry@company.co.uk','44-6677889900','z88'),
    (14,'USR14_AU','olivia@gmail.com','61-4455667788','q777'),
    (15,'USR15_IN','ankit@company.in','91-9988001122','karthik99'),
    (16,'ACC_1001_91','user1@gmail.com','+91-8877665544','etl1'),
    (17,'ACC_1002_01','user2@yahoo.com','+1-2233445566','etl22'),
    (18,'ACC_1003_44','user3@outlook.com','+44-3344556677','etl333'),
    (19,'ACC_1004_61','user4@gmail.com','+61-5566778899','etl4444'),
    (20,'ACC_1005_91','user5@company.in','+91-6677889900','etl55555'),
    (21,'ORD-11-IN','a@gmail.com','91-9998887776','a1b2'),
    (22,'ORD-22-US','b@yahoo.com','01-1112223334','x2y'),
    (23,'ORD-33-UK','c@outlook.com','44-5556667778','m33n'),
    (24,'ORD-44-AU','d@gmail.com','61-8887776665','k444'),
    (25,'ORD-55-IN','e@company.in','91-4445556667','job5'),
    (26,'LOG91DATA','x@gmail.com','91-9090909090','log99'),
    (27,'LOG01DATA','y@yahoo.com','01-8080808080','log8'),
    (28,'LOG44DATA','z@outlook.com','44-7070707070','log777'),
    (29,'LOG61DATA','p@gmail.com','61-6060606060','log6666'),
    (30,'LOG91DATA','q@company.in','91-5050505050','log55555'),
    (31,'IND91CODE','aa@gmail.com','+91-8889990001','aa1'),
    (32,'USA01CODE','bb@yahoo.com','+1-7776665554','bb22'),
    (33,'UK44CODE','cc@outlook.com','+44-6665554443','cc333'),
    (34,'AUS61CODE','dd@gmail.com','+61-5554443332','dd4444'),
    (35,'IND91CODE','ee@company.in','+91-4443332221','ee55555'),
    (36,'TEST001','test1@gmail.com','91-1111111111','t1'),
    (37,'TEST002','test2@yahoo.com','01-2222222222','t22'),
    (38,'TEST003','test3@outlook.com','44-3333333333','t333'),
    (39,'TEST004','test4@gmail.com','61-4444444444','t4444'),
    (40,'TEST005','test5@company.in','91-5555555555','t55555');

---

**Query #1**

    -- Q1: Extract numeric characters at the beginning of mixed_value
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '^[0-9]+')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '^[0-9]+') |
| ----------- | ------------------------------------- |
| abc123xyz   |                                       |
| test45done  |                                       |
| run9fast    |                                       |
| go88home    |                                       |
| data77lake  |                                       |
| spark12sql  |                                       |
| etl999job   |                                       |
| cloud7aws   |                                       |
| hdfs34node  |                                       |
| map5reduce  |                                       |
| abc1        |                                       |
| x9          |                                       |
| z88         |                                       |
| q777        |                                       |
| karthik99   |                                       |
| etl1        |                                       |
| etl22       |                                       |
| etl333      |                                       |
| etl4444     |                                       |
| etl55555    |                                       |
| a1b2        |                                       |
| x2y         |                                       |
| m33n        |                                       |
| k444        |                                       |
| job5        |                                       |
| log99       |                                       |
| log8        |                                       |
| log777      |                                       |
| log6666     |                                       |
| log55555    |                                       |
| aa1         |                                       |
| bb22        |                                       |
| cc333       |                                       |
| dd4444      |                                       |
| ee55555     |                                       |
| t1          |                                       |
| t22         |                                       |
| t333        |                                       |
| t4444       |                                       |
| t55555      |                                       |

---
**Query #2**

    -- Q2: Extract numeric characters at the end of mixed_value
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '[0-9]+$')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '[0-9]+$') |
| ----------- | ------------------------------------- |
| abc123xyz   |                                       |
| test45done  |                                       |
| run9fast    |                                       |
| go88home    |                                       |
| data77lake  |                                       |
| spark12sql  |                                       |
| etl999job   |                                       |
| cloud7aws   |                                       |
| hdfs34node  |                                       |
| map5reduce  |                                       |
| abc1        | 1                                     |
| x9          | 9                                     |
| z88         | 88                                    |
| q777        | 777                                   |
| karthik99   | 99                                    |
| etl1        | 1                                     |
| etl22       | 22                                    |
| etl333      | 333                                   |
| etl4444     | 4444                                  |
| etl55555    | 55555                                 |
| a1b2        | 2                                     |
| x2y         |                                       |
| m33n        |                                       |
| k444        | 444                                   |
| job5        | 5                                     |
| log99       | 99                                    |
| log8        | 8                                     |
| log777      | 777                                   |
| log6666     | 6666                                  |
| log55555    | 55555                                 |
| aa1         | 1                                     |
| bb22        | 22                                    |
| cc333       | 333                                   |
| dd4444      | 4444                                  |
| ee55555     | 55555                                 |
| t1          | 1                                     |
| t22         | 22                                    |
| t333        | 333                                   |
| t4444       | 4444                                  |
| t55555      | 55555                                 |

---
**Query #3**

    -- Q3: Extract first single character
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '^.')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '^.') |
| ----------- | -------------------------------- |
| abc123xyz   | a                                |
| test45done  | t                                |
| run9fast    | r                                |
| go88home    | g                                |
| data77lake  | d                                |
| spark12sql  | s                                |
| etl999job   | e                                |
| cloud7aws   | c                                |
| hdfs34node  | h                                |
| map5reduce  | m                                |
| abc1        | a                                |
| x9          | x                                |
| z88         | z                                |
| q777        | q                                |
| karthik99   | k                                |
| etl1        | e                                |
| etl22       | e                                |
| etl333      | e                                |
| etl4444     | e                                |
| etl55555    | e                                |
| a1b2        | a                                |
| x2y         | x                                |
| m33n        | m                                |
| k444        | k                                |
| job5        | j                                |
| log99       | l                                |
| log8        | l                                |
| log777      | l                                |
| log6666     | l                                |
| log55555    | l                                |
| aa1         | a                                |
| bb22        | b                                |
| cc333       | c                                |
| dd4444      | d                                |
| ee55555     | e                                |
| t1          | t                                |
| t22         | t                                |
| t333        | t                                |
| t4444       | t                                |
| t55555      | t                                |

---
**Query #4**

    -- Q4: Extract last single character
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '.$')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '.$') |
| ----------- | -------------------------------- |
| abc123xyz   | z                                |
| test45done  | e                                |
| run9fast    | t                                |
| go88home    | e                                |
| data77lake  | e                                |
| spark12sql  | l                                |
| etl999job   | b                                |
| cloud7aws   | s                                |
| hdfs34node  | e                                |
| map5reduce  | e                                |
| abc1        | 1                                |
| x9          | 9                                |
| z88         | 8                                |
| q777        | 7                                |
| karthik99   | 9                                |
| etl1        | 1                                |
| etl22       | 2                                |
| etl333      | 3                                |
| etl4444     | 4                                |
| etl55555    | 5                                |
| a1b2        | 2                                |
| x2y         | y                                |
| m33n        | n                                |
| k444        | 4                                |
| job5        | 5                                |
| log99       | 9                                |
| log8        | 8                                |
| log777      | 7                                |
| log6666     | 6                                |
| log55555    | 5                                |
| aa1         | 1                                |
| bb22        | 2                                |
| cc333       | 3                                |
| dd4444      | 4                                |
| ee55555     | 5                                |
| t1          | 1                                |
| t22         | 2                                |
| t333        | 3                                |
| t4444       | 4                                |
| t55555      | 5                                |

---
**Query #5**

    -- Q5: Extract exactly 2 consecutive digits
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '[0-9]{2}')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '[0-9]{2}') |
| ----------- | -------------------------------------- |
| abc123xyz   | 12                                     |
| test45done  | 45                                     |
| run9fast    |                                        |
| go88home    | 88                                     |
| data77lake  | 77                                     |
| spark12sql  | 12                                     |
| etl999job   | 99                                     |
| cloud7aws   |                                        |
| hdfs34node  | 34                                     |
| map5reduce  |                                        |
| abc1        |                                        |
| x9          |                                        |
| z88         | 88                                     |
| q777        | 77                                     |
| karthik99   | 99                                     |
| etl1        |                                        |
| etl22       | 22                                     |
| etl333      | 33                                     |
| etl4444     | 44                                     |
| etl55555    | 55                                     |
| a1b2        |                                        |
| x2y         |                                        |
| m33n        | 33                                     |
| k444        | 44                                     |
| job5        |                                        |
| log99       | 99                                     |
| log8        |                                        |
| log777      | 77                                     |
| log6666     | 66                                     |
| log55555    | 55                                     |
| aa1         |                                        |
| bb22        | 22                                     |
| cc333       | 33                                     |
| dd4444      | 44                                     |
| ee55555     | 55                                     |
| t1          |                                        |
| t22         | 22                                     |
| t333        | 33                                     |
| t4444       | 44                                     |
| t55555      | 55                                     |

---
**Query #6**

    -- Q6: Extract exactly 1 digit
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '[0-9]')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '[0-9]') |
| ----------- | ----------------------------------- |
| abc123xyz   | 1                                   |
| test45done  | 4                                   |
| run9fast    | 9                                   |
| go88home    | 8                                   |
| data77lake  | 7                                   |
| spark12sql  | 1                                   |
| etl999job   | 9                                   |
| cloud7aws   | 7                                   |
| hdfs34node  | 3                                   |
| map5reduce  | 5                                   |
| abc1        | 1                                   |
| x9          | 9                                   |
| z88         | 8                                   |
| q777        | 7                                   |
| karthik99   | 9                                   |
| etl1        | 1                                   |
| etl22       | 2                                   |
| etl333      | 3                                   |
| etl4444     | 4                                   |
| etl55555    | 5                                   |
| a1b2        | 1                                   |
| x2y         | 2                                   |
| m33n        | 3                                   |
| k444        | 4                                   |
| job5        | 5                                   |
| log99       | 9                                   |
| log8        | 8                                   |
| log777      | 7                                   |
| log6666     | 6                                   |
| log55555    | 5                                   |
| aa1         | 1                                   |
| bb22        | 2                                   |
| cc333       | 3                                   |
| dd4444      | 4                                   |
| ee55555     | 5                                   |
| t1          | 1                                   |
| t22         | 2                                   |
| t333        | 3                                   |
| t4444       | 4                                   |
| t55555      | 5                                   |

---
**Query #7**

    -- Q7: Extract country code from phone
    SELECT phone,
           REGEXP_SUBSTR(phone, '[0-9]+')
    FROM regex_practice;

| phone          | REGEXP_SUBSTR(phone, '[0-9]+') |
| -------------- | ------------------------------ |
| +91-9876543210 | 91                             |
| +1-7654321098  | 1                              |
| +44-9988776655 | 44                             |
| +61-8899776655 | 61                             |
| +91-7788996655 | 91                             |
| +1-9090909090  | 1                              |
| +44-7878787878 | 44                             |
| +61-6665554443 | 61                             |
| +91-9988776655 | 91                             |
| +1-6767676767  | 1                              |
| 91-8899001122  | 91                             |
| 01-9988776655  | 01                             |
| 44-6677889900  | 44                             |
| 61-4455667788  | 61                             |
| 91-9988001122  | 91                             |
| +91-8877665544 | 91                             |
| +1-2233445566  | 1                              |
| +44-3344556677 | 44                             |
| +61-5566778899 | 61                             |
| +91-6677889900 | 91                             |
| 91-9998887776  | 91                             |
| 01-1112223334  | 01                             |
| 44-5556667778  | 44                             |
| 61-8887776665  | 61                             |
| 91-4445556667  | 91                             |
| 91-9090909090  | 91                             |
| 01-8080808080  | 01                             |
| 44-7070707070  | 44                             |
| 61-6060606060  | 61                             |
| 91-5050505050  | 91                             |
| +91-8889990001 | 91                             |
| +1-7776665554  | 1                              |
| +44-6665554443 | 44                             |
| +61-5554443332 | 61                             |
| +91-4443332221 | 91                             |
| 91-1111111111  | 91                             |
| 01-2222222222  | 01                             |
| 44-3333333333  | 44                             |
| 61-4444444444  | 61                             |
| 91-5555555555  | 91                             |

---
**Query #8**

    -- Q8: Extract numeric portion between alphabets
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '[0-9]+')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '[0-9]+') |
| ----------- | ------------------------------------ |
| abc123xyz   | 123                                  |
| test45done  | 45                                   |
| run9fast    | 9                                    |
| go88home    | 88                                   |
| data77lake  | 77                                   |
| spark12sql  | 12                                   |
| etl999job   | 999                                  |
| cloud7aws   | 7                                    |
| hdfs34node  | 34                                   |
| map5reduce  | 5                                    |
| abc1        | 1                                    |
| x9          | 9                                    |
| z88         | 88                                   |
| q777        | 777                                  |
| karthik99   | 99                                   |
| etl1        | 1                                    |
| etl22       | 22                                   |
| etl333      | 333                                  |
| etl4444     | 4444                                 |
| etl55555    | 55555                                |
| a1b2        | 1                                    |
| x2y         | 2                                    |
| m33n        | 33                                   |
| k444        | 444                                  |
| job5        | 5                                    |
| log99       | 99                                   |
| log8        | 8                                    |
| log777      | 777                                  |
| log6666     | 6666                                 |
| log55555    | 55555                                |
| aa1         | 1                                    |
| bb22        | 22                                   |
| cc333       | 333                                  |
| dd4444      | 4444                                 |
| ee55555     | 55555                                |
| t1          | 1                                    |
| t22         | 22                                   |
| t333        | 333                                  |
| t4444       | 4444                                 |
| t55555      | 55555                                |

---
**Query #9**

    -- Q9: Extract text before @ from email
    SELECT email,
           REGEXP_SUBSTR(email, '^[^@]+')
    FROM regex_practice;

| email               | REGEXP_SUBSTR(email, '^[^@]+') |
| ------------------- | ------------------------------ |
| karthik@gmail.com   | karthik                        |
| rahul@yahoo.com     | rahul                          |
| john@outlook.com    | john                           |
| steve@gmail.com     | steve                          |
| arjun@company.in    | arjun                          |
| meera@gmail.com     | meera                          |
| rohan@yahoo.com     | rohan                          |
| alice@company.au    | alice                          |
| vinay@gmail.com     | vinay                          |
| sam@outlook.com     | sam                            |
| neha@gmail.com      | neha                           |
| tom@yahoo.com       | tom                            |
| harry@company.co.uk | harry                          |
| olivia@gmail.com    | olivia                         |
| ankit@company.in    | ankit                          |
| user1@gmail.com     | user1                          |
| user2@yahoo.com     | user2                          |
| user3@outlook.com   | user3                          |
| user4@gmail.com     | user4                          |
| user5@company.in    | user5                          |
| a@gmail.com         | a                              |
| b@yahoo.com         | b                              |
| c@outlook.com       | c                              |
| d@gmail.com         | d                              |
| e@company.in        | e                              |
| x@gmail.com         | x                              |
| y@yahoo.com         | y                              |
| z@outlook.com       | z                              |
| p@gmail.com         | p                              |
| q@company.in        | q                              |
| aa@gmail.com        | aa                             |
| bb@yahoo.com        | bb                             |
| cc@outlook.com      | cc                             |
| dd@gmail.com        | dd                             |
| ee@company.in       | ee                             |
| test1@gmail.com     | test1                          |
| test2@yahoo.com     | test2                          |
| test3@outlook.com   | test3                          |
| test4@gmail.com     | test4                          |
| test5@company.in    | test5                          |

---
**Query #10**

    -- Q10: Extract text after @ including domain
    SELECT email,
           REGEXP_SUBSTR(email, '@[^ ]+')
    FROM regex_practice;

| email               | REGEXP_SUBSTR(email, '@[^ ]+') |
| ------------------- | ------------------------------ |
| karthik@gmail.com   | @gmail.com                     |
| rahul@yahoo.com     | @yahoo.com                     |
| john@outlook.com    | @outlook.com                   |
| steve@gmail.com     | @gmail.com                     |
| arjun@company.in    | @company.in                    |
| meera@gmail.com     | @gmail.com                     |
| rohan@yahoo.com     | @yahoo.com                     |
| alice@company.au    | @company.au                    |
| vinay@gmail.com     | @gmail.com                     |
| sam@outlook.com     | @outlook.com                   |
| neha@gmail.com      | @gmail.com                     |
| tom@yahoo.com       | @yahoo.com                     |
| harry@company.co.uk | @company.co.uk                 |
| olivia@gmail.com    | @gmail.com                     |
| ankit@company.in    | @company.in                    |
| user1@gmail.com     | @gmail.com                     |
| user2@yahoo.com     | @yahoo.com                     |
| user3@outlook.com   | @outlook.com                   |
| user4@gmail.com     | @gmail.com                     |
| user5@company.in    | @company.in                    |
| a@gmail.com         | @gmail.com                     |
| b@yahoo.com         | @yahoo.com                     |
| c@outlook.com       | @outlook.com                   |
| d@gmail.com         | @gmail.com                     |
| e@company.in        | @company.in                    |
| x@gmail.com         | @gmail.com                     |
| y@yahoo.com         | @yahoo.com                     |
| z@outlook.com       | @outlook.com                   |
| p@gmail.com         | @gmail.com                     |
| q@company.in        | @company.in                    |
| aa@gmail.com        | @gmail.com                     |
| bb@yahoo.com        | @yahoo.com                     |
| cc@outlook.com      | @outlook.com                   |
| dd@gmail.com        | @gmail.com                     |
| ee@company.in       | @company.in                    |
| test1@gmail.com     | @gmail.com                     |
| test2@yahoo.com     | @yahoo.com                     |
| test3@outlook.com   | @outlook.com                   |
| test4@gmail.com     | @gmail.com                     |
| test5@company.in    | @company.in                    |

---
**Query #11**

    -- Q11: Extract domain without @
    SELECT email,
           REPLACE(
               REGEXP_SUBSTR(email, '@[^ ]+'),
               '@',
               ''
           ) AS domain
    FROM regex_practice;

| email               | domain        |
| ------------------- | ------------- |
| karthik@gmail.com   | gmail.com     |
| rahul@yahoo.com     | yahoo.com     |
| john@outlook.com    | outlook.com   |
| steve@gmail.com     | gmail.com     |
| arjun@company.in    | company.in    |
| meera@gmail.com     | gmail.com     |
| rohan@yahoo.com     | yahoo.com     |
| alice@company.au    | company.au    |
| vinay@gmail.com     | gmail.com     |
| sam@outlook.com     | outlook.com   |
| neha@gmail.com      | gmail.com     |
| tom@yahoo.com       | yahoo.com     |
| harry@company.co.uk | company.co.uk |
| olivia@gmail.com    | gmail.com     |
| ankit@company.in    | company.in    |
| user1@gmail.com     | gmail.com     |
| user2@yahoo.com     | yahoo.com     |
| user3@outlook.com   | outlook.com   |
| user4@gmail.com     | gmail.com     |
| user5@company.in    | company.in    |
| a@gmail.com         | gmail.com     |
| b@yahoo.com         | yahoo.com     |
| c@outlook.com       | outlook.com   |
| d@gmail.com         | gmail.com     |
| e@company.in        | company.in    |
| x@gmail.com         | gmail.com     |
| y@yahoo.com         | yahoo.com     |
| z@outlook.com       | outlook.com   |
| p@gmail.com         | gmail.com     |
| q@company.in        | company.in    |
| aa@gmail.com        | gmail.com     |
| bb@yahoo.com        | yahoo.com     |
| cc@outlook.com      | outlook.com   |
| dd@gmail.com        | gmail.com     |
| ee@company.in       | company.in    |
| test1@gmail.com     | gmail.com     |
| test2@yahoo.com     | yahoo.com     |
| test3@outlook.com   | outlook.com   |
| test4@gmail.com     | gmail.com     |
| test5@company.in    | company.in    |

---
**Query #12**

    -- Q12: Extract text after last dot
    SELECT email,
           REGEXP_SUBSTR(email, '[^.]+$')
    FROM regex_practice;

| email               | REGEXP_SUBSTR(email, '[^.]+$') |
| ------------------- | ------------------------------ |
| karthik@gmail.com   | com                            |
| rahul@yahoo.com     | com                            |
| john@outlook.com    | com                            |
| steve@gmail.com     | com                            |
| arjun@company.in    | in                             |
| meera@gmail.com     | com                            |
| rohan@yahoo.com     | com                            |
| alice@company.au    | au                             |
| vinay@gmail.com     | com                            |
| sam@outlook.com     | com                            |
| neha@gmail.com      | com                            |
| tom@yahoo.com       | com                            |
| harry@company.co.uk | uk                             |
| olivia@gmail.com    | com                            |
| ankit@company.in    | in                             |
| user1@gmail.com     | com                            |
| user2@yahoo.com     | com                            |
| user3@outlook.com   | com                            |
| user4@gmail.com     | com                            |
| user5@company.in    | in                             |
| a@gmail.com         | com                            |
| b@yahoo.com         | com                            |
| c@outlook.com       | com                            |
| d@gmail.com         | com                            |
| e@company.in        | in                             |
| x@gmail.com         | com                            |
| y@yahoo.com         | com                            |
| z@outlook.com       | com                            |
| p@gmail.com         | com                            |
| q@company.in        | in                             |
| aa@gmail.com        | com                            |
| bb@yahoo.com        | com                            |
| cc@outlook.com      | com                            |
| dd@gmail.com        | com                            |
| ee@company.in       | in                             |
| test1@gmail.com     | com                            |
| test2@yahoo.com     | com                            |
| test3@outlook.com   | com                            |
| test4@gmail.com     | com                            |
| test5@company.in    | in                             |

---
**Query #13**

    -- Q13: Extract continuous alphabets
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '[A-Za-z]+')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '[A-Za-z]+') |
| ----------- | --------------------------------------- |
| abc123xyz   | abc                                     |
| test45done  | test                                    |
| run9fast    | run                                     |
| go88home    | go                                      |
| data77lake  | data                                    |
| spark12sql  | spark                                   |
| etl999job   | etl                                     |
| cloud7aws   | cloud                                   |
| hdfs34node  | hdfs                                    |
| map5reduce  | map                                     |
| abc1        | abc                                     |
| x9          | x                                       |
| z88         | z                                       |
| q777        | q                                       |
| karthik99   | karthik                                 |
| etl1        | etl                                     |
| etl22       | etl                                     |
| etl333      | etl                                     |
| etl4444     | etl                                     |
| etl55555    | etl                                     |
| a1b2        | a                                       |
| x2y         | x                                       |
| m33n        | m                                       |
| k444        | k                                       |
| job5        | job                                     |
| log99       | log                                     |
| log8        | log                                     |
| log777      | log                                     |
| log6666     | log                                     |
| log55555    | log                                     |
| aa1         | aa                                      |
| bb22        | bb                                      |
| cc333       | cc                                      |
| dd4444      | dd                                      |
| ee55555     | ee                                      |
| t1          | t                                       |
| t22         | t                                       |
| t333        | t                                       |
| t4444       | t                                       |
| t55555      | t                                       |

---
**Query #14**

    -- Q14: Extract continuous digits
    SELECT mixed_value,
           REGEXP_SUBSTR(mixed_value, '[0-9]+')
    FROM regex_practice;

| mixed_value | REGEXP_SUBSTR(mixed_value, '[0-9]+') |
| ----------- | ------------------------------------ |
| abc123xyz   | 123                                  |
| test45done  | 45                                   |
| run9fast    | 9                                    |
| go88home    | 88                                   |
| data77lake  | 77                                   |
| spark12sql  | 12                                   |
| etl999job   | 999                                  |
| cloud7aws   | 7                                    |
| hdfs34node  | 34                                   |
| map5reduce  | 5                                    |
| abc1        | 1                                    |
| x9          | 9                                    |
| z88         | 88                                   |
| q777        | 777                                  |
| karthik99   | 99                                   |
| etl1        | 1                                    |
| etl22       | 22                                   |
| etl333      | 333                                  |
| etl4444     | 4444                                 |
| etl55555    | 55555                                |
| a1b2        | 1                                    |
| x2y         | 2                                    |
| m33n        | 33                                   |
| k444        | 444                                  |
| job5        | 5                                    |
| log99       | 99                                   |
| log8        | 8                                    |
| log777      | 777                                  |
| log6666     | 6666                                 |
| log55555    | 55555                                |
| aa1         | 1                                    |
| bb22        | 22                                   |
| cc333       | 333                                  |
| dd4444      | 4444                                 |
| ee55555     | 55555                                |
| t1          | 1                                    |
| t22         | 22                                   |
| t333        | 333                                  |
| t4444       | 4444                                 |
| t55555      | 55555                                |

---
**Query #15**

    -- Q15: Extract first 3 characters from full_text
    SELECT full_text,
           REGEXP_SUBSTR(full_text, '^.{3}')
    FROM regex_practice;

| full_text    | REGEXP_SUBSTR(full_text, '^.{3}') |
| ------------ | --------------------------------- |
| EMP001_IN_91 | EMP                               |
| EMP002_US_01 | EMP                               |
| EMP003_UK_44 | EMP                               |
| EMP004_AU_61 | EMP                               |
| EMP005_IN_91 | EMP                               |
| EMP006_US_01 | EMP                               |
| EMP007_UK_44 | EMP                               |
| EMP008_AU_61 | EMP                               |
| EMP009_IN_91 | EMP                               |
| EMP010_US_01 | EMP                               |
| USR11_IN     | USR                               |
| USR12_US     | USR                               |
| USR13_UK     | USR                               |
| USR14_AU     | USR                               |
| USR15_IN     | USR                               |
| ACC_1001_91  | ACC                               |
| ACC_1002_01  | ACC                               |
| ACC_1003_44  | ACC                               |
| ACC_1004_61  | ACC                               |
| ACC_1005_91  | ACC                               |
| ORD-11-IN    | ORD                               |
| ORD-22-US    | ORD                               |
| ORD-33-UK    | ORD                               |
| ORD-44-AU    | ORD                               |
| ORD-55-IN    | ORD                               |
| LOG91DATA    | LOG                               |
| LOG01DATA    | LOG                               |
| LOG44DATA    | LOG                               |
| LOG61DATA    | LOG                               |
| LOG91DATA    | LOG                               |
| IND91CODE    | IND                               |
| USA01CODE    | USA                               |
| UK44CODE     | UK4                               |
| AUS61CODE    | AUS                               |
| IND91CODE    | IND                               |
| TEST001      | TES                               |
| TEST002      | TES                               |
| TEST003      | TES                               |
| TEST004      | TES                               |
| TEST005      | TES                               |

---
**Query #16**

    -- Q16: Extract last 2 characters
    SELECT full_text,
           REGEXP_SUBSTR(full_text, '.{2}$')
    FROM regex_practice;

| full_text    | REGEXP_SUBSTR(full_text, '.{2}$') |
| ------------ | --------------------------------- |
| EMP001_IN_91 | 91                                |
| EMP002_US_01 | 01                                |
| EMP003_UK_44 | 44                                |
| EMP004_AU_61 | 61                                |
| EMP005_IN_91 | 91                                |
| EMP006_US_01 | 01                                |
| EMP007_UK_44 | 44                                |
| EMP008_AU_61 | 61                                |
| EMP009_IN_91 | 91                                |
| EMP010_US_01 | 01                                |
| USR11_IN     | IN                                |
| USR12_US     | US                                |
| USR13_UK     | UK                                |
| USR14_AU     | AU                                |
| USR15_IN     | IN                                |
| ACC_1001_91  | 91                                |
| ACC_1002_01  | 01                                |
| ACC_1003_44  | 44                                |
| ACC_1004_61  | 61                                |
| ACC_1005_91  | 91                                |
| ORD-11-IN    | IN                                |
| ORD-22-US    | US                                |
| ORD-33-UK    | UK                                |
| ORD-44-AU    | AU                                |
| ORD-55-IN    | IN                                |
| LOG91DATA    | TA                                |
| LOG01DATA    | TA                                |
| LOG44DATA    | TA                                |
| LOG61DATA    | TA                                |
| LOG91DATA    | TA                                |
| IND91CODE    | DE                                |
| USA01CODE    | DE                                |
| UK44CODE     | DE                                |
| AUS61CODE    | DE                                |
| IND91CODE    | DE                                |
| TEST001      | 01                                |
| TEST002      | 02                                |
| TEST003      | 03                                |
| TEST004      | 04                                |
| TEST005      | 05                                |

---
**Query #17**

    -- Q17: Extract employee number between prefix and first underscore
    SELECT full_text,
           REGEXP_SUBSTR(full_text, '[0-9]+')
    FROM regex_practice;

| full_text    | REGEXP_SUBSTR(full_text, '[0-9]+') |
| ------------ | ---------------------------------- |
| EMP001_IN_91 | 001                                |
| EMP002_US_01 | 002                                |
| EMP003_UK_44 | 003                                |
| EMP004_AU_61 | 004                                |
| EMP005_IN_91 | 005                                |
| EMP006_US_01 | 006                                |
| EMP007_UK_44 | 007                                |
| EMP008_AU_61 | 008                                |
| EMP009_IN_91 | 009                                |
| EMP010_US_01 | 010                                |
| USR11_IN     | 11                                 |
| USR12_US     | 12                                 |
| USR13_UK     | 13                                 |
| USR14_AU     | 14                                 |
| USR15_IN     | 15                                 |
| ACC_1001_91  | 1001                               |
| ACC_1002_01  | 1002                               |
| ACC_1003_44  | 1003                               |
| ACC_1004_61  | 1004                               |
| ACC_1005_91  | 1005                               |
| ORD-11-IN    | 11                                 |
| ORD-22-US    | 22                                 |
| ORD-33-UK    | 33                                 |
| ORD-44-AU    | 44                                 |
| ORD-55-IN    | 55                                 |
| LOG91DATA    | 91                                 |
| LOG01DATA    | 01                                 |
| LOG44DATA    | 44                                 |
| LOG61DATA    | 61                                 |
| LOG91DATA    | 91                                 |
| IND91CODE    | 91                                 |
| USA01CODE    | 01                                 |
| UK44CODE     | 44                                 |
| AUS61CODE    | 61                                 |
| IND91CODE    | 91                                 |
| TEST001      | 001                                |
| TEST002      | 002                                |
| TEST003      | 003                                |
| TEST004      | 004                                |
| TEST005      | 005                                |

---
**Query #18**

    -- Q18: Extract country code at end of full_text
    SELECT full_text,
           REGEXP_SUBSTR(full_text, '[0-9]+$')
    FROM regex_practice;

| full_text    | REGEXP_SUBSTR(full_text, '[0-9]+$') |
| ------------ | ----------------------------------- |
| EMP001_IN_91 | 91                                  |
| EMP002_US_01 | 01                                  |
| EMP003_UK_44 | 44                                  |
| EMP004_AU_61 | 61                                  |
| EMP005_IN_91 | 91                                  |
| EMP006_US_01 | 01                                  |
| EMP007_UK_44 | 44                                  |
| EMP008_AU_61 | 61                                  |
| EMP009_IN_91 | 91                                  |
| EMP010_US_01 | 01                                  |
| USR11_IN     |                                     |
| USR12_US     |                                     |
| USR13_UK     |                                     |
| USR14_AU     |                                     |
| USR15_IN     |                                     |
| ACC_1001_91  | 91                                  |
| ACC_1002_01  | 01                                  |
| ACC_1003_44  | 44                                  |
| ACC_1004_61  | 61                                  |
| ACC_1005_91  | 91                                  |
| ORD-11-IN    |                                     |
| ORD-22-US    |                                     |
| ORD-33-UK    |                                     |
| ORD-44-AU    |                                     |
| ORD-55-IN    |                                     |
| LOG91DATA    |                                     |
| LOG01DATA    |                                     |
| LOG44DATA    |                                     |
| LOG61DATA    |                                     |
| LOG91DATA    |                                     |
| IND91CODE    |                                     |
| USA01CODE    |                                     |
| UK44CODE     |                                     |
| AUS61CODE    |                                     |
| IND91CODE    |                                     |
| TEST001      | 001                                 |
| TEST002      | 002                                 |
| TEST003      | 003                                 |
| TEST004      | 004                                 |
| TEST005      | 005                                 |

---
**Query #19**

    -- Q19: Extract alphabets between underscores
    SELECT full_text,
           REGEXP_SUBSTR(full_text, '_[A-Za-z]+_')
    FROM regex_practice;

| full_text    | REGEXP_SUBSTR(full_text, '_[A-Za-z]+_') |
| ------------ | --------------------------------------- |
| EMP001_IN_91 | _IN_                                    |
| EMP002_US_01 | _US_                                    |
| EMP003_UK_44 | _UK_                                    |
| EMP004_AU_61 | _AU_                                    |
| EMP005_IN_91 | _IN_                                    |
| EMP006_US_01 | _US_                                    |
| EMP007_UK_44 | _UK_                                    |
| EMP008_AU_61 | _AU_                                    |
| EMP009_IN_91 | _IN_                                    |
| EMP010_US_01 | _US_                                    |
| USR11_IN     |                                         |
| USR12_US     |                                         |
| USR13_UK     |                                         |
| USR14_AU     |                                         |
| USR15_IN     |                                         |
| ACC_1001_91  |                                         |
| ACC_1002_01  |                                         |
| ACC_1003_44  |                                         |
| ACC_1004_61  |                                         |
| ACC_1005_91  |                                         |
| ORD-11-IN    |                                         |
| ORD-22-US    |                                         |
| ORD-33-UK    |                                         |
| ORD-44-AU    |                                         |
| ORD-55-IN    |                                         |
| LOG91DATA    |                                         |
| LOG01DATA    |                                         |
| LOG44DATA    |                                         |
| LOG61DATA    |                                         |
| LOG91DATA    |                                         |
| IND91CODE    |                                         |
| USA01CODE    |                                         |
| UK44CODE     |                                         |
| AUS61CODE    |                                         |
| IND91CODE    |                                         |
| TEST001      |                                         |
| TEST002      |                                         |
| TEST003      |                                         |
| TEST004      |                                         |
| TEST005      |                                         |

---
**Query #20**

    -- Q20: Extract digits after + in phone
    SELECT phone,
           REGEXP_SUBSTR(phone, '[0-9]+(?=-)')
    FROM regex_practice;

| phone          | REGEXP_SUBSTR(phone, '[0-9]+(?=-)') |
| -------------- | ----------------------------------- |
| +91-9876543210 | 91                                  |
| +1-7654321098  | 1                                   |
| +44-9988776655 | 44                                  |
| +61-8899776655 | 61                                  |
| +91-7788996655 | 91                                  |
| +1-9090909090  | 1                                   |
| +44-7878787878 | 44                                  |
| +61-6665554443 | 61                                  |
| +91-9988776655 | 91                                  |
| +1-6767676767  | 1                                   |
| 91-8899001122  | 91                                  |
| 01-9988776655  | 01                                  |
| 44-6677889900  | 44                                  |
| 61-4455667788  | 61                                  |
| 91-9988001122  | 91                                  |
| +91-8877665544 | 91                                  |
| +1-2233445566  | 1                                   |
| +44-3344556677 | 44                                  |
| +61-5566778899 | 61                                  |
| +91-6677889900 | 91                                  |
| 91-9998887776  | 91                                  |
| 01-1112223334  | 01                                  |
| 44-5556667778  | 44                                  |
| 61-8887776665  | 61                                  |
| 91-4445556667  | 91                                  |
| 91-9090909090  | 91                                  |
| 01-8080808080  | 01                                  |
| 44-7070707070  | 44                                  |
| 61-6060606060  | 61                                  |
| 91-5050505050  | 91                                  |
| +91-8889990001 | 91                                  |
| +1-7776665554  | 1                                   |
| +44-6665554443 | 44                                  |
| +61-5554443332 | 61                                  |
| +91-4443332221 | 91                                  |
| 91-1111111111  | 91                                  |
| 01-2222222222  | 01                                  |
| 44-3333333333  | 44                                  |
| 61-4444444444  | 61                                  |
| 91-5555555555  | 91                                  |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
