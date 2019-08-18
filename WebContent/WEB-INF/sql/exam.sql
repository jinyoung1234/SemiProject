


create table member(  
  member_id varchar2(50) primary key,
  member_password varchar2(50) not null,
  member_name varchar2(50) not null,
  member_phone_number varchar2(50) not null,
  member_email varchar2(50) not null, 
  member_point number(10) not null
)
/*
 * drop table member
INSERT INTO member VALUES('jang', '1111', '김장규', '010-1234-1234', 'jang@naver.com', 2000);
INSERT INTO member VALUES('jinwoo', '1111', '이진우', '010-3434-3434', 'jw@naver.com', 2000);
INSERT INTO member VALUES('juhyun', '1111', '이주현', '010-9999-8888', 'juhyun2@naver.com', 2000);
INSERT INTO member VALUES('ljy', '1111', '이진영', '010-4546-8787', 'jinyoung@naver.com', 2000);
INSERT INTO member VALUES('hyung', '1111', '김형주', '010-5555-6666', 'hj@naver.com', 2000);
DELETE FROM member;



select* from member


INSERT INTO house VALUES('001', '호텔', '판교호텔', '성남', 80000);
INSERT INTO house VALUES('002', '모텔', '고급모텔', '수원', 30000);
INSERT INTO house VALUES('003', '펜션', '행복펜션', '제주', 80000);
INSERT INTO house VALUES('004', '펜션', '럭키펜션', '강릉', 80000);
INSERT INTO house VALUES('005', '호텔', '예스호텔', '서울', 80000);
INSERT INTO house VALUES('006', '모텔', '행운모텔', '안양', 80000);
INSERT INTO house VALUES('007', '모텔', '동쪽모텔', '동해', 80000);
INSERT INTO house VALUES('020', '모텔', '시흥모텔', '시흥', 90000);
INSERT INTO house VALUES('021', '모텔', '홍시모텔', '시흥', 11000);
INSERT INTO house VALUES('011', '모텔', '홍시모텔', '시흥', 11000);
INSERT INTO house VALUES('012', '모텔', '홍시모텔', '시흥', 11000);
DELETE FROM house;
drop table house

select rent_no.nextval from dual
drop sequence rent_no;

insert into Reservation values(rent_no.nextval,to_date('20031201', 'yyyy-mm-dd'),to_date('20040101', 'yyyy-mm-dd'),to_date('20050101102030', 'yyyy-mm-dd-hh-mi-ss'),'jang','001');
insert into Reservation values(rent_no.nextval,to_date('20040501', 'yyyy-mm-dd'),to_date('20070301', 'yyyy-mm-dd'),to_date('20030101402030', 'yyyy-mm-dd-hh-mi-ss'),'jinwoo','002');
insert into Reservation values(rent_no.nextval,to_date('20050501', 'yyyy-mm-dd'),to_date('20050801', 'yyyy-mm-dd'),to_date('20040101302030', 'yyyy-mm-dd-hh-mi-ss'),'juhyun','003');
insert into Reservation values(rent_no.nextval,to_date('20040105', 'yyyy-mm-dd'),to_date('20040801', 'yyyy-mm-dd'),to_date('20050101101030', 'yyyy-mm-dd-hh-mi-ss'),'hyung','004');
insert into Reservation values(rent_no.nextval,to_date('20030101', 'yyyy-mm-dd'),to_date('20040601', 'yyyy-mm-dd'),to_date('20040101204030', 'yyyy-mm-dd-hh-mi-ss'),'ljy','005');

insert into Reservation values(rent_no.nextval,to_date('20160801', 'yyyy-mm-dd'),to_date('20160803', 'yyyy-mm-dd'),to_date('20160405102155', 'yyyy-mm-dd-hh-mi-ss'),'juhyun','003');
insert into Reservation values(rent_no.nextval,to_date('20160804', 'yyyy-mm-dd'),to_date('20160805', 'yyyy-mm-dd'),to_date('20160405102543', 'yyyy-mm-dd-hh-mi-ss'),'juhyun','006');

	
	
	DELETE FROM picture
INSERT INTO picture VALUES (1, 'pic1.jpg', '001'); --판교호텔 사진들
INSERT INTO picture VALUES (2, 'pic2.jpg', '001');
INSERT INTO picture VALUES (3, 'pic3.jpg', '001'); 
INSERT INTO picture VALUES (4, 'pic1.jpg', '002'); --고급모텔 사진들 
INSERT INTO picture VALUES (5, 'pic2.jpg', '002');
INSERT INTO picture VALUES (6, 'pic3.jpg', '002');
INSERT INTO picture VALUES (21, 'C:\Users\jin\Desktop\paykyb-8er8-ian-schneider.jpg', '011');
delete from picture where house_id=21 (22, 'C:\Users\jin\Desktop\paykyb-8er8-ian-schneider.jpg', '021');
INSERT INTO picture VALUES (23, 'C:\Users\jin\Desktop\paykyb-8er8-ian-schneider.jpg', '021');

INSERT INTO picture VALUES (50, 'images/h1_main.jpg', '011');
INSERT INTO picture VALUES (51, 'images/h2_main.jpg', '012');


select *
from member;
delete from member
where member_id='java'
*/
INSERT INTO house VALUES('001', '호텔', '판교호텔', '서울', 80000);
INSERT INTO house VALUES('002', '펜션', '고급펜션', '수원', 35000);
INSERT INTO house VALUES('003', '호텔', '행복호텔', '서울', 85000);
INSERT INTO house VALUES('004', '호텔', '럭키호텔', '서울', 83000);
INSERT INTO house VALUES('005', '호텔', '예스호텔', '서울', 82000);
INSERT INTO house VALUES('006', '펜션', '행운펜션', '수원', 87000);
INSERT INTO house VALUES('007', '호텔', '동쪽호텔', '서울', 91000);
INSERT INTO house VALUES('008', '펜션', '시흥펜션', '수원', 92000);
INSERT INTO house VALUES('009', '펜션', '홍시펜션', '수원', 120000);
INSERT INTO house VALUES('010', '모텔', '홍시모텔', '시흥', 31000);
INSERT INTO house VALUES('011', '펜션', '홍시펜션', '시흥', 81000);

INSERT INTO house VALUES('012', '펜션', '진우펜션', '수원', 83000);
INSERT INTO house VALUES('013', '모텔', '고급모텔', '시흥', 80000);
INSERT INTO house VALUES('014', '모텔', '행복모텔', '시흥', 88000);
INSERT INTO house VALUES('015', '호텔', '럭키호텔', '서울', 81500);
INSERT INTO house VALUES('016', '모텔', '예모텔', '시흥', 61000);
INSERT INTO house VALUES('017', '모텔', '행운모텔', '시흥', 52000);
INSERT INTO house VALUES('018', '모텔', '동쪽모텔', '시흥', 53000);
INSERT INTO house VALUES('019', '모텔', '시흥모텔', '시흥', 64000);






--새로 추가
INSERT INTO house VALUES('020', '모텔', '진영모텔', '시흥', 10000);--
INSERT INTO house VALUES('021', '호텔', '진우호텔', '서울', 111000);
INSERT INTO house VALUES('022', '모텔', '지누모텔', '수원', 211000); --
INSERT INTO house VALUES('023', '모텔', '지녕모텔', '시흥', 191000);  --
INSERT INTO house VALUES('024', '호텔', '설호텔',  '서울', 110000);
INSERT INTO house VALUES('025', '호텔', '고양호텔', '서울', 110000);
INSERT INTO house VALUES('026', '모텔', '시흉모텔', '시흥', 110000);--
INSERT INTO house VALUES('027', '호텔', '지누호텔', '서울', 110000);
INSERT INTO house VALUES('028', '펜션', '지녕펜션', '수원', 140000);
INSERT INTO house VALUES('029', '펜션', '병문펜션', '수원', 130000);
INSERT INTO house VALUES('030', '펜션', '승헌펜션', '수원', 115000);
INSERT INTO house VALUES('031', '모텔', '신모텔', '시흥', 91000);--
INSERT INTO house VALUES('032', '호텔', '장규호텔', '서울', 95000);
INSERT INTO house VALUES('033', '모텔', '형주모텔', '시흥', 81000);--
INSERT INTO house VALUES('034', '펜션', '형주펜션', '수원', 81000);
INSERT INTO house VALUES('035', '모텔', '주현모텔', '시흥', 81000);--
INSERT INTO house VALUES('036', '펜션', '주현펜션', '수원', 82000);
INSERT INTO house VALUES('037', '모텔', '장규모텔', '시흥', 85000);--
INSERT INTO house VALUES('038', '펜션', '고양펜션', '수원', 51000);
INSERT INTO house VALUES('039', '모텔', '형주모텔', '시흥', 41000);--
INSERT INTO house VALUES('040', '모텔', '진광모텔', '시흥', 61000);--
INSERT INTO house VALUES('041', '모텔', '고양모텔', '시흥', 61000);--
INSERT INTO house VALUES('042', '모텔', '감모텔', '시흥', 61000);--
INSERT INTO house VALUES('043', '펜션', '한솔펜션', '수원', 51000);
INSERT INTO house VALUES('044', '호텔', '주현호텔', '서울', 51000);
INSERT INTO house VALUES('045', '모텔', '병문모텔', '시흥', 51000);--
INSERT INTO house VALUES('046', '호텔', '영현호텔', '서울', 160000);
INSERT INTO house VALUES('047', '호텔', '동준호텔', '서울', 120000);
INSERT INTO house VALUES('048', '모텔', '준모텔', '시흥', 61000);
INSERT INTO house VALUES('049', '호텔', '형주호텔', '서울', 110000);
INSERT INTO house VALUES('050', '서울', '진광호텔', '서울', 170000);--
INSERT INTO house VALUES('051', '모텔', '한솔모텔', '시흥', 100000);--

INSERT INTO house VALUES('052', '호텔', '진광호텔', '서울', 180000);--
INSERT INTO house VALUES('053', '호텔', '영현호텔', '서울', 190000);--
INSERT INTO house VALUES('054', '호텔', '동준호텔', '서울', 90000);--
INSERT INTO house VALUES('055', '호텔', '새롬호텔', '서울', 115000);--
INSERT INTO house VALUES('056', '호텔', '민희호텔', '서울', 270000);--
INSERT INTO house VALUES('057', '호텔', '진현호텔', '서울', 200000);--
INSERT INTO house VALUES('058', '호텔', '진우호텔', '서울', 210000);--
INSERT INTO house VALUES('059', '호텔', '주현호텔', '서울', 185000);--
INSERT INTO house VALUES('060', '호텔', '장규호텔', '서울', 155000);--
	
INSERT INTO picture VALUES (1, 'images/h1_main.jpg', '001'); --판교호텔 사진들
INSERT INTO picture VALUES (2, 'images/h2_main.jpg', '001');
INSERT INTO picture VALUES (3, 'images/h3_main.jpg', '001'); 
INSERT INTO picture VALUES (4, 'images/h4_main.jpg', '002'); --고급모텔 사진들 
INSERT INTO picture VALUES (5, 'images/h5_main.jpg', '002');
INSERT INTO picture VALUES (6, 'images/m1_main.jpg', '002');
INSERT INTO picture VALUES (7, 'images/m2_main.jpg', '011');
INSERT INTO picture VALUES (8, 'images/m3_main.jpg', '021');
INSERT INTO picture VALUES (9, 'images/m4_main.jpg', '021');

INSERT INTO picture VALUES (10, 'images/m5_main.jpg', '011');
INSERT INTO picture VALUES (11, 'images/p1_main.jpg', '012');

INSERT INTO picture VALUES (12, 'images/p2_main.jpg', '001'); --판교호텔 사진들
INSERT INTO picture VALUES (13, 'images/p3_main.jpg', '001');
INSERT INTO picture VALUES (14, 'images/p4_main.jpg', '001'); 
INSERT INTO picture VALUES (15, 'images/p5_main.jpg', '002'); --고급모텔 사진들 
INSERT INTO picture VALUES (16, 'images/p6_main.jpg', '002');
INSERT INTO picture VALUES (17, 'images/p7_main.jpg', '002');
INSERT INTO picture VALUES (18, 'images/p8_main.jpg', '011');
INSERT INTO picture VALUES (19, 'images/p9_main.jpg', '021');




INSERT INTO picture VALUES (20, 'images/m6_main.jpg','020');
INSERT INTO picture VALUES (21, 'images/h6_main.jpg','021');
INSERT INTO picture VALUES (22, 'images/m7_main.jpg','022');
INSERT INTO picture VALUES (23, 'images/m8_main.jpg','023');
INSERT INTO picture VALUES (24, 'images/h7_main.jpg','024');
INSERT INTO picture VALUES (25, 'images/h8_main.jpg','025');
INSERT INTO picture VALUES (26, 'images/m9_main.jpg','026');
INSERT INTO picture VALUES (27, 'images/h9_main.jpg','027');
INSERT INTO picture VALUES (28, 'images/p10_main.jpg','028');
INSERT INTO picture VALUES (29, 'images/p11_main.jpg','029');
INSERT INTO picture VALUES (30, 'images/p12_main.jpg','030');
INSERT INTO picture VALUES (31, 'images/m10_main.jpg','031');
INSERT INTO picture VALUES (32, 'images/h10_main.jpg','032');
INSERT INTO picture VALUES (33, 'images/m11_main.jpg','033');
INSERT INTO picture VALUES (34, 'images/p13_main.jpg','034');
INSERT INTO picture VALUES (35, 'images/m12_main.jpg','035');
INSERT INTO picture VALUES (36, 'images/p14_main.jpg','036');
INSERT INTO picture VALUES (37, 'images/m13_main.jpg','037');
INSERT INTO picture VALUES (38, 'images/p15_main.jpg','038');
INSERT INTO picture VALUES (39, 'images/m14_main.jpg','039');
INSERT INTO picture VALUES (40, 'images/m15_main.jpg','040');
INSERT INTO picture VALUES (41, 'images/m16_main.jpg','041');
INSERT INTO picture VALUES (42, 'images/m17_main.jpg','042');
INSERT INTO picture VALUES (43, 'images/p16_main.jpg','043');
INSERT INTO picture VALUES (44, 'images/h11_main.jpg','044');
INSERT INTO picture VALUES (45, 'images/m18_main.jpg','045');
INSERT INTO picture VALUES (46, 'images/h12_main.jpg','046');
INSERT INTO picture VALUES (47, 'images/h13_main.jpg','047');
INSERT INTO picture VALUES (48, 'images/m19_main.jpg','048');
INSERT INTO picture VALUES (49, 'images/h14_main.jpg','049');
INSERT INTO picture VALUES (50, 'images/p17_main.jpg','050');--p17 m19 h14

INSERT INTO picture VALUES (51, 'images/h15_main.jpg','052');
INSERT INTO picture VALUES (52, 'images/h16_main.jpg','053');
INSERT INTO picture VALUES (53, 'images/h17_main.jpg','054');
INSERT INTO picture VALUES (54, 'images/h18_main.jpg','055');
INSERT INTO picture VALUES (55, 'images/h19_main.jpg','056');
INSERT INTO picture VALUES (56, 'images/h20_main.jpg','057');
INSERT INTO picture VALUES (57, 'images/h21_main.jpg','058');
INSERT INTO picture VALUES (58, 'images/h22_main.jpg','059');
INSERT INTO picture VALUES (59, 'images/h23_main.jpg','060');--p17 m19 h24


--디테일 사진 no100부터

INSERT INTO picture VALUES (100, 'images/h1_d1.jpg','001');
INSERT INTO picture VALUES (101, 'images/h1_d2.jpg','001');
INSERT INTO picture VALUES (102, 'images/h1_d3.jpg','001');
delete from picture where picture_no=102;
INSERT INTO picture VALUES (103, 'images/h2_d1.jpg','003');
INSERT INTO picture VALUES (104, 'images/h2_d2.jpg','003');
INSERT INTO picture VALUES (105, 'images/h2_d3.jpg','003');

INSERT INTO picture VALUES (106, 'images/m1_d1.jpg','010');
INSERT INTO picture VALUES (107, 'images/m1_d2.jpg','010');
INSERT INTO picture VALUES (108, 'images/m1_d3.jpg','010');

INSERT INTO picture VALUES (109, 'images/m2_d1.jpg','013');
INSERT INTO picture VALUES (110, 'images/m2_d2.jpg','013');
INSERT INTO picture VALUES (111, 'images/m2_d3.jpg','013');

INSERT INTO picture VALUES (112, 'images/p1_d1.jpg','002');
INSERT INTO picture VALUES (113, 'images/p1_d2.jpg','002');

INSERT INTO picture VALUES (114, 'images/p2_d1.jpg','006');
INSERT INTO picture VALUES (115, 'images/p2_d2.jpg','006');INSERT INTO picture VALUES (1, 'images/h1_main.jpg', '001'); --판교호텔 사진들
INSERT INTO picture VALUES (2, 'images/h2_main.jpg', '001');
INSERT INTO picture VALUES (3, 'images/h3_main.jpg', '001'); 
INSERT INTO picture VALUES (4, 'images/h4_main.jpg', '002'); --고급모텔 사진들 
INSERT INTO picture VALUES (5, 'images/h5_main.jpg', '002');
INSERT INTO picture VALUES (6, 'images/m1_main.jpg', '002');
INSERT INTO picture VALUES (7, 'images/m2_main.jpg', '011');
INSERT INTO picture VALUES (8, 'images/m3_main.jpg', '021');
INSERT INTO picture VALUES (9, 'images/m4_main.jpg', '021');

INSERT INTO picture VALUES (10, 'images/m5_main.jpg', '011');
INSERT INTO picture VALUES (11, 'images/p1_main.jpg', '012');

INSERT INTO picture VALUES (12, 'images/p2_main.jpg', '001'); --판교호텔 사진들
INSERT INTO picture VALUES (13, 'images/p3_main.jpg', '001');
INSERT INTO picture VALUES (14, 'images/p4_main.jpg', '001'); 
INSERT INTO picture VALUES (15, 'images/p5_main.jpg', '002'); --고급모텔 사진들 
INSERT INTO picture VALUES (16, 'images/p6_main.jpg', '002');
INSERT INTO picture VALUES (17, 'images/p7_main.jpg', '002');
INSERT INTO picture VALUES (18, 'images/p8_main.jpg', '011');
INSERT INTO picture VALUES (19, 'images/p9_main.jpg', '021');




INSERT INTO picture VALUES (20, 'images/m6_main.jpg','020');
INSERT INTO picture VALUES (21, 'images/h6_main.jpg','021');
INSERT INTO picture VALUES (22, 'images/m7_main.jpg','022');
INSERT INTO picture VALUES (23, 'images/m8_main.jpg','023');
INSERT INTO picture VALUES (24, 'images/h7_main.jpg','024');
INSERT INTO picture VALUES (25, 'images/h8_main.jpg','025');
INSERT INTO picture VALUES (26, 'images/m9_main.jpg','026');
INSERT INTO picture VALUES (27, 'images/h9_main.jpg','027');
INSERT INTO picture VALUES (28, 'images/p10_main.jpg','028');
INSERT INTO picture VALUES (29, 'images/p11_main.jpg','029');
INSERT INTO picture VALUES (30, 'images/p12_main.jpg','030');
INSERT INTO picture VALUES (31, 'images/m10_main.jpg','031');
INSERT INTO picture VALUES (32, 'images/h10_main.jpg','032');
INSERT INTO picture VALUES (33, 'images/m11_main.jpg','033');
INSERT INTO picture VALUES (34, 'images/p13_main.jpg','034');
INSERT INTO picture VALUES (35, 'images/m12_main.jpg','035');
INSERT INTO picture VALUES (36, 'images/p14_main.jpg','036');
INSERT INTO picture VALUES (37, 'images/m13_main.jpg','037');
INSERT INTO picture VALUES (38, 'images/p15_main.jpg','038');
INSERT INTO picture VALUES (39, 'images/m14_main.jpg','039');
INSERT INTO picture VALUES (40, 'images/m15_main.jpg','040');
INSERT INTO picture VALUES (41, 'images/m16_main.jpg','041');
INSERT INTO picture VALUES (42, 'images/m17_main.jpg','042');
INSERT INTO picture VALUES (43, 'images/p16_main.jpg','043');
INSERT INTO picture VALUES (44, 'images/h11_main.jpg','044');
INSERT INTO picture VALUES (45, 'images/m18_main.jpg','045');
INSERT INTO picture VALUES (46, 'images/h12_main.jpg','046');
INSERT INTO picture VALUES (47, 'images/h13_main.jpg','047');
INSERT INTO picture VALUES (48, 'images/m19_main.jpg','048');
INSERT INTO picture VALUES (49, 'images/h14_main.jpg','049');
INSERT INTO picture VALUES (50, 'images/p17_main.jpg','050');--p17 m19 h14

INSERT INTO picture VALUES (51, 'images/h15_main.jpg','052');
INSERT INTO picture VALUES (52, 'images/h16_main.jpg','053');
INSERT INTO picture VALUES (53, 'images/h17_main.jpg','054');
INSERT INTO picture VALUES (54, 'images/h18_main.jpg','055');
INSERT INTO picture VALUES (55, 'images/h19_main.jpg','056');
INSERT INTO picture VALUES (56, 'images/h20_main.jpg','057');
INSERT INTO picture VALUES (57, 'images/h21_main.jpg','058');
INSERT INTO picture VALUES (58, 'images/h22_main.jpg','059');
INSERT INTO picture VALUES (59, 'images/h23_main.jpg','060');--p17 m19 h24


--디테일 사진 no100부터

INSERT INTO picture VALUES (100, 'images/h1_d1.jpg','001');
INSERT INTO picture VALUES (101, 'images/h1_d2.jpg','001');
INSERT INTO picture VALUES (102, 'images/h1_d3.jpg','001');
delete from picture where picture_no=102;
INSERT INTO picture VALUES (103, 'images/h2_d1.jpg','003');
INSERT INTO picture VALUES (104, 'images/h2_d2.jpg','003');
INSERT INTO picture VALUES (105, 'images/h2_d3.jpg','003');

INSERT INTO picture VALUES (106, 'images/m1_d1.jpg','010');
INSERT INTO picture VALUES (107, 'images/m1_d2.jpg','010');
INSERT INTO picture VALUES (108, 'images/m1_d3.jpg','010');

INSERT INTO picture VALUES (109, 'images/m2_d1.jpg','013');
INSERT INTO picture VALUES (110, 'images/m2_d2.jpg','013');
INSERT INTO picture VALUES (111, 'images/m2_d3.jpg','013');

INSERT INTO picture VALUES (112, 'images/p1_d1.jpg','002');
INSERT INTO picture VALUES (113, 'images/p1_d2.jpg','002');

INSERT INTO picture VALUES (114, 'images/p2_d1.jpg','006');
INSERT INTO picture VALUES (115, 'images/p2_d2.jpg','006');

	
*/
create table house(
 house_id  varchar2(10) primary key,
 house_type varchar2(10) not null,
 house_name varchar2(50) not null,
 house_location varchar2(50) not null,
 house_price number(20) not null
 )





create table Reservation(
   rent_no	 number(8) primary key,
   start_rent_date Date not null,
   end_rent_date Date not null,
   rent_time Date not null,
   member_id varchar2(50) ,
   house_id varchar2(10) ,
  constraint R_member_id_fk foreign key(member_id) references member,
  constraint R_house_id_fk foreign key(house_id) references house
)




create sequence rent_no increment by 1 start with 1;




create table picture(
   picture_no number(20) primary key,   
   picture_name varchar2(50) not null,
   house_id varchar2(10),
   constraint P_house_id_fk foreign key(house_id) references house
)


