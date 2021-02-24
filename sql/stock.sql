set names utf8;
use masaru_db;

-- stock
-- E01
INSERT INTO stock VALUES 
(0,'E01',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 1 , (select item_max from item where item_id = 1)-5);

INSERT INTO stock VALUES 
(0,'E01',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 2 , (select item_max from item where item_id = 2)/2);

INSERT INTO stock VALUES 
(0,'E01',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 3 , (select item_max from item where item_id = 3)/3);

INSERT INTO stock VALUES 
(0,'E01',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 4 , (select item_min from item where item_id = 4)-1);

-- E02
INSERT INTO stock VALUES 
(0,'E02',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 5 , (select item_max from item where item_id = 5)-5);

INSERT INTO stock VALUES 
(0,'E02',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 6 , (select item_max from item where item_id = 6)/2);

INSERT INTO stock VALUES 
(0,'E02',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 7 , (select item_max from item where item_id = 7)/3);

INSERT INTO stock VALUES 
(0,'E02',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 8 , (select item_min from item where item_id = 8)-1);

-- E03
INSERT INTO stock VALUES 
(0,'E03',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 9 , (select item_max from item where item_id = 9)-5);

INSERT INTO stock VALUES 
(0,'E03',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 10 , (select item_max from item where item_id = 10)/2);

INSERT INTO stock VALUES 
(0,'E03',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 11 , (select item_max from item where item_id = 11)/3);

INSERT INTO stock VALUES 
(0,'E03',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 12 , (select item_min from item where item_id = 12)-1);

-- E04
INSERT INTO stock VALUES 
(0,'E04',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 13 , (select item_max from item where item_id = 13)-5);

INSERT INTO stock VALUES 
(0,'E04',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 14 , (select item_max from item where item_id = 14)/2);

INSERT INTO stock VALUES 
(0,'E04',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 15 , (select item_max from item where item_id = 15)/3);

INSERT INTO stock VALUES 
(0,'E04',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 16 , (select item_min from item where item_id = 16)-1);

--E05
INSERT INTO stock VALUES 
(0,'E05',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 17 , (select item_max from item where item_id = 17)-5);

INSERT INTO stock VALUES 
(0,'E05',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 18 , (select item_max from item where item_id = 18)/2);

INSERT INTO stock VALUES 
(0,'E05',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 19 , (select item_max from item where item_id = 19)/3);

INSERT INTO stock VALUES 
(0,'E05',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 20 , (select item_min from item where item_id = 20)-1);

-- E06
INSERT INTO stock VALUES 
(0,'E06',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 21 , (select item_max from item where item_id = 21)-5);

INSERT INTO stock VALUES 
(0,'E06',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 22 , (select item_max from item where item_id = 22)/2);

INSERT INTO stock VALUES 
(0,'E06',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() ,23 , (select item_max from item where item_id = 23)/3);

INSERT INTO stock VALUES 
(0,'E06',curdate());
INSERT INTO stock_detail VALUES 
(0 , LAST_INSERT_ID() , 24 , (select item_min from item where item_id = 24)-1);


-- ordering
--- E01
INSERT INTO ordering VALUES 
(0,'E01',curdate());
INSERT INTO ordering_detail VALUES 
(0 , LAST_INSERT_ID() , 1 , (select item_max from item where item_id = 1)-5 , '1');

INSERT INTO ordering VALUES 
(0,'E01',curdate());
INSERT INTO ordering_detail VALUES 
(0 , LAST_INSERT_ID() , 2 , (select item_max from item where item_id = 2)-(select stock from item where item_id = 2)5 , '0');



set names cp932;
