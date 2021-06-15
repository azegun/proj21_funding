-- test는 구역안에서 해주시고, 스크립트 길이가 너무 길어지면 그때 조금씩 new 만들어서 옮기는게 좋을 것 같아요

-- Message (메세지)
select
	MsgNo, SendUser, ReceiveUser,
	MsgContent, SendDate, ReadYN, DelSend, DelRecevie
from message;

select MsgNo, SendUser, ReceiveUser, MsgContent, SendDate, ReadYN, DelSend, DelRecevie
  from message
 where ReceiveUser = 'test10' and delRecevie = false;

select MsgNo, SendUser, ReceiveUser, MsgContent, SendDate, ReadYN, DelSend, DelRecevie
  from message
 where SendUser = 'test10' and delSend = false;

update message 
set ReadYN = 1
where MsgNo = 10;
insert into message ( SendUser, ReceiveUser, MsgContent)
	 values ( 'test1', 'test10', '펀딩팀 화이팅1');
insert into message ( SendUser, ReceiveUser, MsgContent)
	 values ( 'test1', 'test10', '펀딩팀 화이팅2');
insert into message ( SendUser, ReceiveUser, MsgContent)
	 values ( 'test10', 'test1', '펀딩팀 화이팅3');
insert into message ( SendUser, ReceiveUser, MsgContent)
	 values ( 'test10', 'test11', '펀딩팀 화이팅4');
	
delete from message where MsgNo =6;
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
	UserNo, UserId, UserPw,	UserName, Nickname, UserPhone,
	ZipCode, Address, DetailAddress,
	Email, BankName, BankAccount, Secession
from userinfo;
where userId = 'test10' and userPw = password('1111');
where UserName = 'test10' and UserPhone = '01012345678';

update userinfo
		   set UserPw = password('qwe11')
		 where userId = 'test10';
		 
delete from userinfo where userNo >2;
alter table userinfo auto_increment=4;

-- QnA(QnA) - UserInfo(회원정보), Admin(관리자) 외래키 받음
select 
	QnaNo, UserNo, AdminNo, CategoryNo,
	QnaTitle, QnaContent, QnaReply, QnaFile
from qna;




-- Project(프로젝트) - UserInfo(회원정보) 외래키 받음
select
			PrjNo, UserNo, pCategoryNo, 
			PrjName, PrjContent, PrjGoal,
			StartDate, EndDate, PayDate, EndYN
from project;

-- 수정 프로젝트
select 
PrjNo, pCategoryNo, PrjName, PrjContent, PrjGoal, 
StartDate, EndDate, PayDate 
from project;

-- Join 프로젝트 + 프로젝트옵션 Update 프로젝트 수정
update project as p inner join prjoption as op
on p.PrjNo = op.PrjNo 
	set 
	 	p.pCategoryNo = '2',
		p.PrjName = '업데이트너무힘들었음', p.PrjContent ='dto하나로 다받는게 쉬움', p.PrjGoal = 333333333,
		p.EndDate = '2022-06-13', p.PayDate = '2021-06-13',
		op.OptName = '1주일쨰 파일올리기,수정', op.OptPrice =30330000, op.OptContent ='화이팅하자'
where p.PrjNo = 3;

-- Project + userInfo + prjOption 조인 by prjNo
select p.prjNo,p.UserNo, p.pCategoryNo,  PrjName, PrjContent, PrjGoal,
				StartDate, EndDate, PayDate, EndYN, u.UserId , u.UserName,
				o.OptNo, o.OptPrice,o.OptContent,o.optName
			from project p join userinfo u on p.userno = u.UserNo 
						   join prjoption o on p.PrjNo =o.PrjNo
			where o.prjNo = 3;


-- 업데이트 프로젝트
update project 
	set 
			PrjName = '업데이트', PrjContent ='성공', PrjGoal = 200000, 
			EndDate = '2021-06-13', PayDate = '2021-06-13'
	where prjno = 66;




-- FundingInfo(후원정보) - UserInfo(회원정보), Project(프로젝트) 외래키 받음
select
	FundingNo, UserNo, PrjNo, OptNo, AccountNo, PayYN, EndYN
from fundinginfo;



-- PrjOption(프로젝트구매옵션) - Project(프로젝트) 외래키 받음
select
		OptNo, PrjNo, OptName, OptPrice, OptContent
from prjoption;
-- 옵션 프로젝트 업데이트
update prjoption 
	set OptName ='문방사우', OptPrice = 2200000, OptContent = '먹'
where OptNo =22;



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

delete from project 
where PrjNo  = 10;

delete from prjoption 
where PrjNo = 10;
	
		
insert into project(
		UserNo, pCategoryNo, PrjName, PrjContent, PrjGoal, 
		StartDate, EndDate, PayDate) 
values(
		00001, 2, '클라우드펀딩 올리기', '후원받아 제품 구매할수있게 만들기', 1000000,
		now(), now(), now());
/*insert할 때 autoincrease하면 번호 정확하게 찾지  못해서 사용하는 select*/
	SELECT last_insert_id();


delete from member where id >91;

delete
from project
where prjno > 6;

delete
from prjoption 
where optno > 4;



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

insert into boardcategory(CategoryName)
values ('창작자'), ('후원자'), ('사이트 이용');

select * from boardcategory;



