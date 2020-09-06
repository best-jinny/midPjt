drop table cafe cascade constraints;
drop table member cascade constraints;
drop table image cascade constraints;
drop table wishlist cascade constraints;
drop table hashtag cascade constraints;
drop table hashkind cascade constraints;
drop table cafe_link cascade constraints;
drop table hash_link cascade constraints;
drop table master cascade constraints;

drop sequence cafe_seq;
drop sequence  wish_seq;
drop sequence hash_seq;
drop sequence hashkind_seq;
drop sequence img_seq;
drop sequence cafe_link_seq;
drop sequence hash_link_seq;

create table member(
  member_id varchar2(12) primary key,     --회원id
  member_password varchar2(12) not null,  --회원 비밀번호
  member_name varchar2(20) not null,      --회원 이름
  member_tel varchar2(20) unique not null,--회원 전화번호
  member_email varchar2(50) not null,      --회원 이메일
  member_reg_date date,                   --회원 등록일
  member_del char(1) default 'n'          --탈퇴여부
);
create table cafe (
	cafe_id number(4) primary key,      --카페id
	cafe_name varchar2(200) not null,    --카페 이름
  cafe_readcount number(5) default 0, --조회수
  cafe_addr varchar2(200) not null,    --카페 주소
  cafe_hours varchar2(200),            --카페 영업시간
  cafe_tel varchar2(20),              --카페 전화번호
  cafe_parking char(1),               --주차 가능여부 (Yes or No)
	cafe_reg_date date,                 --카페등록일
  cafe_del char(1) default 'n',        --카페 폐업여부
  cafe_map varchar2(50),                --카페지도
  cafe_desc varchar2(2000)               --카페설명
);

create table image  (
	img_id number(7) primary key,               --이미지 ID
	img_path varchar(200) not null,		--이미지 경로
	cafe_id number(4) references cafe(cafe_id)  --이미지가 해당하는 카페 ID
);
select * from hashtag;
create table hashtag  (
	hash_id number(4) primary key,          --해시태그 ID
	hash_name varchar2(100) not null unique       --구체적인 해시태그 이름
);

create table hashkind  (
	hashkind_id number(4) primary key,       --해시그룹 ID
	hashkind_name varchar2(150) not null     --구체적인 해시태그 그룹 이름
);


create table cafe_link  (
	cafe_link_id number(7) primary key,             --카페와 해시태그 연결 내역 ID
	cafe_id number(4) references cafe(cafe_id),     --연결내역에 해당하는 카페 ID
	hash_id number(4) references hashtag(hash_id),  --연결내역에 해당하는 해시태그 ID
	member_id varchar2(12) references member(member_id)  --연결내역에 해당하는 멤버 ID
);

create table hash_link  (
	hash_link_id number(7) primary key,                   --해시그룹과 해시태그 연결 내역 ID
	hashkind_id number(4) references hashkind(hashkind_id),--연결내역에 해당하는 해시그룹 ID
  	hash_id number(4) references hashtag(hash_id)        --연결내역에 해당하는 해시태그 ID
);


create table master  (
	master_id varchar2(12) primary key,   --마스터 ID
	master_pw varchar2(12) not null       --마스터 PW
);

create table wishlist (
	wish_id number(10) primary key,                       --리스트ID
	member_id varchar2(12) references member(member_id),  --리스트 주인인 회원의 ID
  cafe_id number(4) references cafe(cafe_id),           --담겨있는 카페의 ID
  wish_reg_date date                                    --담긴 날짜
);
create sequence cafe_seq start with 1 increment by 1 nocycle nocache;
create sequence wish_seq start with 1 increment by 1 nocycle nocache;
create sequence hash_seq start with 1 increment by 1 nocycle nocache;
create sequence hashkind_seq start with 1 increment by 1 nocycle nocache;
create sequence img_seq start with 1 increment by 1 nocycle nocache;
create sequence cafe_link_seq start with 1 increment by 1 nocycle nocache;
create sequence hash_link_seq start with 1 increment by 1 nocycle nocache;

insert into master values ('master','1234');
insert into member values('member1', '1', '길동이', '01012345678', 'hong@gmail.com', sysdate, 'n');

insert into cafe values(cafe_seq.nextval, '씨스루', default, '서울 용산구 녹사평대로40나길 37', '매일 12:00 - 22:00 ', '070-7796-8991', 'y', sysdate, default, '37.5359966,126.98712','씨스루의 시그니처 메뉴인 크라마트커피,이색커피 꼭 드셔보셨으면 좋겠습니다.
요즘에는 다양한 맛의 똥스콘 인기가 많은데요!! 이 외에도 말차, 한라산, 파스타치오 바닐라 등 다양한 똥스콘 종류가 있으니 여러 개 시켜서 나눠 먹는 것도 좋은 선택일 것 같습니다.:)'); 
insert into cafe values(cafe_seq.nextval, 'SCOFF', default, '서울 종로구 창의문로 149', '매일 11:00 - 20:00, 매주 월,화 휴무(공휴일일 경우 오픈) ', '070-8801-1739', 'n', sysdate, default, '37.5805765,126.9655279','커피와 영국식 디저트를 하는 곳 스코프
다양한 종류의 빵과 스콘, 브라우니 등 다양한 디저트가 있어서 보기만 해도 너무 행복하다는 이야기가 있어요! 외부는 외국분위기로 이루어져 있어 사진 찍기 좋으며 내부는 깔끔한 분위기를 느낄 수 있다고 하네요:)'); 
insert into cafe values(cafe_seq.nextval, '평균율', default, '서울 중구 충무로4길 3', '화~토 13:00 - 24:00 커피 Last Order 17시(18시 이후 와인바로 운영) 일요일 휴무 ', '02-2275-9249', 'n', sysdate, default, '37.5652297,126.9923704','카페에서 여유롭게 음악을 들으며 하루를 보내고 싶은 마음이 드는 요즘
카페에 앉아 음악을 들을 때, 선곡까지 좋으면 괜히 기분이 더 좋아지게 되는데요~ 소개해드릴 곳은 분위기 있게 커피를 마시며 좋은 노래를 들을 수 있는 을지로에 위치한 평균율입니다.'); 
insert into cafe values(cafe_seq.nextval, '비루개', default, '경기 남양주시 별내면 용암비루개길 219-88', '평일 13:00 - 23:00, 주말/공휴일 13:00 - 23:00, 매주 화/수요일 휴무(공휴일 제외) ', '031-841-7612', 'y', sysdate, default, '37.7367487,127.1248251','창밖을 내다보면 자연이 주는 초록빛의 풍경이 눈에 들어오게 되는 비루개
이런 좋은 풍경을 보고 있으면 빠르게만 흘러가던 시간이 잠시 멈춰, 풍경을 느긋하게 바라볼 수 있는 시간을 선물해주는 이 곳 친구랑 와도 좋고, 가족끼리 와서 커피를 먹으며 여유를 가지는 것도 좋을 것 같아요'); 
insert into cafe values(cafe_seq.nextval, 'Local Stitch', default, '서울 중구 소공로 96', '평일 8:00 - 20:00, 토요일 11:00 - 19:00, 일요일 휴무 ', '02-322-8601', 'n', sysdate, default, '37.5634858,126.9782881','따뜻한 햇살을 맞으며 맛있는 브런치를 먹으면서 일도 같이 할 수 있는 공유 오피스 로컬스티치 입니다.
커피와 디저트, 쉐프가 요리한 브런치를 먹을수 있으며, 브런치는 하루전 예약시 가능하니 이점 참고하면 좋을것 같아요! 친구나 연인, 가족과 함께 방문해도 좋을카페입니다:)'); 
insert into cafe values(cafe_seq.nextval, 'Cafe Brief', default, '제주 제주시 애월읍 광성로 76', '매일 10:30 - 19:00, 휴무일 인스타그램(@brief_official) 공지 확인', '064-711-5507', 'n', sysdate, default, '33.4586071,126.414537','일상에서 놀 때나, 여행에 가게 됐을 때 이제는 꼭 가게되는 곳 중 하나가 카페인데요
그만큼 요즘 카페 하나를 찾는데에도 심혈을 기울이게 됩니다. 이제는 무작정 예쁜 카페가 아닌 그 날 나의 기분에 맞는 카페들을 찾게 되는데 만약, 달달한 것을 먹으며 넓은 카페의 공간에서 차분한 느낌을 받고 싶은 날이라면 카페브리프를 방문해보세요.'); 
insert into cafe values(cafe_seq.nextval, 'anthracite', default, '서울 마포구 월드컵로12길 11', '매일 09:00 - 22:00', '02-336-7650', 'n', sysdate, default, '37.5555715,126.9110869','합정동, 한남동, 서교동 그리고 제주도에서 각각의 빈티지함을 뿜어내고 있는 앤트러사이트 에서는 특히 원두의 로스팅에 공을 들이고 있어, 세계 각지의 시인이나 작가와 같은 예술가들을 이미지화하여
네이밍한 커피 원두 시리즈로도 유명합니다. 카페 내에서 직접 로스팅을 하기 때문에 늘 진한 커피 향으로 가득하지요. 맛, 인테리어, 음악, 분위기 등 디테일한 센스를 느낄 수 있는 이곳은, 감도 높은 문화인이 찾아올 것만 같은 카페입니다.'); 
insert into cafe values(cafe_seq.nextval, 'onion', default, '서울특별시 종로구 계동 계동길 5', '평일 07:00 - 22:00, 주말 09:00-22:00', '070-7543-2123', 'n', sysdate, default, '37.5772939,126.9870177','어니언은 전체적으로 한옥감성을 신경을 많이 쓴  카페입니다.
의자에 앉을 수 있는 공간부터 마루처럼 바닥에 앉을 수 있는 공간까지 다양하게 준비되어 있습니다. 창 너머로 들어오는 따스한 햇빛을 느끼며 빵과 음료를 마시면 그 자체로 힐링이 될 것 같네요:)'); 
insert into cafe values(cafe_seq.nextval, 'Terarosa', default, '강원 강릉시 구정면 현천길 25', '매일 09:00 - 21:00', '033-648-2760', 'y', sysdate, default, '37.6961228,128.8914682','직접 커피콩을 재배하고 있는 테라로사 
원두의 깊은 향기를 비교할 수 있는 디스플레이도 갖추고 있습니다. 2층은 고가구와 함께 느긋하게 쉬어갈 수 있는 공간으로, 큰 창문을 통해 바깥 풍경을 조망할 수 있으며  외부에는 테라스로 꾸며져 날씨를 느끼며 커피를 마시기 좋을것 같네요! '); 
insert into cafe values(cafe_seq.nextval, 'FOLKI', default, '서울 종로구 사직로9길 6', '매일 10:00 - 22:00', '02-722-0855', 'n', sysdate, default, '37.5767246,126.9679178','만약 월급을 받고 폴키를 가신다면 월급 탕진하기 좋은 곳이라고 합니다. 
가죽공방도 같이 운영중인 폴키. 소품들을 보면 구매를 하고 싶은 욕구가 치밀어 오른다고 하네요! 음료도,왠지 더욱 맛날 것만 같은 느낌이 드네요:) 한번 들어가면 헤어 나오지 못할 것만 같은 폴키 에서 좋은 추억 만들고 오세요!'); 
insert into cafe values(cafe_seq.nextval, '호시담', default, '전남 담양군 용면 추령로 375-21', '매일 11:00 - 20:00', '010-7649-2046', 'y', sysdate, default, '35.3889532,126.9624578','결코 흔치않은 그림 같은 풍경을 탁 트인 곳에서 보여주는 호시담
인테리어 센스까지 있는 곳이라 정말 매력적인 공간이라고 느껴지는 이 곳 사진도, 힐링도, 풍경도, 모두 건지고, 담고 오고 싶으시다면 꼭 한번 들려보세요!');

insert into hashkind values(hashkind_seq.nextval,'spill에서보고왔습니다');
insert into hashkind values(hashkind_seq.nextval,'나는먹을때가제일행복하다');
insert into hashkind values(hashkind_seq.nextval,'나는여행이미치도록그립다');
insert into hashkind values(hashkind_seq.nextval,'호텔비주얼뺨치는디저트');
insert into hashkind values(hashkind_seq.nextval,'요즘누가카페에서커피만마시니?');
insert into hashkind values(hashkind_seq.nextval,'분위기가다했다!');
insert into hashkind values(hashkind_seq.nextval,'카캉스가대세');
insert into hashkind values(hashkind_seq.nextval,'공부하기쾌적한');
insert into hashkind values(hashkind_seq.nextval,'여기가면나도힙스터?');
insert into hashkind values(hashkind_seq.nextval,'부모님모시고가기좋은');
insert into hashkind values(hashkind_seq.nextval,'카페?산책여기서다해결해');
insert into hashkind values(hashkind_seq.nextval,'지친마음달래주는');

insert into hashtag values(hash_seq.nextval,'연남동카페');
insert into hashtag values(hash_seq.nextval,'이색커피');
insert into hashtag values(hash_seq.nextval,'크라마트커피');
insert into hashtag values(hash_seq.nextval,'부암동카페');
insert into hashtag values(hash_seq.nextval,'스콘맛집');
insert into hashtag values(hash_seq.nextval,'영국식디저트');
insert into hashtag values(hash_seq.nextval,'을지로카페');
insert into hashtag values(hash_seq.nextval,'LP카페');
insert into hashtag values(hash_seq.nextval,'저녁엔와인바');
insert into hashtag values(hash_seq.nextval,'남양주카페');
insert into hashtag values(hash_seq.nextval,'식물원카페');
insert into hashtag values(hash_seq.nextval,'서울근교데이트');
insert into hashtag values(hash_seq.nextval,'소공동카페');
insert into hashtag values(hash_seq.nextval,'공유오피스');
insert into hashtag values(hash_seq.nextval,'애월카페');
insert into hashtag values(hash_seq.nextval,'앙버터키트');
insert into hashtag values(hash_seq.nextval,'제주도여행');
insert into hashtag values(hash_seq.nextval,'망원동카페');
insert into hashtag values(hash_seq.nextval,'핸드드립맛집');
insert into hashtag values(hash_seq.nextval,'독서하기좋은카페');
insert into hashtag values(hash_seq.nextval,'종로카페');
insert into hashtag values(hash_seq.nextval,'한옥카페');
insert into hashtag values(hash_seq.nextval,'강릉카페');
insert into hashtag values(hash_seq.nextval,'테라로사원두');
insert into hashtag values(hash_seq.nextval,'서촌카페');
insert into hashtag values(hash_seq.nextval,'가죽공방');
insert into hashtag values(hash_seq.nextval,'담양카페');
insert into hashtag values(hash_seq.nextval,'담양여행');
insert into hashtag values(hash_seq.nextval,'디저트맛집');
insert into hashtag values(hash_seq.nextval,'먹킷리스트');
insert into hashtag values(hash_seq.nextval,'데이트하기좋은곳');
insert into hashtag values(hash_seq.nextval,'인생카페발견');
insert into hashtag values(hash_seq.nextval,'핫플');
insert into hashtag values(hash_seq.nextval,'이색데이트');
insert into hashtag values(hash_seq.nextval,'coffee');
insert into hashtag values(hash_seq.nextval,'cafe');
insert into hashtag values(hash_seq.nextval,'분위기카페');
insert into hashtag values(hash_seq.nextval,'카페충전');

insert into cafe_link values(cafe_link_seq.nextval,1,1,null);
insert into cafe_link values(cafe_link_seq.nextval,1,2,null);
insert into cafe_link values(cafe_link_seq.nextval,1,3,null);
insert into cafe_link values(cafe_link_seq.nextval,1,30,null);
insert into cafe_link values(cafe_link_seq.nextval,1,34,null);
insert into cafe_link values(cafe_link_seq.nextval,1,38,null);
insert into cafe_link values(cafe_link_seq.nextval,2,4,null);
insert into cafe_link values(cafe_link_seq.nextval,2,5,null);
insert into cafe_link values(cafe_link_seq.nextval,2,6,null);
insert into cafe_link values(cafe_link_seq.nextval,2,29,null);
insert into cafe_link values(cafe_link_seq.nextval,2,33,null);
insert into cafe_link values(cafe_link_seq.nextval,2,38,null);
insert into cafe_link values(cafe_link_seq.nextval,3,7,null);
insert into cafe_link values(cafe_link_seq.nextval,3,8,null);
insert into cafe_link values(cafe_link_seq.nextval,3,9,null);
insert into cafe_link values(cafe_link_seq.nextval,3,31,null);
insert into cafe_link values(cafe_link_seq.nextval,3,33,null);
insert into cafe_link values(cafe_link_seq.nextval,3,37,null);
insert into cafe_link values(cafe_link_seq.nextval,3,38,null);
insert into cafe_link values(cafe_link_seq.nextval,4,10,null);
insert into cafe_link values(cafe_link_seq.nextval,4,11,null);
insert into cafe_link values(cafe_link_seq.nextval,4,12,null);
insert into cafe_link values(cafe_link_seq.nextval,4,35,null);
insert into cafe_link values(cafe_link_seq.nextval,4,37,null);
insert into cafe_link values(cafe_link_seq.nextval,4,34,null);
insert into cafe_link values(cafe_link_seq.nextval,4,38,null);
insert into cafe_link values(cafe_link_seq.nextval,5,13,null);
insert into cafe_link values(cafe_link_seq.nextval,5,14,null);
insert into cafe_link values(cafe_link_seq.nextval,5,30,null);
insert into cafe_link values(cafe_link_seq.nextval,5,38,null);
insert into cafe_link values(cafe_link_seq.nextval,5,29,null);
insert into cafe_link values(cafe_link_seq.nextval,5,35,null);
insert into cafe_link values(cafe_link_seq.nextval,6,15,null);
insert into cafe_link values(cafe_link_seq.nextval,6,16,null);
insert into cafe_link values(cafe_link_seq.nextval,6,17,null);
insert into cafe_link values(cafe_link_seq.nextval,6,29,null);
insert into cafe_link values(cafe_link_seq.nextval,6,31,null);
insert into cafe_link values(cafe_link_seq.nextval,6,32,null);
insert into cafe_link values(cafe_link_seq.nextval,6,38,null);
insert into cafe_link values(cafe_link_seq.nextval,7,18,null);
insert into cafe_link values(cafe_link_seq.nextval,7,19,null);
insert into cafe_link values(cafe_link_seq.nextval,7,20,null);
insert into cafe_link values(cafe_link_seq.nextval,7,33,null);
insert into cafe_link values(cafe_link_seq.nextval,7,36,null);
insert into cafe_link values(cafe_link_seq.nextval,7,32,null);
insert into cafe_link values(cafe_link_seq.nextval,7,38,null);
insert into cafe_link values(cafe_link_seq.nextval,8,21,null);
insert into cafe_link values(cafe_link_seq.nextval,8,22,null);
insert into cafe_link values(cafe_link_seq.nextval,8,29,null);
insert into cafe_link values(cafe_link_seq.nextval,8,30,null);
insert into cafe_link values(cafe_link_seq.nextval,8,35,null);
insert into cafe_link values(cafe_link_seq.nextval,8,34,null);
insert into cafe_link values(cafe_link_seq.nextval,8,38,null);
insert into cafe_link values(cafe_link_seq.nextval,9,23,null);
insert into cafe_link values(cafe_link_seq.nextval,9,24,null);
insert into cafe_link values(cafe_link_seq.nextval,9,35,null);
insert into cafe_link values(cafe_link_seq.nextval,9,36,null);
insert into cafe_link values(cafe_link_seq.nextval,9,31,null);
insert into cafe_link values(cafe_link_seq.nextval,9,33,null);
insert into cafe_link values(cafe_link_seq.nextval,9,38,null);
insert into cafe_link values(cafe_link_seq.nextval,10,25,null);
insert into cafe_link values(cafe_link_seq.nextval,10,26,null);
insert into cafe_link values(cafe_link_seq.nextval,10,32,null);
insert into cafe_link values(cafe_link_seq.nextval,10,34,null);
insert into cafe_link values(cafe_link_seq.nextval,10,35,null);
insert into cafe_link values(cafe_link_seq.nextval,10,36,null);
insert into cafe_link values(cafe_link_seq.nextval,10,38,null);
insert into cafe_link values(cafe_link_seq.nextval,11,27,null);
insert into cafe_link values(cafe_link_seq.nextval,11,28,null);
insert into cafe_link values(cafe_link_seq.nextval,11,31,null);
insert into cafe_link values(cafe_link_seq.nextval,11,32,null);
insert into cafe_link values(cafe_link_seq.nextval,11,37,null);
insert into cafe_link values(cafe_link_seq.nextval,11,33,null);
insert into cafe_link values(cafe_link_seq.nextval,11,38,null);

insert into hash_link values(hash_link_seq.nextval,1,1);
insert into hash_link values(hash_link_seq.nextval,1,2);
insert into hash_link values(hash_link_seq.nextval,1,3);
insert into hash_link values(hash_link_seq.nextval,1,4);
insert into hash_link values(hash_link_seq.nextval,1,5);
insert into hash_link values(hash_link_seq.nextval,1,6);
insert into hash_link values(hash_link_seq.nextval,1,7);
insert into hash_link values(hash_link_seq.nextval,1,8);
insert into hash_link values(hash_link_seq.nextval,1,9);
insert into hash_link values(hash_link_seq.nextval,1,10);
insert into hash_link values(hash_link_seq.nextval,1,11);
insert into hash_link values(hash_link_seq.nextval,1,12);
insert into hash_link values(hash_link_seq.nextval,1,13);
insert into hash_link values(hash_link_seq.nextval,1,14);
insert into hash_link values(hash_link_seq.nextval,1,15);
insert into hash_link values(hash_link_seq.nextval,1,16);
insert into hash_link values(hash_link_seq.nextval,1,17);
insert into hash_link values(hash_link_seq.nextval,1,18);
insert into hash_link values(hash_link_seq.nextval,1,19);
insert into hash_link values(hash_link_seq.nextval,1,20);
insert into hash_link values(hash_link_seq.nextval,1,21);
insert into hash_link values(hash_link_seq.nextval,1,22);
insert into hash_link values(hash_link_seq.nextval,1,23);
insert into hash_link values(hash_link_seq.nextval,1,24);
insert into hash_link values(hash_link_seq.nextval,1,25);
insert into hash_link values(hash_link_seq.nextval,1,26);
insert into hash_link values(hash_link_seq.nextval,1,27);
insert into hash_link values(hash_link_seq.nextval,1,28);
insert into hash_link values(hash_link_seq.nextval,1,29);
insert into hash_link values(hash_link_seq.nextval,1,30);
insert into hash_link values(hash_link_seq.nextval,1,31);
insert into hash_link values(hash_link_seq.nextval,1,32);
insert into hash_link values(hash_link_seq.nextval,1,33);
insert into hash_link values(hash_link_seq.nextval,1,34);
insert into hash_link values(hash_link_seq.nextval,1,35);
insert into hash_link values(hash_link_seq.nextval,1,36);
insert into hash_link values(hash_link_seq.nextval,1,37);
insert into hash_link values(hash_link_seq.nextval,1,38);
insert into hash_link values(hash_link_seq.nextval,2,1);
insert into hash_link values(hash_link_seq.nextval,2,2);
insert into hash_link values(hash_link_seq.nextval,2,3);
insert into hash_link values(hash_link_seq.nextval,2,15);
insert into hash_link values(hash_link_seq.nextval,2,16);
insert into hash_link values(hash_link_seq.nextval,2,17);
insert into hash_link values(hash_link_seq.nextval,2,21);
insert into hash_link values(hash_link_seq.nextval,2,22);
insert into hash_link values(hash_link_seq.nextval,3,15);
insert into hash_link values(hash_link_seq.nextval,3,16);
insert into hash_link values(hash_link_seq.nextval,3,17);
insert into hash_link values(hash_link_seq.nextval,3,23);
insert into hash_link values(hash_link_seq.nextval,3,24);
insert into hash_link values(hash_link_seq.nextval,3,27);
insert into hash_link values(hash_link_seq.nextval,3,28);
insert into hash_link values(hash_link_seq.nextval,4,4);
insert into hash_link values(hash_link_seq.nextval,4,5);
insert into hash_link values(hash_link_seq.nextval,4,6);
insert into hash_link values(hash_link_seq.nextval,4,13);
insert into hash_link values(hash_link_seq.nextval,4,14);
insert into hash_link values(hash_link_seq.nextval,5,10);
insert into hash_link values(hash_link_seq.nextval,5,11);
insert into hash_link values(hash_link_seq.nextval,5,12);
insert into hash_link values(hash_link_seq.nextval,5,25);
insert into hash_link values(hash_link_seq.nextval,5,26);
insert into hash_link values(hash_link_seq.nextval,6,7);
insert into hash_link values(hash_link_seq.nextval,6,8);
insert into hash_link values(hash_link_seq.nextval,6,9);
insert into hash_link values(hash_link_seq.nextval,6,27);
insert into hash_link values(hash_link_seq.nextval,6,28);
insert into hash_link values(hash_link_seq.nextval,7,1);
insert into hash_link values(hash_link_seq.nextval,7,2);
insert into hash_link values(hash_link_seq.nextval,7,3);
insert into hash_link values(hash_link_seq.nextval,7,18);
insert into hash_link values(hash_link_seq.nextval,7,19);
insert into hash_link values(hash_link_seq.nextval,7,20);
insert into hash_link values(hash_link_seq.nextval,8,13);
insert into hash_link values(hash_link_seq.nextval,8,14);
insert into hash_link values(hash_link_seq.nextval,8,18);
insert into hash_link values(hash_link_seq.nextval,8,19);
insert into hash_link values(hash_link_seq.nextval,8,20);
insert into hash_link values(hash_link_seq.nextval,9,7);
insert into hash_link values(hash_link_seq.nextval,9,8);
insert into hash_link values(hash_link_seq.nextval,9,9);
insert into hash_link values(hash_link_seq.nextval,9,23);
insert into hash_link values(hash_link_seq.nextval,9,24);
insert into hash_link values(hash_link_seq.nextval,10,10);
insert into hash_link values(hash_link_seq.nextval,10,11);
insert into hash_link values(hash_link_seq.nextval,10,12);
insert into hash_link values(hash_link_seq.nextval,10,21);
insert into hash_link values(hash_link_seq.nextval,10,22);
insert into hash_link values(hash_link_seq.nextval,10,27);
insert into hash_link values(hash_link_seq.nextval,10,28);
insert into hash_link values(hash_link_seq.nextval,11,10);
insert into hash_link values(hash_link_seq.nextval,11,11);
insert into hash_link values(hash_link_seq.nextval,11,12);
insert into hash_link values(hash_link_seq.nextval,11,27);
insert into hash_link values(hash_link_seq.nextval,11,28);
insert into hash_link values(hash_link_seq.nextval,12,4);
insert into hash_link values(hash_link_seq.nextval,12,5);
insert into hash_link values(hash_link_seq.nextval,12,6);
insert into hash_link values(hash_link_seq.nextval,12,7);
insert into hash_link values(hash_link_seq.nextval,12,8);
insert into hash_link values(hash_link_seq.nextval,12,9);

insert into image values(img_seq.nextval, '/midterm/images/씨스루/1.jpg', 1);
insert into image values(img_seq.nextval, '/midterm/images/씨스루/2.jpg', 1);
insert into image values(img_seq.nextval, '/midterm/images/씨스루/3.jpg', 1);
insert into image values(img_seq.nextval, '/midterm/images/씨스루/4.jpg', 1);
insert into image values(img_seq.nextval, '/midterm/images/씨스루/5.jpg', 1);
insert into image values(img_seq.nextval, '/midterm/images/씨스루/6.JPG', 1);

insert into image values(img_seq.nextval, '/midterm/images/스코프서촌/1.JPG', 2);
insert into image values(img_seq.nextval, '/midterm/images/스코프서촌/2.JPG', 2);
insert into image values(img_seq.nextval, '/midterm/images/스코프서촌/3.JPG', 2);
insert into image values(img_seq.nextval, '/midterm/images/스코프서촌/4.JPG', 2);
insert into image values(img_seq.nextval, '/midterm/images/스코프서촌/5.JPG', 2);
insert into image values(img_seq.nextval, '/midterm/images/스코프서촌/6.JPG', 2);

insert into image values(img_seq.nextval, '/midterm/images/평균율/1.jpg', 3);
insert into image values(img_seq.nextval, '/midterm/images/평균율/2.jpg', 3);
insert into image values(img_seq.nextval, '/midterm/images/평균율/3.jpg', 3);
insert into image values(img_seq.nextval, '/midterm/images/평균율/4.jpg', 3);
insert into image values(img_seq.nextval, '/midterm/images/평균율/5.jpg', 3);
insert into image values(img_seq.nextval, '/midterm/images/평균율/6.jpg', 3);

insert into image values(img_seq.nextval, '/midterm/images/비루개/1.JPG', 4);
insert into image values(img_seq.nextval, '/midterm/images/비루개/2.PNG', 4);
insert into image values(img_seq.nextval, '/midterm/images/비루개/3.PNG', 4);
insert into image values(img_seq.nextval, '/midterm/images/비루개/4.JPG', 4);
insert into image values(img_seq.nextval, '/midterm/images/비루개/5.JPG', 4);
insert into image values(img_seq.nextval, '/midterm/images/비루개/6.JPG', 4);

insert into image values(img_seq.nextval, '/midterm/images/로컬스티치/1.jpg', 5);
insert into image values(img_seq.nextval, '/midterm/images/로컬스티치/2.PNG', 5);
insert into image values(img_seq.nextval, '/midterm/images/로컬스티치/3.jpg', 5);
insert into image values(img_seq.nextval, '/midterm/images/로컬스티치/4.jpg', 5);
insert into image values(img_seq.nextval, '/midterm/images/로컬스티치/5.jpg', 5);
insert into image values(img_seq.nextval, '/midterm/images/로컬스티치/6.jpg', 5);

insert into image values(img_seq.nextval, '/midterm/images/브리프/1.jpg', 6);
insert into image values(img_seq.nextval, '/midterm/images/브리프/2.PNG', 6);
insert into image values(img_seq.nextval, '/midterm/images/브리프/3.jpg', 6);
insert into image values(img_seq.nextval, '/midterm/images/브리프/4.jpg', 6);
insert into image values(img_seq.nextval, '/midterm/images/브리프/5.jpg', 6);
insert into image values(img_seq.nextval, '/midterm/images/브리프/6.jpg', 6);

insert into image values(img_seq.nextval, '/midterm/images/앤트러사이트/1.jpg', 7);
insert into image values(img_seq.nextval, '/midterm/images/앤트러사이트/2.jpg', 7);
insert into image values(img_seq.nextval, '/midterm/images/앤트러사이트/3.jpg', 7);
insert into image values(img_seq.nextval, '/midterm/images/앤트러사이트/4.jpg', 7);
insert into image values(img_seq.nextval, '/midterm/images/앤트러사이트/5.jpg', 7);
insert into image values(img_seq.nextval, '/midterm/images/앤트러사이트/6.jpg', 7);

insert into image values(img_seq.nextval, '/midterm/images/어니언/1.JPG', 8);
insert into image values(img_seq.nextval, '/midterm/images/어니언/2.JPG', 8);
insert into image values(img_seq.nextval, '/midterm/images/어니언/3.JPG', 8);
insert into image values(img_seq.nextval, '/midterm/images/어니언/4.JPG', 8);
insert into image values(img_seq.nextval, '/midterm/images/어니언/5.JPG', 8);
insert into image values(img_seq.nextval, '/midterm/images/어니언/6.JPG', 8);

insert into image values(img_seq.nextval, '/midterm/images/테라로사/1.JPG', 9);
insert into image values(img_seq.nextval, '/midterm/images/테라로사/2.JPG', 9);
insert into image values(img_seq.nextval, '/midterm/images/테라로사/3.JPG', 9);
insert into image values(img_seq.nextval, '/midterm/images/테라로사/4.JPG', 9);
insert into image values(img_seq.nextval, '/midterm/images/테라로사/5.JPG', 9);
insert into image values(img_seq.nextval, '/midterm/images/테라로사/6.JPG', 9);

insert into image values(img_seq.nextval, '/midterm/images/폴키/1.JPG', 10);
insert into image values(img_seq.nextval, '/midterm/images/폴키/2.JPG', 10);
insert into image values(img_seq.nextval, '/midterm/images/폴키/3.JPG', 10);
insert into image values(img_seq.nextval, '/midterm/images/폴키/4.JPG', 10);
insert into image values(img_seq.nextval, '/midterm/images/폴키/5.JPG', 10);
insert into image values(img_seq.nextval, '/midterm/images/폴키/6.JPG', 10);

insert into image values(img_seq.nextval, '/midterm/images/호시담/1.jpg', 11);
insert into image values(img_seq.nextval, '/midterm/images/호시담/2.jpg', 11);
insert into image values(img_seq.nextval, '/midterm/images/호시담/3.jpg', 11);
insert into image values(img_seq.nextval, '/midterm/images/호시담/4.PNG', 11);
insert into image values(img_seq.nextval, '/midterm/images/호시담/5.jpg', 11);
insert into image values(img_seq.nextval, '/midterm/images/호시담/6.PNG', 11);

commit;