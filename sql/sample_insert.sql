set names utf8;
use masaru_db;

-- 会員
INSERT INTO user VALUES 
('tanaka', 'hirata', '田中蓮', '男', '1999-10-05', 'tanaka@example.com', '000-0000-0000', '学生', '1', '5', '2015-04-01');

INSERT INTO user VALUES 
('yamaguti', 'hirata', '山口楓', '女', '1998-10-05', 'yamaguti@example.com', '000-0000-0000', '学生', '1', '5', '2015-04-01');

INSERT INTO user VALUES 
('ito', 'hirata', '伊藤莉子', '女', '1997-10-05', 'ito@example.com', '000-0000-0000', '学生', '1', '5', '2015-04-01');


--利用
INSERT INTO situation values 
(0, 'hirata', '101', '1', '2021-01-14' ,  '16:46:00' , '19:46:00' , '19:46:00' , '無');

INSERT INTO situation values 
(0, 'tanaka', '101', '1', '2020-01-14' ,  '15:46:00' , '19:46:00' , '19:46:00' , '無');

INSERT INTO situation values 
(0, 'yamaguti', '101', '1', '2019-01-14' ,  '14:46:00' , '19:46:00' , '19:46:00' , '無');

INSERT INTO situation values 
(0, 'ito', '101', '1', '2018-01-14' ,  '13:46:00' , '19:46:00' , '19:46:00' , '無');


--売上
INSERT INTO sale values
(0 , 'hirata' , 1 , '10000' , '2021-01-14');

INSERT INTO sale values
(0 , 'tanaka' , 2 , '20000' , '2020-01-14');

INSERT INTO sale values
(0 , 'yamaguti' , 2 , '30000' , '2019-01-14');

INSERT INTO sale values
(0 , 'ito' , 2 , '40000' , '2018-01-14');

set names cp932;
