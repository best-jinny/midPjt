drop table member;
create table member(
  member_id varchar2(12) primary key,     --회원id
  member_password varchar2(12) not null,  --회원 비밀번호
  member_name varchar2(20) not null,      --회원 이름
  member_tel varchar2(20) unique not null,--회원 전화번호
  member_email varchar2(50) not null,      --회원 이메일
  member_reg_date date,                   --회원 등록일
  member_del char(1) default 'n'          --탈퇴여부
);
drop table cafe;
create sequence cafe_seq start with 1 increment by 1 nocycle nocache;
create table cafe (
	cafe_id number(4) primary key,      --카페id
	cafe_name varchar2(200) not null,    --카페 이름
  	cafe_readcount number(5) default 0, --조회수
 	cafe_addr varchar2(200) not null,    --카페 주소
	cafe_hours varchar2(200),            --카페 영업시간
  	cafe_tel varchar2(20),              --카페 전화번호
  	cafe_map varchar2(200) not null,
  	cafe_parking char(1),               --주차 가능여부 (Yes or No)
	cafe_reg_date date,                 --카페등록일
  	cafe_del char(1) default 'n'        --카페 폐업여부
);
alter table cafe add(cafe_map varchar(50));

update cafe set cafe_map = '37.5797734,126.9662843' where cafe_id=1; 
select * from hashtag;
select * from CAFE_LINK;
drop table CAFE_LINK;
select * from cafe;
drop table image;
delete from cafe where cafe_id=4;
delete from cafe where cafe_id=6;
delete from cafe where cafe_id=13;
--폴키 > 스코프 > 어니언 > 로컬
update cafe set cafe_readcount = 50 where cafe_id=2;

insert into cafe values (cafe_seq.nextval,'스코프',0,'종로구','월-금 11-7PM','02-111-1111'
	,'37.593362, 126.963615','n',sysdate,'n');
insert into cafe values (cafe_seq.nextval,'로컬스티치',0,'소공','월-금 11-7PM','02-111-1111'
	,'37.563831, 126.980082','n',sysdate,'n');
insert into cafe values (cafe_seq.nextval,'어니언',0,'안국','월-금 11-7PM','02-111-1111'
	,'37.578219, 126.986476','n',sysdate,'n');
insert into cafe values (cafe_seq.nextval,'폴키',0,'서촌','월-금 11-7PM','02-111-1111'
	,'37.576733, 126.968802','n',sysdate,'n');
select * from cafe order by cafe_readcount desc;
drop table wishlist;
create sequence wish_seq start with 1 increment by 1 nocycle nocache;
create table wishlist (
	wish_id number(10) primary key,                       --리스트ID
	member_id varchar2(12) references member(member_id),  --리스트 주인인 회원의 ID
  	cafe_id number(4) references cafe(cafe_id),           --담겨있는 카페의 ID
  	wish_reg_date date                                    --담긴 날짜
);
insert into wishlist values(wish_seq.nextval,'aa','1',sysdate);
select * from wishlist;

create sequence hash_seq start with 1 increment by 1 nocycle nocache;
create table hashtag  (
	hash_id number(4) primary key,          --해시태그 ID
	hash_name varchar2(100) not null unique       --구체적인 해시태그 이름
);
select * from hashtag where hash_name like '%한옥%';
select * from hashtag;
insert into hashtag values(hash_seq.nextval,'맛있는');
insert into hashtag values(hash_seq.nextval,'분위기');
insert into hashtag values(hash_seq.nextval,'스콘');
insert into hashtag values(hash_seq.nextval,'공부');
insert into hashtag values(hash_seq.nextval,'쾌적한');
insert into hashtag values(hash_seq.nextval,'한옥');
insert into hashtag values(hash_seq.nextval,'핫한');
insert into hashtag values(hash_seq.nextval,'커피맛집');
drop table hashkind;
create sequence hashkind_seq start with 1 increment by 1 nocycle nocache;
create table hashkind  (
	hashkind_id number(4) primary key,       --해시그룹 ID
	hashkind_name varchar2(100) not null unique     --구체적인 해시태그 그룹 이름
);

insert into hashkind values(hashkind_seq.nextval,'3kg찌기좋은');
insert into hashkind values(hashkind_seq.nextval,'공부하기쾌적한');
insert into hashkind values(hashkind_seq.nextval,'요즘인스타그램에서핫한');
insert into hashkind values(hashkind_seq.nextval,'데이트하기좋은');
insert into hashkind values(hashkind_seq.nextval,'부모님모시고가기좋은');

drop sequence img_seq;
create sequence img_seq start with 1 increment by 1 nocycle nocache;
drop table image;
create table image  (
	img_id number(7) primary key,               --이미지 ID
	img_path varchar(200) not null unique,				--이미지 경로
	cafe_id number(4) references cafe(cafe_id)  --이미지가 해당하는 카페 ID
);
select * from image where cafe_id=16;
select * from member;
select * from cafe;

insert into image values (img_seq.nextval,'/midterm/cafe_images/스코프/1.jpg',18);
insert into image values (img_seq.nextval,'/midterm/cafe_images/스코프/2.jpg',18);
insert into image values (img_seq.nextval,'/midterm/cafe_images/스코프/3.jpg',18);
insert into image values (img_seq.nextval,'/midterm/cafe_images/스코프/4.jpg',18);
insert into image values (img_seq.nextval,'/midterm/cafe_images/스코프/5.jpg',18);
insert into image values (img_seq.nextval,'/midterm/cafe_images/로컬스티치/1.jpg',19);
insert into image values (img_seq.nextval,'/midterm/cafe_images/로컬스티치/2.jpg',19);
insert into image values (img_seq.nextval,'/midterm/cafe_images/로컬스티치/3.jpg',19);
insert into image values (img_seq.nextval,'/midterm/cafe_images/로컬스티치/4.jpg',19);
insert into image values (img_seq.nextval,'/midterm/cafe_images/로컬스티치/5.jpg',19);
insert into image values (img_seq.nextval,'/midterm/cafe_images/어니언/1.jpg',20);
insert into image values (img_seq.nextval,'/midterm/cafe_images/어니언/2.jpg',20);
insert into image values (img_seq.nextval,'/midterm/cafe_images/어니언/3.jpg',20);
insert into image values (img_seq.nextval,'/midterm/cafe_images/어니언/4.jpg',20);
insert into image values (img_seq.nextval,'/midterm/cafe_images/어니언/5.jpg',20);
insert into image values (img_seq.nextval,'/midterm/cafe_images/폴키/1.jpg',21);
insert into image values (img_seq.nextval,'/midterm/cafe_images/폴키/2.jpg',21);
insert into image values (img_seq.nextval,'/midterm/cafe_images/폴키/3.jpg',21);
insert into image values (img_seq.nextval,'/midterm/cafe_images/폴키/4.jpg',21);
insert into image values (img_seq.nextval,'/midterm/cafe_images/폴키/5.jpg',21);
select * from 
		(select img_path from image where cafe_id=1 order by cafe_id)   
		where rowNum = 1;

create sequence cafe_link_seq start with 1 increment by 1 nocycle nocache;
create table cafe_link  (
	cafe_link_id number(7) primary key,             --카페와 해시태그 연결 내역 ID
	cafe_id number(4) references cafe(cafe_id),     --연결내역에 해당하는 카페 ID
	hash_id number(4) references hashtag(hash_id),  --연결내역에 해당하는 해시태그 ID
	member_id varchar2(12) references member(member_id) null  --연결내역에 해당하는 멤버 ID
);
drop table cafe_link;
select * from cafe_link where cafe_id=1;
select * from hashkind;
drop table cafe;
drop sequence cafe_link_seq;
insert into cafe_link values(cafe_link_seq.nextval,18,1,null);
insert into cafe_link values(cafe_link_seq.nextval,1,3,null);
insert into cafe_link values(cafe_link_seq.nextval,2,4,null);
insert into cafe_link values(cafe_link_seq.nextval,2,5,null);
insert into cafe_link values(cafe_link_seq.nextval,3,1,null);
insert into cafe_link values(cafe_link_seq.nextval,3,6,null);
insert into cafe_link values(cafe_link_seq.nextval,3,7,null);
insert into cafe_link values(cafe_link_seq.nextval,4,2,null);
insert into cafe_link values(cafe_link_seq.nextval,4,7,null);
insert into cafe_link values(cafe_link_seq.nextval,4,8,null);
select * from cafe_link where cafe_id=1;
select * from hashkind;
drop table hash_link;
drop sequence hash_link_seq;
create sequence hash_link_seq start with 1 increment by 1 nocycle nocache;
create table hash_link  (
	hash_link_id number(7) primary key,                   --해시그룹과 해시태그 연결 내역 ID
	hashkind_id number(4) references hashkind(hashkind_id),--연결내역에 해당하는 해시그룹 ID
  	hash_id number(4) references hashtag(hash_id)        --연결내역에 해당하는 해시태그 ID
);
select hash_id from (select rowNum rn,hash_id from hashtag where hash_name='맛있는' order by hash_id desc) where rn=1;
insert into hash_link values(hash_link_seq.nextval,1,1);
insert into hash_link values(hash_link_seq.nextval,1,3);
insert into hash_link values(hash_link_seq.nextval,2,4);
insert into hash_link values(hash_link_seq.nextval,2,5);
insert into hash_link values(hash_link_seq.nextval,2,8);
insert into hash_link values(hash_link_seq.nextval,3,2);
insert into hash_link values(hash_link_seq.nextval,3,7);
insert into hash_link values(hash_link_seq.nextval,4,2);
insert into hash_link values(hash_link_seq.nextval,4,6);
insert into hash_link values(hash_link_seq.nextval,4,8);
insert into hash_link values(hash_link_seq.nextval,5,1);
insert into hash_link values(hash_link_seq.nextval,5,5);
insert into hash_link values(hash_link_seq.nextval,5,6);

create table master  (
	master_id varchar2(12) primary key,   --마스터 ID
	master_pw varchar2(12) not null       --마스터 PW
);
insert into master values ('master','1234');
select * from master;