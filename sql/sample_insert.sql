set names utf8;
use masaru_db;

-- 会員
INSERT INTO user VALUES 
('tanaka', 'renn', '田中蓮', '男', '1999-08-05', 'tanaka@example.com', '080-2222-0101', '学生', '4', '5', '2020-04-01');

INSERT INTO user VALUES 
('yamaguti', 'kaede', '山口楓', '女', '1998-10-09', 'yamaguti@example.com', '080-2222-0102', '学生', '5', '5', '2020-04-01');

INSERT INTO user VALUES 
('ito', 'riko', '伊藤莉子', '女', '1995-01-03', 'ito@example.com', '080-2222-0103', '会社員', '3', '4', '2020-04-01');

INSERT INTO user VALUES 
('yamasita', 'iori', '山下伊織', '男', '1980-12-24', 'yamasita@example.com', '080-2222-0104', '会社員', '4', '5', '2020-04-01');

INSERT INTO user VALUES 
('nakazima', 'rio', '中島莉緒', '女', '1960-09-13', 'nakazima@example.com', '080-2222-0105', 'シニア', '2', '3', '2020-04-01');

INSERT INTO user VALUES 
('isii', 'yuu', '石井悠', '男', '1997-10-05', 'isii@example.com', '080-2222-0106', '会社員', '1', '5', '2020-04-01');

INSERT INTO user VALUES 
('ogawa', 'rio', '小川莉央', '女', '1992-06-25', 'ogawa@example.com', '080-2222-0107', '会社員', '2', '4', '2020-04-01');

INSERT INTO user VALUES 
('maeda', 'asahi', '前田旭', '男', '1959-10-20', 'maeda@example.com', '080-2222-0108', 'シニア', '1', '5', '2020-04-01');

INSERT INTO user VALUES 
('okada', 'tumugi', '岡田紬希', '女', '2000-02-11', 'okada@example.com', '080-2222-0109', '学生', '1', '5', '2020-04-01');

INSERT INTO user VALUES 
('hasegawa', 'nagi', '長谷川凪', '男', '2005-08-26', 'hasegawa@example.com', '080-2222-0110', '学生', '1', '5', '2020-04-01');

INSERT INTO user VALUES 
('huzita', 'sana', '藤田紗菜', '女', '1983-07-01', 'huzita@example.com', '080-2222-0111', '会社員', '2', '4', '2020-04-01');

INSERT INTO user VALUES 
('gotou', 'hinata', '後藤陽大', '男', '1998-04-03', 'gotou@example.com', '080-2222-0112', '学生', '5', '5', '2020-04-01');

INSERT INTO user VALUES 
('konndou', 'annna', '近藤杏奈', '女', '1955-03-03', 'konndou@example.com', '080-2222-0113', 'シニア', '3', '5', '2020-04-01');

INSERT INTO user VALUES 
('murakami', 'minato', '村上湊斗', '男', '1991-10-03', 'murakami@example.com', '080-2222-0114', '会社員', '1', '2', '2020-04-01');

INSERT INTO user VALUES 
('enndou', 'hana', '遠藤花', '女', '1978-12-11', 'enndou@example.com', '080-2222-0115', '会社員', '5', '5', '2020-04-01');

INSERT INTO user VALUES 
('aoki', 'souma', '青木蒼真', '男', '1981-11-07', 'aoki@example.com', '080-2222-0116', '会社員', '2', '5', '2020-04-01');

INSERT INTO user VALUES 
('sakamoto', 'rinn', '坂本凜', '女', '1992-01-03', 'sakamoto@example.com', '080-2222-0117', '会社員', '1', '5', '2020-04-01');

INSERT INTO user VALUES 
('saito', 'gaku', '斉藤岳', '男', '1977-01-23', 'saito@example.com', '080-2222-0118', '会社員', '4', '5', '2020-04-01');

INSERT INTO user VALUES 
('hukuda', 'itika', '福田一華', '女', '1982-09-10', 'hukudao@example.com', '080-2222-0119', '会社員', '4', '4', '2020-04-01');

INSERT INTO user VALUES 
('oota', 'riku', '太田陸', '男', '1990-03-22', 'oota@example.com', '080-2222-0120', '会社員', '1', '5', '2020-04-01');


--利用
INSERT INTO situation values 
(1, 'yamaguti', '101', '1', '2020-01-14' ,  '20:22:00' , '23:22:00' , '23:22:00' , '無');

INSERT INTO situation values 
(2, 'tanaka', '102', '2', '2020-01-15' ,  '15:46:00' , '18:46:00' , '18:46:00' , '無');

INSERT INTO situation values 
(3, 'yamaguti', '106', '3', '2020-01-15' ,  '12:11:00' , '15:11:00' , '15:11:00' , '無');

INSERT INTO situation values 
(4, 'ito', '110', '7', '2020-01-19' ,  '21:35:00' , '00:35:00' , '00:35:00' , '無');

INSERT INTO situation values 
(5, 'nakazima', '202', '5', '2020-02-01' ,  '10:57:00' , '13:57:00' , '11:57:00' , '無');

INSERT INTO situation values 
(6, 'isii', '208', '4', '2020-02-16' ,  '17:04:00' , '20:04:00' , '20:04:00' , '無');

INSERT INTO situation values 
(7, 'nakazima', '209', '9', '2020-02-19' ,  '11:01:00' , '14:01:00' , '14:01:00' , '無');

INSERT INTO situation values 
(8, 'ogawa', '303', '2', '2020-02-20' ,  '18:21:00' , '21:21:00' , '21:21:00' , '無');

INSERT INTO situation values 
(9, 'maeda', '307', '4', '2020-03-03' ,  '10:33:00' , '13:33:00' , '13:33:00' , '無');

INSERT INTO situation values 
(10, 'okada', '401', '2', '2020-03-11' ,  '13:10:00' , '16:10:00' , '16:10:00' , '無');

INSERT INTO situation values 
(11, 'hasegawa', '405', '6', '2020-03-15' ,  '14:41:00' , '17:41:00' , '19:41:00' , '無');

INSERT INTO situation values 
(12, 'huzita', '508', '5', '2020-03-20' ,  '16:47:00' , '19:47:00' , '19:47:00' , '無');

INSERT INTO situation values 
(13, 'gotou', '509', '10', '2020-04-02' ,  '12:39:00' , '15:39:00' , '15:39:00' , '無');

INSERT INTO situation values 
(14, 'konndou', '510', '8', '2020-04-28' ,  '11:12:00' , '14:12:00' , '14:12:00' , '無');

INSERT INTO situation values 
(15, 'murakami', '101', '5', '2020-04-29' ,  '19:00:00' , '22:00:00' , '22:00:00' , '無');

INSERT INTO situation values 
(16, 'enndou', '106', '2', '2020-05-06' ,  '15:28:00' , '18:28:00' , '18:28:00' , '無');

INSERT INTO situation values 
(17, 'aoki', '107', '1', '2020-05-08' ,  '14:38:00' , '17:38:00' , '17:38:00' , '無');

INSERT INTO situation values 
(18, 'sakamoto', '109', '12', '2020-05-17' ,  '10:06:00' , '13:06:00' , '13:06:00' , '無');

INSERT INTO situation values 
(19, 'saito', '204', '3', '2020-05-22' ,  '18:59:00' , '21:59:00' , '21:59:00' , '無');

INSERT INTO situation values 
(20, 'hukuda', '209', '8', '2020-06-07' ,  '17:24:00' , '20:24:00' , '20:24:00' , '無');

INSERT INTO situation values 
(21, 'oota', '307', '2', '2020-06-08' ,  '10:02:00' , '13:02:00' , '13:02:00' , '無');

INSERT INTO situation values 
(22, 'yamaguti', '310', '10', '2021-06-12' ,  '10:46:00' , '13:46:00' , '13:46:00' , '無');

INSERT INTO situation values 
(23, 'tanaka', '405', '3', '2020-06-12' ,  '13:31:00' , '16:31:00' , '16:31:00' , '無');

INSERT INTO situation values 
(24, 'yamaguti', '406', '2', '2020-06-21' ,  '16:22:00' , '19:22:00' , '19:22:00' , '無');

INSERT INTO situation values 
(25, 'ito', '407', '4', '2020-07-01' ,  '14:37:00' , '17:37:00' , '17:37:00' , '無');

INSERT INTO situation values 
(26, 'nakazima', '501', '4', '2020-07-05' ,  '11:55:00' , '14:55:00' , '14:55:00' , '無');

INSERT INTO situation values 
(27, 'isii', '504', '2', '2020-07-13' ,  '12:19:00' , '15:19:00' , '15:19:00' , '無');

INSERT INTO situation values 
(28, 'nakazima', '507', '3', '2020-07-18' ,  '14:25:00' , '17:25:00' , '17:25:00' , '無');

INSERT INTO situation values 
(29, 'ogawa', '508', '2', '2020-07-26' ,  '15:49:00' , '18:49:00' , '18:49:00' , '無');

INSERT INTO situation values 
(30, 'maeda', '101', '3', '2020-07-27' ,  '11:17:00' , '14:17:00' , '14:17:00' , '無');

INSERT INTO situation values 
(31, 'okada', '104', '3', '2020-08-09' ,  '20:41:00' , '23:41:00' , '23:41:00' , '無');

INSERT INTO situation values 
(32, 'hasegawa', '202', '2', '2020-08-10' ,  '10:39:00' , '13:39:00' , '13:39:00' , '無');

INSERT INTO situation values 
(33, 'huzita', '204', '3', '2020-08-20' ,  '17:21:00' , '20:21:00' , '20:21:00' , '無');

INSERT INTO situation values 
(34, 'gotou', '205', '3', '2020-09-03' ,  '18:05:00' , '21:05:00' , '21:05:00' , '無');

INSERT INTO situation values 
(35, 'konndou', '301', '1', '2020-09-16' ,  '11:28:00' , '14:28:00' , '14:28:00' , '無');

INSERT INTO situation values 
(36, 'murakami', '304', '1', '2020-09-22' ,  '14:43:00' , '17:43:00' , '17:43:00' , '無');

INSERT INTO situation values 
(37, 'enndou', '307', '1', '2020-10-04' ,  '16:31:00' , '19:31:00' , '19:31:00' , '無');

INSERT INTO situation values 
(38, 'aoki', '308', '2', '2020-10-15' ,  '10:25:00' , '13:25:00' , '13:25:00' , '無');

INSERT INTO situation values 
(39, 'sakamoto', '403', '2', '2020-10-27' ,  '20:50:00' , '23:50:00' , '23:50:00' , '無');

INSERT INTO situation values 
(40, 'saito', '404', '1', '2020-11-03' ,  '21:32:00' , '00:32:00' , '00:32:00' , '無');

INSERT INTO situation values 
(41, 'hukuda', '505', '3', '2020-11-23' ,  '18:29:00' , '21:29:00' , '21:29:00' , '無');

INSERT INTO situation values 
(42, 'oota', '508', '2', '2020-12-18' ,  '17:42:00' , '20:42:00' , '20:42:00' , '無');


--売上
INSERT INTO sale values
(0 , 'yamaguti' , 1 , '3000' , '2020-01-14');

INSERT INTO sale values
(0 , 'tanaka' , 2 , '6400' , '2020-01-15');

INSERT INTO sale values
(0 , 'yamaguti' , 3 , '9000' , '2020-01-15');

INSERT INTO sale values
(0 , 'ito' , 4 , '32400' , '2020-01-19');

INSERT INTO sale values
(0 , 'nakazima' , 5 , '18000' , '2020-02-01');

INSERT INTO sale values
(0 , 'isii' , 6 , '18000' , '2020-02-16');

INSERT INTO sale values
(0 , 'nakazima' , 7 , '27000' , '2020-02-19');

INSERT INTO sale values
(0 , 'ogawa' , 8 , '7200' , '2020-02-20');

INSERT INTO sale values
(0 , 'maeda' , 9 , '12000' , '2020-03-03');

INSERT INTO sale values
(0 , 'okada' , 10 , '6000' , '2020-03-11');

INSERT INTO sale values
(0 , 'hasegawa' , 11 , '25200' , '2020-03-15');

INSERT INTO sale values
(0 , 'huzita' , 12 , '22500' , '2020-03-20');

INSERT INTO sale values
(0 , 'gotou' , 13 , '30000' , '2020-04-02');

INSERT INTO sale values
(0 , 'konndou' , 14 , '24000' , '2020-04-28');

INSERT INTO sale values
(0 , 'murakami' , 15 , '15000' , '2020-04-29');

INSERT INTO sale values
(0 , 'enndou' , 16 , '6800' , '2020-05-06');

INSERT INTO sale values
(0 , 'aoki' , 17 , '4200' , '2020-05-08');

INSERT INTO sale values
(0 , 'sakamoto' , 18 , '43200' , '2020-05-17');

INSERT INTO sale values
(0 , 'saito' , 19 , '13500' , '2020-05-22');

INSERT INTO sale values
(0 , 'hukuda' , 20 , '36000' , '2020-06-07');

INSERT INTO sale values
(0 , 'oota' , 21 , '6000' , '2020-06-08');

INSERT INTO sale values
(0 , 'yamaguti' , 22 , '36000' , '2021-06-12');

INSERT INTO sale values
(0 , 'tanaka' , 23 , '12600' , '2020-06-12');

INSERT INTO sale values
(0 , 'yamaguti' , 24 , '9000' , '2020-06-21');

INSERT INTO sale values
(0 , 'ito' , 25 , '12800' , '2020-07-01');

INSERT INTO sale values
(0 , 'nakazima' , 26 , '14400' , '2020-07-05');

INSERT INTO sale values
(0 , 'isii' , 27 , '6000' , '2020-07-13');

INSERT INTO sale values
(0 , 'nakazima' , 28 , '13500' , '2020-07-18');

INSERT INTO sale values
(0 , 'ogawa' , 29 , '9000' , '2020-07-26');

INSERT INTO sale values
(0 , 'maeda' , 30 , '9000' , '2020-07-27');

INSERT INTO sale values
(0 , 'okada' , 31 , '10800' , '2020-08-09');

INSERT INTO sale values
(0 , 'hasegawa' , 32 , '6000' , '2020-08-10');

INSERT INTO sale values
(0 , 'huzita' , 33 , '9000' , '2020-08-20');

INSERT INTO sale values
(0 , 'gotou' , 34 , '9000' , '2020-09-03');

INSERT INTO sale values
(0 , 'konndou' , 35 , '3000' , '2020-09-16');

INSERT INTO sale values
(0 , 'murakami' , 36 , '3200' , '2020-09-22');

INSERT INTO sale values
(0 , 'enndou' , 37 , '4500' , '2020-10-04');

INSERT INTO sale values
(0 , 'aoki' , 38 , '6000' , '2020-10-15');

INSERT INTO sale values
(0 , 'sakamoto' , 39 , '7200' , '2020-10-27');

INSERT INTO sale values
(0 , 'saito' , 40 , '3600' , '2020-11-03');

INSERT INTO sale values
(0 , 'hukuda' , 41 , '10800' , '2020-11-23');

INSERT INTO sale values
(0 , 'oota' , 42 , '9000' , '2020-12-18');

set names cp932;
