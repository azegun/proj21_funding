-- test는 구역안에서 해주시고, 스크립트 길이가 너무 길어지면 그때 조금씩 new 만들어서 옮기는게 좋을 것 같아요

-- Message (메세지)
select
	MsgNo, SendUser, ReceiveUser,
	MsgContent, SendDate, ReadYN
from message;



-- BoardCategory (글분류)-> Board(사이트게시판) 외래키
select
	CategoryNo, CategoryName 
from boardcategory;



-- Board (사이트게시판)
select
	BoardNo, CategoryNo, BoardTitle, 
	BoardContent, BoardDate, BoardReadCount
from board;



-- Admin(관리자) -> QnA(Qna) 외래키
select
	AdminNo, AdminId, AdminPw, AdminName, AdminTel
from admin;


-- UserInfo(회원정보) -> QnA(QnA) 외래키
select 
	UserNo, UserId, UserPw,	UserName, UserPhone,
	ZipCode, Address, DetailAddress,
	Email, BankName, BankAccount
from userinfo;
where userId = 'test10' and userPw = password(1111);

update userinfo
		   set UserPw = password('qwe11')
		 where userId = 'test10';
		 
delete from userinfo where userNo >2;
alter table userinfo auto_increment=3;

-- QnA(QnA) - UserInfo(회원정보), Admin(관리자) 외래키 받음
select 
	QnaNo, UserNo, AdminNo, CategoryNo,
	QnaTitle, QnaContent, QnaReply, QnaFile
from qna;




-- Project(프로젝트) - UserInfo(회원정보) 외래키 받음
select
	PrjNo, UserNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, PayDate, EndYN
from project;





-- FundingInfo(후원정보) - UserInfo(회원정보), Project(프로젝트) 외래키 받음
select
	FundingNo, UserNo, PrjNo, OptNo, AccountNo, PayYN, EndYN
from fundinginfo;



-- PrjOption(프로젝트구매옵션) - Project(프로젝트) 외래키 받음
select
	OptNo, PrjNo, OptPrice, OptContent
from prjoption;



-- PrjBoard(프로젝트게시판) - Project(프로젝트) 외래키 받음
select 
	PostNo, PrjNo, UserNo,
	PostTitle, PostContent 
from prjboard;



-- addresses(주소)
select 
	addr_id, street, city, state, zip, country 
from addresses ;

-- Project + PrjOption insert 트렌젝션
desc project;
select  * from project; 
SELECT * FROM prjoption;
select * from userinfo;
insert into project(
		UserNo, PrjName, PrjContent, PrjGoal, 
		StartDate, EndDate, PayDate) 
values(
		00001, '클라우드펀딩 올리기', '후원받아 제품 구매할수있게 만들기', 1000000,
		now(), now(), now());


insert into prjoption 
		(prjno,OptPrice,OptContent)
values 
		(3, 300000, '옵션c');


-- qna test	
	
insert into qna(qnaNo, userNo, categoryNo, qnaTitle, qnaContent, qnaFile)
values (3, 1, 1, "오늘의 질문", "왜 업데이트시 날짜 자동 업데이트가 안 될까?", null);

select * from qna;

update QNA
   set qnaReply = "이제 해결했음!", replyDate = now(), adminNo = "1"
 where qnaNo = "3";

delete from qna where qnaNo=4;
 

-- admin test

select * from admin;

delete from admin where adminNo = 5;