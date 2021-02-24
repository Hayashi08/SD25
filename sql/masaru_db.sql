set names utf8;

DROP DATABASE IF EXISTS masaru_db;

create database masaru_db default character set = utf8;

use masaru_db;

CREATE TABLE user (
	user_id VARCHAR(16) NOT NULL,
	user_pass VARCHAR(16) NOT NULL,
	user_name VARCHAR(24) NOT NULL,
	user_sex CHAR(1) NOT NULL,
	user_birth DATE NOT NULL,
	user_mail VARCHAR(32) DEFAULT '未入力',
	user_tel CHAR(13) NOT NULL,
	user_job VARCHAR(16) DEFAULT '未入力',
	user_credit CHAR(1) DEFAULT '5',
	user_rank CHAR(1) DEFAULT '1',
	user_date DATE NOT NULL,
	PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE floor (
	floor_id CHAR(3) NOT NULL,
	floor_cap TINYINT UNSIGNED NOT NULL,
	floor_machine CHAR(1) NOT NULL,
	floor_state CHAR(1) NOT NULL,
	floor_device BOOLEAN DEFAULT false,
	PRIMARY KEY (floor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE situation (
	situation_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id VARCHAR(16) NOT NULL,
	floor_id CHAR(3) NOT NULL,
	situation_qty TINYINT UNSIGNED NOT NULL,
	situation_date DATE NOT NULL,
	situation_start TIME NOT NULL,
	situation_end_schedule TIME NOT NULL,
	situation_end TIME,
	situation_free CHAR(1) NOT NULL DEFAULT '無',
	PRIMARY KEY (situation_id),
	FOREIGN KEY (user_id) REFERENCES user (user_id),
	FOREIGN KEY (floor_id) REFERENCES floor (floor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE book (
	book_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id VARCHAR(16) NOT NULL,
	floor_id CHAR(3) NOT NULL,
	book_qty TINYINT UNSIGNED NOT NULL,
	book_date DATE NOT NULL,
	book_start TIME NOT NULL,
	book_end TIME NOT NULL,
	book_free CHAR(1) NOT NULL DEFAULT '無',
	book_date_register DATETIME NOT NULL,
	PRIMARY KEY (book_id),
	FOREIGN KEY (user_id) REFERENCES user (user_id),
	FOREIGN KEY (floor_id) REFERENCES floor (floor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE menu (
	menu_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	menu_name VARCHAR(30) NOT NULL,
	menu_genre VARCHAR(20) NOT NULL,
	menu_price SMALLINT UNSIGNED NOT NULL,
	menu_create DATE NOT NULL,
	menu_update DATE NOT NULL,
	menu_des VARCHAR(500) DEFAULT 'なし',
	menu_allergy VARCHAR(100) DEFAULT 'なし',
	PRIMARY KEY (menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE task (
	task_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	menu_id INT UNSIGNED NOT NULL,
	situation_id INT UNSIGNED NOT NULL,
	floor_id CHAR(3) NOT NULL,
	task_qty TINYINT UNSIGNED NOT NULL,
	task_time TIME NOT NULL,
	task_comp TIME,
	task_deploy TIME,
	PRIMARY KEY (task_id),
	FOREIGN KEY (menu_id) REFERENCES menu (menu_id),
	FOREIGN KEY (situation_id) REFERENCES situation (situation_id),
	FOREIGN KEY (floor_id) REFERENCES floor (floor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE sale (
	sale_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id VARCHAR(16) NOT NULL,
	situation_id INT UNSIGNED NOT NULL,
	sale_total MEDIUMINT UNSIGNED NOT NULL,
	sale_date DATE NOT NULL,
	PRIMARY KEY (sale_id),
	FOREIGN KEY (user_id) REFERENCES user (user_id),
	FOREIGN KEY (situation_id) REFERENCES situation (situation_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE sale_detail (
	sale_detail_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	situation_id INT UNSIGNED NOT NULL,
	menu_id INT UNSIGNED NOT NULL,
	menu_qty TINYINT UNSIGNED NOT NULL,
	menu_sex CHAR(1),
	menu_age CHAR(3),
	PRIMARY KEY (sale_detail_id),
	FOREIGN KEY (situation_id) REFERENCES situation (situation_id),
	FOREIGN KEY (menu_id) REFERENCES menu (menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE employee (
	employee_id CHAR(3) NOT NULL,
	employee_pass VARCHAR(16) NOT NULL,
	employee_name VARCHAR(24) NOT NULL,
	employee_position VARCHAR(12) NOT NULL,
	employee_mail VARCHAR(32) NOT NULL,
	employee_tel CHAR(13) NOT NULL,
	PRIMARY KEY (employee_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE shift (
	shift_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	employee_id CHAR(3) NOT NULL,
	shift_date DATE NOT NULL,
	shift_start TIME NOT NULL,
	shift_end TIME NOT NULL,
	PRIMARY KEY (shift_id),
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE shift_confirm (
	shift_confirm_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	employee_id CHAR(3) NOT NULL,
	shift_confirm_date DATE NOT NULL,
	shift_confirm_start TIME NOT NULL,
	shift_confirm_end TIME NOT NULL,
	PRIMARY KEY (shift_confirm_id),
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE item (
	item_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	item_name VARCHAR(30) NOT NULL,
	item_genre VARCHAR(20) NOT NULL,
	item_max SMALLINT UNSIGNED NOT NULL,
	item_min SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE stock (
	stock_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	employee_id CHAR(3) NOT NULL,
	stock_date DATE NOT NULL,
	PRIMARY KEY (stock_id),
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE stock_detail (
	stock_detail_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	stock_id INT UNSIGNED NOT NULL,
	item_id INT UNSIGNED NOT NULL,
	stock_detail_qty SMALLINT NOT NULL,
	PRIMARY KEY (stock_detail_id),
	FOREIGN KEY (stock_id) REFERENCES stock (stock_id),
	FOREIGN KEY (item_id) REFERENCES item (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ordering (
	ordering_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	employee_id CHAR(3) NOT NULL,
	ordering_date DATE NOT NULL,
	PRIMARY KEY (ordering_id),
	FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE ordering_detail (
	ordering_detail_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	ordering_id INT UNSIGNED NOT NULL,
	item_id INT UNSIGNED NOT NULL,
	ordering_detail_qty SMALLINT UNSIGNED NOT NULL,
	ordering_detail_state CHAR(1) DEFAULT '0',
	PRIMARY KEY (ordering_detail_id),
	FOREIGN KEY (ordering_id) REFERENCES ordering (ordering_id),
	FOREIGN KEY (item_id) REFERENCES item (item_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE news (
	news_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	news_title VARCHAR(50) NOT NULL,
	news_content VARCHAR(1000) NOT NULL,
	news_schedule DATETIME NOT NULL,
	PRIMARY KEY (news_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE coupon (
	coupon_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	coupon_title VARCHAR(50) NOT NULL,
	coupon_content VARCHAR(500) NOT NULL,
	coupon_genre VARCHAR(20) NOT NULL,
	coupon_discount CHAR(4) NOT NULL,
	coupon_start DATETIME NOT NULL,
	coupon_end DATETIME NOT NULL,
	PRIMARY KEY (coupon_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- インサート文

-- 従業員
INSERT INTO employee VALUES ('ore', 'sama', '俺様', 'アルバイト', 'oresama@ex.com', '080-1111-0001');
INSERT INTO employee VALUES ('E01', 'hal', 'HALマサル', '店長', 'oresama@ex.com', '080-1111-0002');
INSERT INTO employee VALUES ('E02', 'renn', '田中蓮', '副店長', 'tanakarenn@ex.com', '080-1111-0003');
INSERT INTO employee VALUES ('E03', 'kaede', '山口楓', '社員', 'yamagutikaede@ex.com', '080-1111-0004');
INSERT INTO employee VALUES ('E04', 'ritu', '佐藤律', '社員', 'satouritu@ex.com', '080-1111-0005');
INSERT INTO employee VALUES ('E05', 'tumugi', '鈴木紬', '社員', 'suzukitumugi@ex.com', '080-1111-0006');
INSERT INTO employee VALUES ('E06', 'sou', '高橋湊', '社員', 'takahasisou@ex.com', '080-1111-0007');
INSERT INTO employee VALUES ('A01', 'riko', '伊藤莉子', 'アルバイト', 'itouriko@ex.com', '080-1111-0008');
INSERT INTO employee VALUES ('A02', 'haruto', '渡辺陽翔', 'アルバイト', 'watanabeharuto@ex.com', '080-1111-0009');
INSERT INTO employee VALUES ('A03', 'yuduki', '後藤結月', 'アルバイト', 'gotouyuduki@ex.com', '080-1111-0010');
INSERT INTO employee VALUES ('A04', 'aoi', '中村蒼', 'アルバイト', 'nakamuraaoi@ex.com', '080-1111-0011');
INSERT INTO employee VALUES ('A05', 'mei', '小林芽依', 'アルバイト', 'kobayasimei@ex.com', '080-1111-0012');
INSERT INTO employee VALUES ('A06', 'yuuma', '加藤悠真', 'アルバイト', 'katouyuuma@ex.com', '080-1111-0013');
INSERT INTO employee VALUES ('A07', 'hinata', '吉田陽葵', 'アルバイト', 'yosidahinato@ex.com', '080-1111-0014');
INSERT INTO employee VALUES ('A08', 'hiroto', '藤田大翔', 'アルバイト', 'huzihahiroto@ex.com', '080-1111-0015');
INSERT INTO employee VALUES ('A09', 'rinn', '佐々木凛', 'アルバイト', 'sasakirinn@ex.com', '080-1111-0016');
INSERT INTO employee VALUES ('A10', 'souta', '松本蒼大', 'アルバイト', 'matumotosouta@ex.com', '080-1111-0017');
INSERT INTO employee VALUES ('A11', 'aoi', '井上葵', 'アルバイト', 'inoueaoi@ex.com', '080-1111-0018');
INSERT INTO employee VALUES ('A12', 'syuu', '木村柊', 'アルバイト', 'kimurasyuu@ex.com', '080-1111-0019');
INSERT INTO employee VALUES ('A13', 'yuina', '清水結菜', 'アルバイト', 'simizuyuina@ex.com', '080-1111-0020');
INSERT INTO employee VALUES ('A14', 'ituki', '近藤樹', 'アルバイト', 'konndouituki@ex.com', '080-1111-0021');
INSERT INTO employee VALUES ('A15', 'iroha', '森彩葉', 'アルバイト', 'moriiroha@ex.com', '080-1111-0022');
INSERT INTO employee VALUES ('A16', 'dann', '池田暖', 'アルバイト', 'ikedadann@ex.com', '080-1111-0023');
INSERT INTO employee VALUES ('A17', 'mituki', '橋本美月', 'アルバイト', 'hasimotomituki@ex.com', '080-1111-0024');
INSERT INTO employee VALUES ('A18', 'yuuto', '阿部悠斗', 'アルバイト', 'abeyuuto@ex.com', '080-1111-0025');
INSERT INTO employee VALUES ('A19', 'yua', '石川結愛', 'アルバイト', 'isikawayuu@ex.com', '080-1111-0026');
INSERT INTO employee VALUES ('A20', 'takasi', '松田隆', 'アルバイト', 'matudatakasi@ex.com', '080-1111-0027');
-- 会員
INSERT INTO user VALUES ('hirata', 'hirata', '平田 勇希', '男', '1999-12-31', 'hirata@example.com', '000-0000-0000', '学生', '1', '5', '2015-04-01');
-- フロア
INSERT INTO floor VALUES ('101', 6, '良', '済', false);
INSERT INTO floor VALUES ('102', 6, '良', '済', false);
INSERT INTO floor VALUES ('103', 6, '良', '済', false);
INSERT INTO floor VALUES ('104', 6, '可', '済', false);
INSERT INTO floor VALUES ('105', 6, '可', '済', false);
INSERT INTO floor VALUES ('106', 6, '良', '済', false);
INSERT INTO floor VALUES ('107', 6, '良', '済', false);
INSERT INTO floor VALUES ('108', 6, '良', '済', false);
INSERT INTO floor VALUES ('109', 12, '良', '済', false);
INSERT INTO floor VALUES ('110', 12, '良', '済', false);
INSERT INTO floor VALUES ('201', 6, '良', '済', false);
INSERT INTO floor VALUES ('202', 6, '不', '済', false);
INSERT INTO floor VALUES ('203', 6, '良', '済', false);
INSERT INTO floor VALUES ('204', 6, '良', '済', false);
INSERT INTO floor VALUES ('205', 6, '可', '済', false);
INSERT INTO floor VALUES ('206', 6, '良', '済', false);
INSERT INTO floor VALUES ('207', 6, '良', '済', false);
INSERT INTO floor VALUES ('208', 6, '良', '済', false);
INSERT INTO floor VALUES ('209', 12, '可', '済', false);
INSERT INTO floor VALUES ('210', 12, '良', '済', false);
INSERT INTO floor VALUES ('301', 6, '良', '済', false);
INSERT INTO floor VALUES ('302', 6, '可', '済', false);
INSERT INTO floor VALUES ('303', 6, '良', '済', false);
INSERT INTO floor VALUES ('304', 6, '良', '済', false);
INSERT INTO floor VALUES ('305', 6, '良', '済', false);
INSERT INTO floor VALUES ('306', 6, '良', '済', false);
INSERT INTO floor VALUES ('307', 6, '良', '済', false);
INSERT INTO floor VALUES ('308', 6, '可', '済', false);
INSERT INTO floor VALUES ('309', 12, '良', '済', false);
INSERT INTO floor VALUES ('310', 12, '不', '済', false);
INSERT INTO floor VALUES ('401', 6, '良', '済', false);
INSERT INTO floor VALUES ('402', 6, '良', '済', false);
INSERT INTO floor VALUES ('403', 6, '可', '済', false);
INSERT INTO floor VALUES ('404', 6, '良', '済', false);
INSERT INTO floor VALUES ('405', 6, '良', '済', false);
INSERT INTO floor VALUES ('406', 6, '良', '済', false);
INSERT INTO floor VALUES ('407', 6, '可', '済', false);
INSERT INTO floor VALUES ('408', 6, '良', '済', false);
INSERT INTO floor VALUES ('409', 12, '良', '済', false);
INSERT INTO floor VALUES ('410', 12, '良', '済', false);
INSERT INTO floor VALUES ('501', 6, '良', '済', false);
INSERT INTO floor VALUES ('502', 6, '良', '済', false);
INSERT INTO floor VALUES ('503', 6, '可', '済', false);
INSERT INTO floor VALUES ('504', 6, '良', '済', false);
INSERT INTO floor VALUES ('505', 6, '良', '済', false);
INSERT INTO floor VALUES ('506', 6, '良', '済', false);
INSERT INTO floor VALUES ('507', 6, '可', '済', false);
INSERT INTO floor VALUES ('508', 6, '良', '済', false);
INSERT INTO floor VALUES ('509', 12, '良', '済', false);
INSERT INTO floor VALUES ('510', 12, '良', '済', false);
-- 在庫管理
INSERT INTO item VALUES (1, '米', '米・雑穀・シリアル', 20, 5);
INSERT INTO item VALUES (2, 'コンフレーク', '米・雑穀・シリアル', 25, 5);
INSERT INTO item VALUES (3, '中華麺', '麺類', 23, 7);
INSERT INTO item VALUES (4, 'パスタ', '麺類', 24, 8);
INSERT INTO item VALUES (5, 'キャベツ', '野菜', 25, 5);
INSERT INTO item VALUES (6, 'ピーマン', '野菜', 20, 10);
INSERT INTO item VALUES (7, '玉ねぎ', '野菜', 27, 9);
INSERT INTO item VALUES (8, 'ニンジン', '野菜', 26, 4);
INSERT INTO item VALUES (9, 'トマト', '野菜', 28, 10);
INSERT INTO item VALUES (10, 'エビ', '水産物・水産加工品', 26, 5);
INSERT INTO item VALUES (11, 'タコ', '水産物・水産加工品', 24, 8);
INSERT INTO item VALUES (12, '卵', '卵・チーズ・乳製品', 30, 7);
INSERT INTO item VALUES (13, 'チーズ', '卵・チーズ・乳製品', 25, 5);
INSERT INTO item VALUES (14, 'リンゴ', '果物', 22, 7);
INSERT INTO item VALUES (15, 'バナナ', '果物', 24, 6);
INSERT INTO item VALUES (16, '塩', '調味料', 20, 8);
INSERT INTO item VALUES (17, '砂糖', '調味料', 20, 6);
INSERT INTO item VALUES (18, 'カルーア', 'リキュール', 25, 10);
INSERT INTO item VALUES (19, 'ヒプノティック', 'リキュール', 20, 8);
INSERT INTO item VALUES (20, 'メロンソーダ', 'ソフトドリンク', 28, 9);
INSERT INTO item VALUES (21, 'ウーロン茶', 'ソフトドリンク', 26, 7);
INSERT INTO item VALUES (22, 'オレンジジュース', 'ソフトドリンク', 29, 6);
INSERT INTO item VALUES (23, 'リンゴジュース', 'ソフトドリンク', 30, 5);
INSERT INTO item VALUES (24, 'カルピス', 'ソフトドリンク', 25, 5);
-- メニュー
INSERT INTO menu VALUES (1, 'オムライス', 'フード', 700, curdate(), curdate(), 'フワフワトロトロ', '卵,乳');
INSERT INTO menu VALUES (2, 'ハンバーグ', 'フード', 900, curdate(), curdate(), '外はカリカリ中はジューシー', '卵');
INSERT INTO menu VALUES (3, 'カレーライス', 'フード', 500, curdate(), curdate(), '子供も食べやすい辛さ', '');
INSERT INTO menu VALUES (4, 'カルボナーラ', 'フード', 600, curdate(), curdate(), 'ソースがとても美味しい', '乳,小麦');
INSERT INTO menu VALUES (5, '焼きそば', 'フード', 500, curdate(), curdate(), 'ソースが甘くておいしい', '小麦');
INSERT INTO menu VALUES (6, 'ざるそば', 'フード', 450, curdate(), curdate(), '麵が特注', 'そば');
INSERT INTO menu VALUES (7, 'ラーメン', 'フード', 550, curdate(), curdate(), '醬油ベース', '卵,小麦');
INSERT INTO menu VALUES (8, 'マルゲリータピザ', 'フード', 900, curdate(), curdate(), 'たっぷりチーズでとても美味しい', '乳,小麦');
INSERT INTO menu VALUES (9, 'メロンソーダ', 'ドリンク', 400, curdate(), curdate(), 'アイスが乗っている', '卵,乳');
INSERT INTO menu VALUES (10, 'ウーロン茶', 'ドリンク', 120, curdate(), curdate(), '子供でも飲みやすい', '');
INSERT INTO menu VALUES (11, 'オレンジジュース', 'ドリンク', 150, curdate(), curdate(), '大人にも子供にも人気', '');
INSERT INTO menu VALUES (12, 'リンゴジュース', 'ドリンク', 150, curdate(), curdate(), '甘味がとても強い', '');
INSERT INTO menu VALUES (13, 'カルピス', 'ドリンク', 170, curdate(), curdate(), '大人気', '');
INSERT INTO menu VALUES (14, '唐揚げ', 'サイドメニュー', 400, curdate(), curdate(), 'とてもジューシー', '卵,小麦');
INSERT INTO menu VALUES (15, 'フライドポテト', 'サイドメニュー', 300, curdate(), curdate(), '揚げたてでサクサク', '小麦');
INSERT INTO menu VALUES (16, 'エビフライ', 'サイドメニュー', 300, curdate(), curdate(), '揚げたてでサクサクプリプリ', 'えび');
INSERT INTO menu VALUES (17, 'チキンナゲット', 'サイドメニュー', 300, curdate(), curdate(), 'サクサクで食べやすい', '卵,小麦');
INSERT INTO menu VALUES (18, 'イカリング', 'サイドメニュー', 400, curdate(), curdate(), 'イカが新鮮', '卵,小麦');
INSERT INTO menu VALUES (19, 'チョコレートパフェ', 'デザート', 600, curdate(), curdate(), 'ホイップたっぷり', '卵,乳,小麦');
INSERT INTO menu VALUES (20, 'コーヒーゼリー', 'デザート', 450, curdate(), curdate(), 'クリームは甘く、ゼリーはほろ苦くておいしい', '乳');
INSERT INTO menu VALUES (21, 'スイートポテト', 'デザート', 350, curdate(), curdate(), '芋の甘さ引き立つ', '卵,乳');
INSERT INTO menu VALUES (22, 'プリン', 'デザート', 400, curdate(), curdate(), 'ホイップたっぷりでサクランボが乗っている', '卵,乳');
INSERT INTO menu VALUES (23, 'ポテトチップス', 'デザート', 200, curdate(), curdate(), 'サクサクで大人気', '卵,小麦');
INSERT INTO menu VALUES (24, 'ホットケーキ', 'デザート', 600, curdate(), curdate(), 'ホイップたっぷりでフワフワ', '卵,乳,小麦');
INSERT INTO menu VALUES (25, '海鮮丼', 'オススメ', 1500, curdate(), curdate(), 'とても豪華で数量限定', 'えび,かに');
INSERT INTO menu VALUES (26, '豚汁', 'オススメ', 500, curdate(), curdate(), '特性豚汁でおいしい', '');
INSERT INTO menu VALUES (27, 'ステーキ', 'オススメ', 2000, curdate(), curdate(), 'お肉がとても柔らかい', '');
INSERT INTO menu VALUES (28, '豪華パフェ', 'オススメ', 1500, curdate(), curdate(), 'たくさんお果物が乗っている', '卵,乳,小麦');
INSERT INTO menu VALUES (29, '特製シチュー', 'オススメ', 800, curdate(), curdate(), '子供から大人まで大人気', '卵,乳');


-- ビュー
create view stock_control as select i.item_id,i.item_name,i.item_genre,i.item_max,i.item_min,sum(sd.stock_detail_qty) as stock_qty, sum(od.ordering_detail_qty) as ordering_qty,od.ordering_detail_state, o.ordering_date
 from item as i
  left join stock_detail as sd on sd.item_id = i.item_id
   left join ordering_detail as od on od.item_id = i.item_id and ordering_detail_state = '1'
    left join ordering as o on o.ordering_id = od.ordering_id and o.ordering_date = (select min(o.ordering_date) from ordering)
     group by i.item_id;
create view stock_operation as select s.stock_id,i.item_name,i.item_genre,i.item_max,i.item_min,sd.stock_detail_qty,e.employee_name,s.stock_date
 from item as i
  inner join stock_detail as sd on i.item_id = sd.item_id
   inner join stock as s on s.stock_id = sd.stock_id
    inner join employee as e on e.employee_id = s.employee_id
     order by s.stock_id desc;
create view ordering_operation as select o.ordering_id,i.item_name,i.item_genre,i.item_max,i.item_min,od.ordering_detail_qty,od.ordering_detail_state,e.employee_name,o.ordering_date
 from item as i
  inner join ordering_detail as od on i.item_id = od.item_id
   inner join ordering as o on o.ordering_id = od.ordering_id
    inner join employee as e on e.employee_id = o.employee_id
     order by o.ordering_id desc;

set names cp932;