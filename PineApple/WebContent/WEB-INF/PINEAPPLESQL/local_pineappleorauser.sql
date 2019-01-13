-- 계정 생성
create user pineappleorauser identified by eclass
default tablespace users;

-- 계정 권한 부여
grant connect, resource, unlimited tablespace, create view to pineappleorauser;

-- 계정 삭제
drop user pineappleorauser cascade;
 
-- 계정 조회
show user;

-- 모든 테이블 조회
select * from user_tables;

-- 모든 시퀀스 조회
select * from user_sequences;

-- 모든 제약조건 조회
select * from user_constraints;

-- 테이블 삭제 명령문
drop table pa_usergrade purge;
drop table pa_user purge;
drop table pa_category purge;
drop table pa_brand purge;
drop table pa_material purge;
drop table pa_product purge;
drop table pa_cartList purge;

-- 시퀀스 삭제 명령문
drop sequence seq_pa_usergrade_idx;
drop sequence seq_pa_user_idx;
drop sequence seq_pa_category_idx;
drop sequence seq_pa_brand_idx;
drop sequence seq_pa_material_idx;
drop sequence seq_pa_product_idx;
drop sequence seq_pa_cartList_cartNo;


-- ***** ////////////////////////////////////////////////// pa_usergrade ////////////////////////////////////////////////// ***** --

-- pa_usergrade 테이블 생성
create table pa_usergrade
(gradeCode     varchar2(30) not null         -- 등급코드 => 0(grade_code) : 브론즈(grade_name), 1 : 실버, 2 : 골드, 3 : 플래티넘, 4 : 다이아
,idx           number not null               -- 시퀀스
,gradeName     varchar2(20) not null         -- 등급이름
,gradePercent  number(10) default 0 not null -- 할인율 
,gradePoint    number(10) default 0 not null -- 적립율 
,minPurPrice   number(10)                    -- 최저누적구매금액
,maxPurPrice   number(10)                    -- 최대누적구매금액
,constraint PK_pa_usergrade_gradeCode primary key(gradeCode)
,constraint CK_pa_usergrade_gradeCode check( gradeCode in(0,1,2,3,4) )
);

-- seq_pa_usergrade_idx 시퀀스 생성
create sequence seq_pa_usergrade_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_usergrade(gradeCode, idx, gradeName, gradePercent, gradePoint, minPurPrice, maxPurPrice)
values(0, seq_pa_usergrade_idx.nextval, '브론즈', 5, 5, 0, 2000000);

insert into pa_usergrade(gradeCode, idx, gradeName, gradePercent, gradePoint, minPurPrice, maxPurPrice)
values(1, seq_pa_usergrade_idx.nextval, '실버', 10, 10, 2000000,3500000);

insert into pa_usergrade(gradeCode, idx, gradeName, gradePercent, gradePoint, minPurPrice, maxPurPrice)
values(2, seq_pa_usergrade_idx.nextval, '골드', 15, 15, 3500000,5000000);

insert into pa_usergrade(gradeCode, idx, gradeName, gradePercent, gradePoint, minPurPrice, maxPurPrice)
values(3, seq_pa_usergrade_idx.nextval, '플레티넘', 20, 20, 5000000,7000000);

insert into pa_usergrade(gradeCode, idx, gradeName, gradePercent, gradePoint, minPurPrice, maxPurPrice)
values(4, seq_pa_usergrade_idx.nextval, '다이아', 25, 25, 7000000, 999999999);

commit;


-- ***** ////////////////////////////////////////////////// pa_user ////////////////////////////////////////////////// ***** --

-- pa_user 테이블 생성
create table pa_user 
(userid             varchar2(20) not null           -- 아이디 
,gradeCode_fk       varchar2(30) default 0 not null -- 등급코드(FK)
,idx                number not null                 -- 시퀀스
,pwd                varchar2(200) not null          -- 비밀번호(단방향 암호화)
,name               nvarchar2(30) not null          -- 이름 
,email              varchar2(200) not null          -- 이메일(양방향 암호화) 
,phone              varchar2(200) not null          -- 핸드폰 번호(양방향 암호화)
,post               varchar2(10) not null           -- 우편번호(신주소) 
,addr               varchar2(200) not null          -- 주소 
,addrDetail         varchar2(300)                   -- 상세주소 
,birth              varchar2(8) not null            -- 생년월일 
,gender             char(1) not null                -- 성별 => 0 : 남자, 1 : 여자 
,sumTotalPoint      number default 0 not null       -- 누적적립금 
,sumPurchasePrice   number default 0 not null       -- 누적구매금액 
,lastLoginDate      date default sysdate not null   -- 마지막 로그인 날짜 
,lastPwdChangeDate  date default sysdate not null   -- 비밀번호변경 날짜 
,registDate         date default sysdate not null   -- 가입일자 
,uAuth              number(1) default 0 not null    -- 사용자 권한 => 0 : 일반회원, 5 : 관리자
,status             number(1) default 0 not null    -- 회원상태 => 0 : 활동중, 1 : 휴면, 2 : 탈퇴                                                                                           
,constraint PK_pa_user_userid primary key(userid)              
,constraint FK_pa_user_fk_grade_code foreign key(gradeCode_fk)
                                        references pa_usergrade(gradeCode)
,constraint CK_pa_user_gender check( gender in(0,1) )
,constraint CK_pa_user_u_auth check( uAuth in(0,5) )
,constraint CK_pa_user_status check( status in(0,1,2) ) 
);

-- seq_pa_user_idx 시퀀스 생성
create sequence seq_pa_user_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_user(userid, gradeCode_fk, idx, pwd, name, email, phone, post, addr, addrDetail, birth, gender, sumTotalPoint, sumPurchasePrice, lastLoginDate, lastPwdChangeDate, registDate, uAuth, status)
values('admin', '0', seq_pa_user_idx.nextval, '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382', '관리자', 'mKW69GEk/R5zCOpWmnCDNQ==', 'WXEtv3m1lrlkG5cjo8kbMw==', '06267', '서울 강남구 강남대로 246', '505호', '1975612', '1', default, default, default, default, default, '5', default);

commit;


-- ***** ////////////////////////////////////////////////// pa_category ////////////////////////////////////////////////// ***** --

-- pa_category 테이블 생성
create table pa_category
(idx     number(8)     not null  -- 카테고리 대분류 번호
,categoryCode    varchar2(20)  not null  -- 카테고리 코드
,categoryName   varchar2(100) not null  -- 카테고리명
,constraint PK_pa_category_idx primary key(idx)
,constraint UQ_pa_category_categoryCode unique(categoryCode)
);

-- seq_pa_category_cnum 시퀀스 생성
create sequence seq_pa_category_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_category(idx, categoryCode, categoryName)
values(seq_pa_category_idx.nextval, '100000', '데스크탑');

insert into pa_category(idx, categoryCode, categoryName)
values(seq_pa_category_idx.nextval, '200000', '노트북');

insert into pa_category(idx, categoryCode, categoryName)
values(seq_pa_category_idx.nextval, '300000', '모니터');

insert into pa_category(idx, categoryCode, categoryName)
values(seq_pa_category_idx.nextval, '400000', '주변기기');

commit;


-- ***** ////////////////////////////////////////////////// pa_brand ////////////////////////////////////////////////// ***** --

-- pa_brand 테이블 생성
create table pa_brand 
(brCode    varchar2(50) not null  -- 브랜드 일련번호
,idx       number not null        -- 브랜드 시퀀스 
,brName    varchar2(100) not null -- 브랜드 명 
,constraint PK_pa_brand_brCode primary key(brCode)
);

-- seq_pa_brand_idx 시퀀스 생성
create sequence seq_pa_brand_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_brand(brCode, idx, brName)
values('Br' || seq_pa_brand_idx.nextval, seq_pa_brand_idx.nextval, '삼성전자'); 

insert into pa_brand(brCode, idx, brName)
values('Br' || seq_pa_brand_idx.nextval, seq_pa_brand_idx.nextval, 'LG전자');

commit;


-- ***** ////////////////////////////////////////////////// pa_material ////////////////////////////////////////////////// ***** --

-- pa_material 테이블 생성
create table pa_material
(mtCode        varchar2(50) not null  -- 부품 일련번호 => R1(부품 일련번호) : RAM(부품 명), C1 : CPU, S1 : STORAGE, W1 : OS 
,idx            number not null       -- 부품 시퀀스
,mtName        varchar2(100) not null -- 부품 명
,mtSpec        varchar2(100) not null -- 부품 상세
,mtPrice       number                 -- 부품 가격
,constraint PK_pa_material_mtCode primary key(mtCode) 
);

-- seq_pa_material_idx 시퀀스 생성
create sequence seq_pa_material_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_material(mtCode, idx, mtName, mtSpec, mtPrice)
values('R1', seq_pa_material_idx.nextval, 'RAM', '4GB', 40000); 

insert into pa_material(mtCode, idx, mtName, mtSpec, mtPrice)
values('R2', seq_pa_material_idx.nextval, 'RAM', '8GB', 99000); 

insert into pa_material(mtCode, idx, mtName, mtSpec, mtPrice)
values('S1', seq_pa_material_idx.nextval, 'SSD', '128GB', 59000); 

insert into pa_material(mtCode, idx, mtName, mtSpec, mtPrice)
values('S2', seq_pa_material_idx.nextval, 'SSD', '256GB', 100000);

insert into pa_material(mtCode, idx, mtName, mtSpec, mtPrice)
values('W1', seq_pa_material_idx.nextval, 'Windows', '10', 200000);

commit;


-- ***** ////////////////////////////////////////////////// pa_product ////////////////////////////////////////////////// ***** --

-- pa_product 테이블 생성
create table pa_product  
(idx                number(8) not null                  -- 제품번호(PK)
,categoryCode_fk    varchar2(20)                        -- 카테고리코드(FK)
-- ,subCategoryCode_fk varchar2(20)                     -- 주변기기 카테고리
,brCode_fk          varchar2(50) not null               -- 제조회사 코드 
,brName             varchar2(50)                        -- 제조회사명 
,name               varchar2(100) not null              -- 제품명
,cpu                varchar2(20)                        -- cpu 명
,inch	            varchar2(20)	                    -- INCH code
,ramCode_fk         varchar2(20)                        -- RAM 제품 code(FK)
,ramName            varchar2(50)                        -- RAM 제품 name
,storageCode_fk	    varchar2(20)	                    -- 저장장치 제품 code(FK)
,storageName        varchar2(50)                        -- 저장장치 제품명
,osCode_fk	        varchar2(50)	                    -- 운영체제 제품 code(FK)
,osName             varchar2(50)                        -- 운영체제 제품명
,price              number(8) default 0                 -- 제품 정가
,saleprice          number(8) default 0      	        -- 제품 판매가
,image1             varchar2(100) default 'noimage.png' -- 제품이미지1   이미지파일명
,image2             varchar2(100) default 'noimage.png' -- 제품이미지2   이미지파일명 
,content            clob                                -- 제품설명  varchar2는 varchar2(4000) 최대값이므로 4000 byte 를 초과하는 경우 clob 를 사용한다.                                      
-- ,color              varchar()                           -- 색상
,pqty               number(8) default 0                 -- 제품 재고량
,inputdate          date default sysdate                -- 제품입고일자
,status		        number(1,0) default 0 not null	    -- 제품 상태 => 0 : 판매예정, 1 : 판매중인 상품, 2 : 재고 부족
,constraint PK_pa_product_idx primary key(idx)
,constraint FK_pa_product_categoryCode_fk foreign key(categoryCode_fk)
                                            references pa_category(categoryCode)
,constraint FK_pa_product_pbrandcode_fk foreign key(brCode_fk)
                                            references pa_brand(brCode)                                                
,constraint FK_pa_product_ramcode_fk foreign key(ramCode_fk)
                                        references pa_material(mtCode)
,constraint FK_pa_product_storagecode_fk foreign key(storageCode_fk)
                                            references pa_material(mtCode)                                                  
,constraint FK_pa_product_oscode_fk foreign key(osCode_fk)
                                        references pa_material(mtCode)       
);

-- seq_pa_product_idx 시퀀스 생성
create sequence seq_pa_product_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_product(idx, categoryCode_fk, brCode_fk, brName, name, cpu, inch, ramCode_fk, ramName, storageCode_fk, storageName, osCode_fk, osName, price, saleprice, image1, image2, content, pqty, inputdate, status)
values(seq_pa_product_idx.nextval, '200000', 'Br1', 'LG전자', '올뉴그램', '인텔i5', '15인치', 'R1', '4GB', 'S1', 'SSD 128GB', 'W1', 'Windows10', 1500000, 1000000, 'img1.jpg', 'img2.jpg', 'LG그램 노트북입니다.', 100, default, default);

commit;

select idx
     , (select c.categoryCode from pa_category c, pa_product p where c.categoryCode = p.categoryCode_fk) as categoryCode
     , (select b.brCode from pa_brand b, pa_product p where b.brCode = p.brCode_fk) as brCode
     , name, cpu, inch 
     , (select m.mtName || m.mtSpec from pa_material m, pa_product p where m.mtCode = p.ramCode_fk) as ramNameSpec
     , (select m.mtName || m.mtSpec from pa_material m, pa_product p where m.mtCode = p.storageCode_fk) as storage
     , (select m.mtName || m.mtSpec from pa_material m, pa_product p where m.mtCode = p.osCode_fk) as os
     , price, saleprice, image1, image2, content, pqty, to_char(inputdate, 'YYYY-MM-dd') as inputdate, status
from pa_product
where categoryCode_fk = '200000';


-- ////////////////////////////////////////////////// pa_cartList ////////////////////////////////////////////////// --

-- pa_cartList 테이블 생성
create table pa_cartList 
(cartNo number not null -- 장바구니 번호(PK)
,fk_userid varchar2(20) not null -- 아이디(FK)
,fk_pnum number not null -- 제품번호(FK?????) 
,oqty number not null -- 주문 수량 
,ramOption varchar2(50) not null
,ssdOption varchar2(50) not null
,windowOption varchar2(50) not null
,constraint PK_pa_cartList primary key(cartNo)              
,constraint FK_pa_cartList_fk_userid foreign key(fk_userid)
                                        references  pa_user(userid)
,constraint FK_pa_cartList_fk_pnum foreign key(fk_pnum)
                                    references pa_product(idx)
);

--  시퀀스 생성
create sequence seq_pa_cartList_cartNo
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


insert into pa_cartList(cartNo, fk_userid, fk_pnum, oqty, ramOption, ssdOption, windowOption)
values(seq_pa_cartList_cartNo.nextval, 'hongkd', 1, 1, 'R2', 'S1', 'W1');

commit;

select cartno, fk_userid, fk_pnum, oqty, ramoption, ssdoption, windowoption, gradecode_fk, A.name, brname, P.name, cpu, inch, ramname, storagename, osname, price, saleprice, image1, pqty, status
from
(select cartno, fk_userid, fk_pnum,oqty, ramoption, ssdoption, windowoption, gradecode_fk, name
from pa_cartList C join pa_user U
on C.fk_userid = U.userid) A join pa_product P
on A.fk_pnum = P.idx













































---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ////////////////////////////////////////////////// pa_pc(이후부터 불안정한 생성) ////////////////////////////////////////////////// --

-- pa_pc 테이블 생성
create table pa_pc 
(pc_code            varchar2(50) not null -- pc 코드
,idx                number not null -- pc 시퀀스
,pc_name            varchar2(200) not null -- pc 명
,pc_content         nvarchar2(2000) -- pc 설명
,pc_image           varchar2(200) not null -- pc 이미지
,pc_br_name         varchar2(100) not null -- pc 브랜드(FK?????)
,pc_cpu_code        varchar2(100) not null -- pc CPU(FK?????)
,pc_ram_code        varchar2(100) default '부품시퀀스?????' not null -- pc RAM(FK?????)
,pc_storage_code    varchar2(100) default '부품시퀀스?????' not null -- pc 저장장치(FK?????)
,pc_os_code         varchar2(100) default '부품시퀀스?????' not null -- pc 운영체제(FK?????) => 0 : 미포함, 1 : 포함
,pc_price           number not null -- pc 정가
,pc_pqty            number not null -- pc 재고
,pc_registerDate    date default sysdate not null -- pc 등록일자
,pc_status          number(1) default 0 not null -- pc 상태 => 0 : 판매예정, 1 : 판매중인 상품, 2 : 재고 부족
,constraint PK_pa_pc_pc_idx primary key(pc_idx) 
);

-- pa_pc 시퀀스 생성
create sequence seq_pa_pc_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_pc(pc_idx, pc_name, pc_content, pc_image, pc_br_name, pc_cpu_code, pc_ram_code, pc_storage_code, pc_os_code, pc_price, pc_pqty, pc_registerDate, pc_status)
values();


-- ////////////////////////////////////////////////// pa_notebook(수정요) ////////////////////////////////////////////////// --

-- pa_notebook 테이블 생성
create table pa_notebook
(notebook_code          varchar2(50) not null -- 노트북 코드
,idx                    number not null -- 노트북 시퀀스
,notebook_name          varchar2(200) not null -- 노트북 명
,notebook_content       nvarchar2(2000) -- 노트북 설명
,notebook_image         varchar2(200) not null -- 노트북 이미지
,notebook_br_name       varchar2(100) not null -- 노트북 브랜드 일련번호(FK)
,notebook_cpu_code      varchar2(100) not null -- 노트북 CPU(FK)
,notebook_inch          varchar2(200) not null -- 노트북 상품 화면크기
,notebook_ram_code      varchar2(100) not null -- 노트북 RAM(FK?????)
,notebook_storage_code  varchar2(100) not null -- 노트북 저장장치(FK?????)
,notebook_os_code       varchar2(100) not null -- notebook_code 운영체제(FK?????) => 0 : 미포함, 1 : 포함
,notebook_price         number not null -- notebook_code 정가
,notebook_pqty          number not null -- notebook_code 재고
,notebook_registerDate  date default sysdate not null -- notebook_code 등록일자
,notebook_status        number(1) default 0 not null -- notebook_code 상태 => 0 : 판매예정, 1 : 판매중인 상품, 2 : 재고 부족
,constraint PK_pa_notebook_notebook_code primary key(notebook_code) 
);

--  시퀀스 생성
create sequence seq_pa_notebook_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert



-- ////////////////////////////////////////////////// pa_monitor(이후부터 불안정한 생성) ////////////////////////////////////////////////// --

-- pa_monitor 테이블 생성
create table pa_monitor
(monitor_code           varchar2(50) not null -- monitor_code 코드(PK)
,idx                    number not null -- 모니터 시퀀스
,monitor_name           varchar2(200) not null -- 모니터 명
,monitor_content        nvarchar2(2000) -- 모니터 상세 설명
,monitor_image          varchar2(200) not null -- pc 이미지
,monitor_br_name        varchar2(100) not null -- 모니터 브랜드(FK?????)
,monitor_inch           varchar2(200) not null -- 모니터 화면크기
,monitor_price          number not null -- 모니터 정가
,monitor_pqty           number not null -- 모니터 재고
,monitor_registerDate   date default sysdate not null -- 모니터 등록일자
,monitor_status         number(1) default 0 not null -- 모니터 상태 => 0 : 판매예정, 1 : 판매중인 상품, 2 : 재고 부족
,constraint PK_pa_monitor_monitor_code primary key(monitor_code) 
);

-- seq_pa_monitor_idx 시퀀스 생성
create sequence seq_pa_monitor_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert



-- ////////////////////////////////////////////////// pa_accessories ////////////////////////////////////////////////// --

-- pa_accessories 테이블 생성
create table pa_accessories 
(acc_serial         varchar2(50) not null -- 주변기기 일련번호
,idx                number not null -- 주변기기 시퀀스
,acc_code           varchar2(50) not null -- 주변기기 코드(PK) => m : 마우스, k : 키보드 
,acc_name           varchar2(200) not null -- 주변기기 명
,acc_content        nvarchar2(2000) -- 주변기기 상세 설명
,acc_image          varchar2(200) not null -- 주변기기 이미지
,acc_br_name        varchar2(100) not null -- 주변기기 브랜드(FK?????)
,acc_color          varchar2(100) -- 부품 색상
,acc_price          number not null -- 주변기기 정가
,acc_pqty           number not null -- 주변기기 재고
,acc_registerDate   date default sysdate not null -- 주변기기 등록일자
,acc_status         number(1) default 0 not null -- 주변기기 상태 => 0 : 판매예정, 1 : 판매중인 상품, 2 : 재고 부족
,constraint PK_pa_accessories_acc_serial primary key(acc_serial) 
);

--  시퀀스 생성
create sequence seq_pa_accessories_idx
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- 해당 테이블 insert
insert into pa_accessories(acc_serial, idx, acc_code, acc_name, acc_content, acc_image, acc_br_name, acc_color, acc_price, acc_pqty, acc_registerDate, acc_status)
values('m1', seq_pa_accessories_idx.nextval, 'm', '마우스', '로지텍의 가벼운 마우스입니다.', 'm8.jpg', '로지텍', 'BK', 20000, 100, default, default);

insert into pa_accessories(acc_serial, idx, acc_code, acc_name, acc_content, acc_image, acc_br_name, acc_color, acc_price, acc_pqty, acc_registerDate, acc_status)
values('k2', seq_pa_accessories_idx.nextval, 'k', '키보드', 'MS의 게이밍 키보드입니다.', 'k19.jpg', 'MS', 'BK', 50000, 200, default, default);

insert into pa_accessories(acc_serial, idx, acc_code, acc_name, acc_content, acc_image, acc_br_name, acc_color, acc_price, acc_pqty, acc_registerDate, acc_status)
values('m2', seq_pa_accessories_idx.nextval, 'm', '마우스', 'LG의 가벼운 마우스입니다.', 'm6.jpg', 'LG', 'WH', 30000, 150, default, default);

commit;



select case when status = '0' then '활동중' when status = '1' then '휴면' else '탈퇴' end as status
from pa_user;







