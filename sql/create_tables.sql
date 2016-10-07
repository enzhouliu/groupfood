show databases;

CREATE TABLE `groupfood`.`user_account`(
  `user_id` INT NOT NULL auto_increment,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `home_address` VARCHAR(200) NULL,
  `office_address` VARCHAR(200) NULL,
  `home_zipcode` VARCHAR(10) NULL,
  office_zipcode VARCHAR(10) NULL,
  create_ts timestamp default current_timestamp,
  update_ts timestamp default current_timestamp,
  update_by varchar(45) default 'System',
  INDEX `IDX_USER_NAME` (`name` ASC),
  PRIMARY KEY (`user_id`))
COMMENT = 'account information for each food user';

create table cuisine(
	cuisine_id int not null auto_increment primary key,
    cuisine_name varchar(100) not null,
    create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System'
)
comment='cuisine of the restaurant';

insert into cuisine (cuisine_name) values ('African');
insert into cuisine (cuisine_name) values ('American (New)');
insert into cuisine (cuisine_name) values ('American (Traditional)');
insert into cuisine (cuisine_name) values ('Argentinian');
insert into cuisine (cuisine_name) values ('Asian Fusion');
insert into cuisine (cuisine_name) values ('Australian');
insert into cuisine (cuisine_name) values ('Austrian');
insert into cuisine (cuisine_name) values ('Barbecue');
insert into cuisine (cuisine_name) values ('Belgian');
insert into cuisine (cuisine_name) values ('Brazilian');
insert into cuisine (cuisine_name) values ('British');
insert into cuisine (cuisine_name) values ('Burgers');
insert into cuisine (cuisine_name) values ('Cajun/Creole');
insert into cuisine (cuisine_name) values ('Caribbean');
insert into cuisine (cuisine_name) values ('Chinese');
insert into cuisine (cuisine_name) values ('Coffeehouse');
insert into cuisine (cuisine_name) values ('Colombian');
insert into cuisine (cuisine_name) values ('Continental');
insert into cuisine (cuisine_name) values ('Cuban');
insert into cuisine (cuisine_name) values ('Delicatessen');
insert into cuisine (cuisine_name) values ('Dessert');
insert into cuisine (cuisine_name) values ('Diner');
insert into cuisine (cuisine_name) values ('Eastern European');
insert into cuisine (cuisine_name) values ('Eclectic');
insert into cuisine (cuisine_name) values ('French');
insert into cuisine (cuisine_name) values ('Fusion');
insert into cuisine (cuisine_name) values ('German');
insert into cuisine (cuisine_name) values ('Greek');
insert into cuisine (cuisine_name) values ('Hawaiian');
insert into cuisine (cuisine_name) values ('Indian');
insert into cuisine (cuisine_name) values ('Irish');
insert into cuisine (cuisine_name) values ('Italian');
insert into cuisine (cuisine_name) values ('Japanese / Sushi');
insert into cuisine (cuisine_name) values ('Korean');
insert into cuisine (cuisine_name) values ('Laotian');
insert into cuisine (cuisine_name) values ('Latin American');
insert into cuisine (cuisine_name) values ('Malaysian');
insert into cuisine (cuisine_name) values ('Mediterranean');
insert into cuisine (cuisine_name) values ('Mexican');
insert into cuisine (cuisine_name) values ('Middle Eastern');
insert into cuisine (cuisine_name) values ('Moroccan');
insert into cuisine (cuisine_name) values ('Pan-Asian');
insert into cuisine (cuisine_name) values ('Peruvian');
insert into cuisine (cuisine_name) values ('Pizza');
insert into cuisine (cuisine_name) values ('Polish');
insert into cuisine (cuisine_name) values ('Portuguese');
insert into cuisine (cuisine_name) values ('Puerto Rican');
insert into cuisine (cuisine_name) values ('Quick Bite');
insert into cuisine (cuisine_name) values ('Russian');
insert into cuisine (cuisine_name) values ('Sandwiches');
insert into cuisine (cuisine_name) values ('Scandinavian');
insert into cuisine (cuisine_name) values ('Seafood');
insert into cuisine (cuisine_name) values ('Soul Food / Southern');
insert into cuisine (cuisine_name) values ('Southwestern');
insert into cuisine (cuisine_name) values ('Spanish');
insert into cuisine (cuisine_name) values ('Sri Lankan');
insert into cuisine (cuisine_name) values ('Steakhouse');
insert into cuisine (cuisine_name) values ('Thai');
insert into cuisine (cuisine_name) values ('Turkish');
insert into cuisine (cuisine_name) values ('Ukrainian');
insert into cuisine (cuisine_name) values ('Vietnamese');


create table restaurant (
	restaurant_id int not null auto_increment,
    name varchar(45) not null,
    password varchar(45) not null, 
    address varchar(200) not null,
    zipcode varchar(10) not null,
    phone_number varchar(45) not null,
    create_ts timestamp default current_timestamp,
	update_ts timestamp default current_timestamp,
	update_by varchar(45) default 'System',
    PRIMARY KEY (`restaurant_id`)
)
comment = 'restaurant information';

create table restaurant_cuisine(
	restaurant_id int,
    cuisine_id int,
    create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System',
    primary key(restaurant_id, cuisine_id),
    foreign key(restaurant_id) references restaurant(restaurant_id),
    foreign key(cuisine_id) references cuisine(cuisine_id),
    INDEX(restaurant_id),
    INDEX(cuisine_id)
)
comment='which cusine the restaurant is';


create table order_status (
	order_status_id int auto_increment primary key,
    order_Status varchar(100) not null,
    create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System'
)
comment='order status';

insert into order_status (order_status) values('draft');
insert into order_status (order_status) values('order complete');
insert into order_status (order_status) values('order accepted');
insert into order_status (order_status) values('cancel pending');
insert into order_status (order_status) values('cancel accepted');
insert into order_status (order_status) values('cancel rejected');
insert into order_status (order_status) values('delivered');
select * from order_status;

create table location(
	location_id int auto_increment primary key,
    address varchar(45),
    zipcode varchar(10),
	location_status int default 0,
    create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System'
)
comment='delivery location';

create table schedule(
	schedule_id int auto_increment primary key,
    restaurant_id int,
    location_id int,
    ship_date date not null,
    start_time datetime not null, 
    end_time datetime not null,
    foreign key(restaurant_id) references restaurant(restaurant_id),
    foreign key(location_id) references location(location_id)
)
comment='shipping schedule information';

create table food_order(
	order_id int not null auto_increment primary key,
    user_id int not null,
    schedule_id int not null,
    order_status_id int not null,
    comments TEXT,
	create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System',
    INDEX(user_id),
    foreign key(user_id) references user_account(user_id),
    foreign key(order_status_id) references order_status(order_status_id),
    foreign key(schedule_id) references schedule(schedule_id)
)
comment='order information';

create table order_detail(
	order_detail_id int auto_increment primary key,
    order_id int not null,
    item_id int not null,
    amount int not null,
    create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System',
    INDEX(order_id),
    INDEX(item_id),
    foreign key(order_id) references food_order(order_id),
    foreign key(item_id) references menu_item(item_id)
)
comment='order detail information';

create table menu(
	menu_id int auto_increment primary key,
    menu_name varchar(100) not null,
    display_order int default 0,
    restaurant_id int not null,
    logical_delete_in boolean default false,
    create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System',
    foreign key(restaurant_id) references restaurant(restaurant_id)
)
comment='menu information';

create table menu_item(
	item_id int auto_increment primary key,
    menu_id int not null,
    item_name varchar(200) not null,
    item_english_name varchar(200) not null,
    is_popular boolean default false,
    picture varchar(500),
    alergic_alert varchar(500),
    spicy_level int default 0,
    description TEXT,
    create_ts timestamp default current_timestamp,
    update_ts timestamp default current_timestamp,
    update_by varchar(45) default 'System',
    foreign key(menu_id) references menu(menu_id),
    check(spicy_level >=0 and spicy_level <=5)
)
comment='information for each food item';
alter table menu_item add price float not null;
select * from menu_item
