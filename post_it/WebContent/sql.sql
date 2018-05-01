CREATE TABLE MEMBER(
	EMAIL VARCHAR2(30) CONSTRAINT MEM_EMAIL_C CHECK (EMAIL LIKE '%@%') CONSTRAINT MEM_ID_PK PRIMARY KEY,
	PASSWORD VARCHAR2(10) CONSTRAINT MEM_PW_NN NOT NULL,
	NAME VARCHAR2(30),
	POINT NUMBER(10),
	POST_ID  CONSTRAINT POST_ID_FK REFERENCES POST(POST_ID)

CREATE TABLE POST(
	POST_ID NUMBER(10) CONSTRAINT POST_ID_PK PRIMARY KEY,
	POST_CONTENT VARCHAR2(2000),
	POST_LEVEL NUMBER(30),
	POST_COLOR VARCHAR2(30)
);


DROP TABLE MEMBER;

SELECT * FROM MEMBER;


SELECT * FROM MEMBER M, POST P WHERE M.POST_ID=P.POST_ID

insert into MEMBER values('rhrj@gmail.con','dgdsga','chang',123,1);