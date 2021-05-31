-- 컬럼은 위에 셀렉트문으로 확인!!!!!!
-- Message (메세지)
select
	MsgNo, SendUser, ReceiveUser,
	MsgContent, SendDate, ReadYN
from message;

insert into message values 
(00001, 'sgkim', 'kykim', '펀딩팀 화이팅', now(), 1);

#default값 제외
insert into message ( SendUser, ReceiveUser,
	MsgContent, ReadYN) values ( 'sgkim', 'kykim', '펀딩팀 화이팅',  0);




-- BoardCategory (글분류)-> Board(사이트게시판) 외래키
select
	CategoryNo, CategoryName 
from boardcategory;

insert into boardcategory  values
(1, '공지사항');

#default값 없이
insert into boardcategory (CategoryName)
	values ('이벤트');

	
	
	
-- Board (사이트게시판)
select
	BoardNo, CategoryNo, BoardTitle, 
	BoardContent, BoardDate, BoardReadCount
from board;

insert into board  values
(00001, 1, '아자아자 펀딩팀', '힘을내요! 잘할거예요', now(), 1);
#default값 제외
insert into board ( CategoryNo, BoardTitle, BoardContent) values
(2,'이벤트','경험치2배이벤트');


-- Admin(관리자) -> QnA(Qna) 외래키
select
	AdminNo, AdminId, AdminPw, AdminName, AdminTel
from admin;

insert into admin values
(00001, 'admin','0000', '김경연', '010-6510-7277');
#default값제외
insert into admin (AdminId, AdminPw, AdminName, AdminTel)
values ('admin1','0000','김상건','010-3302-1972');

-- UserInfo(회원정보) -> QnA(QnA) 외래키
select 
	UserNo, UserId, UserPw, UserName,
	Address, DetailAddress, UserPhone, Email,
	BankAccount, BankName
from userinfo;

insert into userinfo values(
00001, 'test', '0000', '김상건', '대구', '달서구',
'010-3302-1972', 'test@test.com', 00000001, '국민'
);

#default값 제외
insert into userinfo ( UserId, UserPw, UserName,
	Address, DetailAddress)
values ('test2','1111','김경연','대구','북구');



-- QnA(QnA) - UserInfo(회원정보), Admin(관리자) 외래키 받음
select 
	QnaNo, UserNo, AdminNo, CategoryNo,
	QnaTitle, QnaContent,QnaDate, QnaReply,ReplyDate,QnaFile
from qna;

insert into qna  values
(1, 00001 , null, 1 , '7월졸업', '1달만 더 힘내요!',now(), '넹', now(),null);

#default값 null값 제외
insert into qna (UserNo,CategoryNo,QnaTitle,QnaContent)
values(2,2,'이벤트','언제시작?');




-- Project(프로젝트) - UserInfo(회원정보) 외래키 받음
select
	PrjNo, UserNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, PayDate, EndYN
from project;

insert into project values(
00001, 00001, '클라우드펀딩', '후원받아 제품만들기', 1000000,
now(), now(),  now(), 1
);
#default값 null값 제외
insert into project (UserNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, PayDate)
values (1,'홈페이지만들기','펀딩프로젝트만듭니다.',5000000,now(),'2021-6-30','2021-7-12');




-- FundingInfo(후원정보) - UserInfo(회원정보), Project(프로젝트) 외래키 받음
select
	FundingNo, UserNo, PrjNo, OptNo, AccountNo, PayYN, EndYN
from fundinginfo;

insert into fundinginfo values
(00001, 00001, 00001, 00001, 000000001, 0,0);
#default값 null값 제외
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo)
values (2, 2, 2, 12341234 );




-- PrjOption(프로젝트구매옵션) - Project(프로젝트) 외래키 받음
select
	OptNo, PrjNo, OptPrice, OptContent
from prjoption;

insert into prjoption values
(00001, 00001, 30000, '가방2개+연필1자루');
#default값 null값 제외
insert into prjoption (prjno,OptPrice,OptContent)
values (2, 300000, '옵션B');



-- PrjBoard(프로젝트게시판) - Project(프로젝트) 외래키 받음
select 
	PostNo, PrjNo, UserNo,
	PostTitle, PostContent ,PostDate ,PostFile 
from prjboard;

insert into prjboard values
(00001, 00001, 00001, '마지막인서트', '고생들했어요', now(), null );
#default값 null값 제외
insert into prjboard (PrjNo, UserNo,
	PostTitle, PostContent )
values (2, 2, '진행','잘되고있어요');



-- addresses(주소)
select 
	addr_id, street, city, state, zip, country 
from addresses ;

insert into addresses values
(00001, '달서구로', '대구', '달서구', '000-00-01', '진천동' );






