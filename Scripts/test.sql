-- test는 구역안에서 해주시고, 스크립트 길이가 너무 길어지면 그때 조금씩 new 만들어서 옮기는게 좋을 것 같아요

-- Message (메세지)
select MsgNo, SendUser, ReceiveUser, MsgContent, SendDate, ReadYN from message;



-- BoardCategory (글분류)-> Board(사이트게시판) 외래키
select CategoryNo, CategoryName from boardcategory;



-- Board (사이트게시판)
select
BoardNo, CategoryNo, BoardTitle, BoardContent, BoardDate, BoardReadCount
from board;



-- Admin(관리자) -> QnA(Qna) 외래키
select AdminId, AdminPw, AdminName, AdminTel from admin;


-- UserInfo(회원정보) -> QnA(QnA) 외래키
select 
UserNo, UserId, UserPw, UserName, Address, DetailAddress,
UserPhone, Email, BankAcoount, BankName 
from userinfo;



-- QnA(QnA) - UserInfo(회원정보), Admin(관리자) 외래키 받음
select QnaNo, UserNo, AdminNo, CategoryNo, QnaTitle, QnaContent, QnaReply from qna;




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
select OptNo, PrjNo, OptPrice, OptContent from prjoption;



-- PrjBoard(프로젝트게시판) - Project(프로젝트) 외래키 받음
select PostNo, PrjNo, UserNo, PostTitle, PostContent from prjboard;