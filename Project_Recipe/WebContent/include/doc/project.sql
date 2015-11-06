CREATE USER project  --유저명 
IDENTIFIED BY 1234;   --패스워드

grant connect, resource to project;

CREATE TABLE Join
(
	id                   VARCHAR2(20) NOT NULL ,
	passwd               VARCHAR2(20) NOT NULL ,
	name                 VARCHAR2(10) NOT NULL ,
	nickname             VARCHAR2(20) NOT NULL unique,
	email                VARCHAR2(20) NOT NULL ,
	phone                VARCHAR2(13) NOT NULL, 
CONSTRAINT join_pk PRIMARY KEY (id)
);

CREATE TABLE board
(
	num                  NUMBER(5) NOT NULL ,
	nickname             VARCHAR2(20) NOT NULL ,
	b_pwd                VARCHAR2(20) NOT NULL ,
	b_title              VARCHAR2(50) NOT NULL ,
	readcnt              NUMBER(4) NULL ,
	writeday             DATE default sysdate NULL ,
	b_like               NUMBER(4) NULL ,
  cg_num               NUMBER(3) not Null,
	thumbnail            VARCHAR2(50) NULL ,
	b_content            VARCHAR2(300) NOT NULL, 
CONSTRAINT  board_pk  PRIMARY KEY (num),
CONSTRAINT  board_nickname_fk  FOREIGN KEY (nickname) REFERENCES Join (nickname)
);

 

CREATE TABLE content
(
	num                  NUMBER(5) NOT NULL ,
	c_num                NUMBER(4) NOT NULL ,
	content             VARCHAR2(3000) NOT NULL ,
	image               VARCHAR2(50) NULL ,
CONSTRAINT content_fk FOREIGN KEY (num) REFERENCES board (num)
);



CREATE TABLE reply
(
	r_num                NUMBER(4) NOT NULL ,
	num                  NUMBER(5) NOT NULL ,
	nickname             VARCHAR2(20) NOT NULL ,
	r_pwd                VARCHAR2(20) NULL ,
	r_content            VARCHAR2(300) NULL ,
	r_date               date default sysdate NULL, 

 CONSTRAINT reply_pk PRIMARY KEY (r_num),
 CONSTRAINT reply_nickname_fk FOREIGN KEY (nickname) REFERENCES Join (nickname),
 CONSTRAINT reply_num_fk FOREIGN KEY (num) REFERENCES board (num)
);

drop table join;
drop table board;
drop table content;
drop table reply;


 CREATE SEQUENCE BOARD_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1  NOCYCLE ;
 CREATE SEQUENCE CONTENT_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1  NOCYCLE ;
 CREATE SEQUENCE REPLY_SEQ MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1  NOCYCLE ;

Select 
	b.num, 
	nickname, 
	b_title, 
	readcnt, to_char(writeday, 'YYYY-MM-DD') 
	writeday, 
	b_like, 
	thumbnail, 
	b_content,
	c.content,
	c.image
From board b, content c
where
b.num = c.num and b.num=1;

INSERT INTO JOIN (ID, PASSWD, NAME, NICKNAME, EMAIL, PHONE) VALUES ('admin', '1234', '관리자', '관리자', 'admin@mail.com', '010-1234-5678');
INSERT INTO BOARD (NUM, NICKNAME, B_PWD, B_TITLE, READCNT, B_LIKE, THUMBNAIL, B_CONTENT, cg_num) VALUES ('8', '관리자', '1234', 'TEST입니다', '0', '0', 'log.png', '테스트 글입니다. 여기다가 레시피 재료를 적어주세요', '1');
INSERT INTO CONTENT (NUM, C_NUM, CONTENT, IMAGE) VALUES ('1', '2', '레시피 2입니다', 'log.png');
UPDATE BOARD SET THUMBNAIL = 'upload/thumb.jpg', B_CONTENT = '기름 떡볶이 만드는 법입니다.' where num = 1;
DELETE TABLE BOARD WHERE NUM=${NUM};

INSERT INTO BOARD (NUM, NICKNAME, B_PWD, B_TITLE, READCNT,  B_LIKE, THUMBNAIL, B_CONTENT, cg_num) VALUES (board_seq.nextval, '관리자', '1234', '1234', '0',  '0', 'log.png', '12323', 1);
  select board_seq.nextval from dual 