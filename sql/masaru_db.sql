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
	stock_detail_qty SMALLINT UNSIGNED NOT NULL,
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
INSERT INTO employee values ('ore', 'sama', '俺様', 'アルバイト', 'oresama@ex.com', '000-0000-0000');

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