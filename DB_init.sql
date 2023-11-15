
/*
1)DB 생성
*/
create database umc_mission_db;
use umc_mission_db;


/*
2) member 테이블 생성
*/
create table member (
id bigint auto_increment,
m_name varchar(20) not null,
gender varchar(10) not null,
age int not null,
address varchar(40) not null,
spec_address varchar(40) not null,
m_status varchar(15),
inactive_date datetime,
social_type varchar(10) not null,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,
email varchar(50) not null,
m_point int default 0,

primary key (id),
index (created_at),
index (updated_at)
);


/*
3. Region 테이블 생성
*/
create table region (
id bigint auto_increment,
r_name varchar(20) not null,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
index (created_at),
index (updated_at)
);


/*
4. fodd_category 생성
*/
create table food_category (
id bigint auto_increment,
name varchar(15) not null,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
index (created_at),
index (updated_at)
);


/*
5.terms
*/
create table terms (
id bigint auto_increment,
title varchar(20) not null,
body text not null,
optional boolean not null,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
index (created_at),
index (updated_at)
);


/*
6. store 
*/
create table store (
id bigint auto_increment,
region_id bigint,
name varchar(50) not null,
address varchar(50) not null,
score float default 0,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
foreign key(region_id)
references region(id) on update cascade,
index (created_at),
index (updated_at)
);


/*
7. mission
*/
create table mission (
id bigint auto_increment,
store_id bigint,
reward int not null,
deadline datetime not null,
mission_spec text not null,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
foreign key(store_id)
references store(id) on update cascade,
index (created_at),
index (updated_at)
);


/*
8. member_mission
*/
create table member_mission (
id bigint auto_increment,
member_id bigint,
mission_id bigint,
status varchar(15) default 'yetyet',
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
foreign key(member_id) references member(id) on update cascade,
foreign key(mission_id) references mission(id) on update cascade,
index (created_at),
index (updated_at)
);


/*
9. member_agree
*/
create table member_agree (
id bigint auto_increment,
member_id bigint,
terms_id bigint,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
foreign key(member_id) references member(id) on update cascade,
foreign key(terms_id) references terms(id) on update cascade,
index (created_at),
index (updated_at)
);


/*
10. member_prefer
*/
create table member_prefer (
id bigint auto_increment,
member_id bigint,
category_id bigint,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
foreign key(member_id) references member(id) on update cascade,
foreign key(category_id) references food_category(id) on update cascade,
index (created_at),
index (updated_at)
);


/*
11. review
*/
create table review (
id bigint auto_increment,
member_id bigint,
store_id bigint,
mission_id bigint,
body text not null,
score float default 0,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
foreign key(member_id) references member(id) on update cascade,
foreign key(store_id) references store(id) on update cascade,
foreign key(mission_id) references mission(id) on update cascade,
index (created_at),
index (updated_at)
);


/*
12. review_image
*/
create table review_image (
id bigint auto_increment,
review_id bigint,
image_url text not null,
created_at timestamp not null default current_timestamp,
updated_at timestamp not null default current_timestamp on update current_timestamp,

primary key (id),
foreign key(review_id) references review(id) on update cascade,
index (created_at),
index (updated_at)
);