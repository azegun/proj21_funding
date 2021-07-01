-- 컬럼은 위에 셀렉트문으로 확인!!!!!!
-- Message (메세지)
select
	MsgNo, SendUser, ReceiveUser,
	MsgContent, SendDate, ReadYN, DelSend, DelRecevie
from message;

 insert into message values 
 (00001, 'test10', 'test2', '펀딩팀 화이팅', now(), 1, 0, 0);

#default값 제외
insert into message (
	SendUser, ReceiveUser,
	MsgContent, ReadYN) 
values ( 'test2', 'test10', '펀딩팀 화이팅',  0);




-- BoardCategory (글분류)-> Board(사이트게시판) 외래키
select
	CategoryNo, CategoryName, CategoryClass 
from boardcategory;

insert into boardcategory  values
(1, '공지사항', 'board');

#default값 없이
insert into boardcategory (CategoryName, CategoryClass)
	values ('이벤트', 'board');

insert into boardcategory (CategoryName, CategoryClass)
values ('사이트 관련', 'qna'), ('창작자 관련', 'qna'), ('후원자 관련', 'qna');


	
	
	
-- Board (사이트게시판)
select
	BoardNo, CategoryNo, BoardTitle, 
	BoardContent, BoardDate
from board;

insert into board  values
(00001, 1, '아자아자 펀딩팀', '힘을내요! 잘할거예요', now(),  null);
#default값 제외
insert into board ( CategoryNo, BoardTitle, BoardContent) values
(2,'이벤트','경험치2배이벤트');


-- Admin(관리자) -> QnA(Qna) 외래키
select
	AdminNo, AdminId, AdminPw, AdminName, AdminTel
from admin;

insert into admin values
(00001, 'admin',password('0000'), '김경연', '010-6510-7277');
#default값제외
insert into admin (AdminId, AdminPw, AdminName, AdminTel)
values ('admin1', password('0000'),'김상건','010-3302-1972');

-- UserInfo(회원정보) -> QnA(QnA) 외래키
select 
	UserNo, UserId, UserPw,	UserName, Nickname, Email,
	UserPhone, ZipCode, Address, DetailAddress,
	BankName, AccountHolder, BankAccount, Secession
from userinfo;
 
insert into userinfo values(
00001, 'test1', password('0000'), '김상건', 'ksg', 'test@test.com',
'01033021972', '111222', '대구', '달서구', '국민', '김상건', 00000001, 0 
);

insert into userinfo ( UserId, UserPw, UserName, Nickname,
	email, UserPhone, ZipCode, Address, DetailAddress, BankName, AccountHolder, BankAccount, Secession)
values ('kykim', password('1111'),'김경연', '경연짱123', 'kymonk@naver.com', '01012345678', '12345', '대구광역시 북구','구암로 49길 10 702동 903호','하나은행','김경연','01065107277407',0),
		('sgkim', password('1111'),'김상건', '김상건', 'tkdrjs7@gmail.com', '01012345678', '222333', '대구', '달서구','국민은행','김상건','12346546541',0),
		('mywns', password('1111'),'임준엽', '임준엽', 'wnsduq7@gmail.com', '01012345678', '222333', '대구', '달서구','우리은행','임준엽','9687654134',0),
		('pinethx', password('1111'),'유한솔', '유한솔', 'gksthf7@gmail.com', '01012345678', '222333', '대구', '달서구','대구은행','유한솔','654321789',0),
		('chamdo2', password('1111'),'김예진', '김예진', 'chamdodari2@gmail.com', '01012345678', '222333', '대구', '달서구','카카오뱅크','김예진','1321545',0),
		('mjlee', password('1111'),'이민정', '이민정', 'alswjd7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,1),
		('mkjung', password('1111'),'정민강', '정민강', 'alsrkd7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('jrkim', password('1111'),'김재룡', '김재룡', 'wofyd7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,1),
		('bgshin', password('1111'),'신범건', '신범건', 'qjarjs7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('jylee', password('1111'),'이종윤', '이종윤', 'whddbs7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('khkim', password('1111'),'김길현', '김길현', 'rlfgus7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,1),
		('thlee', password('1111'),'이태훈', '이태훈', 'xogns7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('mhsong', password('1111'),'송명훈', '송명훈', 'audgns7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0),
		('nylee', password('1111'),'이나연', '이나연', 'skdus7@gmail.com', '01012345678', '222333', '대구', '달서구',null,null,null,0);


-- QnA(QnA) - UserInfo(회원정보), Admin(관리자) 외래키 받음
select 
	QnaNo, UserNo, AdminNo, CategoryNo,
	QnaTitle, QnaContent,QnaDate, QnaReply,ReplyDate,QnaFile
from qna;

insert into qna  values
(1, 00001 , null, 5 , '결제는 언제 되나요?', '결제는 언제 되나요?',now(), '100펀딩에서는 후원 즉시 후원금이 결제되지 않습니다. 후원한 프로젝트가 모금에 성공하면 마감일 다음 날부터 7일 동안 결제에 성공할 때까지 출금이 시도됩니다. 결제일 오전에 카카오톡을 통해 결제에 대한 알림을 드리고 있습니다. ', now(),null),
(2, 00001 , null, 4 , '프로젝트 주요 일정이 어떻게 되나요?', '프로젝트 주요 일정이 어떻게 되나요?',now(), '100펀딩 프로젝트의 주요 일정은 크게 공개예정 기간 - 펀딩 기간 - 결제 기간 - 정산일 - 선물 전달로 진행됩니다. 아래에서 프로젝트의 주요 일정의 설정 가능 기간을 확인해 주세요. ', now(),null);

#default값 null값 제외
insert into qna (UserNo,CategoryNo,QnaTitle,QnaContent)
values
(2,2,'이벤트','언제시작?'),
(2,2,'이벤트','언제시작?'),
(2,2,'이벤트','언제시작?'),
(2,2,'이벤트','언제시작?'),
(2,2,'이벤트','언제시작?'),
(2,2,'이벤트','언제시작?');


-- PrjCategory(프로젝트 카테고리)
select * from prjcategory ;

insert into prjcategory (pCategoryName) 
	values('게임'),('공연'),('디자인'),('만화'),('예술'),('공예'),('사진'),('영화(비디오)'),('푸드'),('음악'),('출판'),('테크'),('패션'),('저널리즘');




-- Project(프로젝트) - UserInfo(회원정보) 외래키 받음
select
	PrjNo, UserNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, PayDate, EndYN
from project;

insert into project values(
1, 1,1, '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”', 
'개발에 참여한 4인이 고전에서 느낀 재미 요소들이 상이할 정도로, 여러 매력을 가진 “퍼스트퀸4”의 핵심 재미요소를 충실히 담기 위해 노력하였고, 그를 계승한다는 의미로
“퍼스트”의 앞 글자를 가져왔으며, 인 게임 상 메인 스토리의 진행 요소, 4인의 개발자를 상징하는 중의적 의미를 가진 클로버를 합성해 "퍼스트 클로버" 가 탄생되었습니다.
CLOVER Logo는 뫼비우스의 띠처럼 무한(Eternity)과 공고한 결속의 의미를 가집니다.', 500000,
'20210701', '20210720','20210720', 0
);

#default값 null값 제외
insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (2,2,'청년들이 모여 1919년 청년들을 재해석하다.',
'청년 단체 피움에서 직접 작업한 연극 <그날의 기록>은
1919년도 3.1 운동의 거점이 된 2.8 독립선언문의 내용으로,
그중에서도 많이 알려지지 못한 여성 운동가를 통해 기록되지 않은
그들의 투쟁과 누릴 수 없었던 삶을 재해석한 작품입니다.
이를 통해 그들의 의지와 열정을 기억하고자 하였고,
그 뜨거운 의지가 현시대를 살아가고 있는 청년들에게 새로운 울림이 되기를 기대합니다.
1919년 당시의 뜨거움을 관객분들에게 전달하기 위해 피움에서는
답사, 역사서적, 토론 등 다양한 방법으로 매 순간 공연의 완성도를 높이고 있습니다.
많은 기대 부탁드립니다.',500000,'20210630','20210713','20210713');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (3,3,'쓰레기도 줄여주고 플라스틱 업사이클까지??',
'버려지는 플라스틱이 쓰레기를 줄이는 제품으로 돌아오다',
500000,'20210625','20210730','20210730');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (4,6,' <애플머스캣> 그린 퍼퓸',
'청사과는 여름철에 많은 사랑을 받는 과일인데요.
 흐르는 물에 잘 씻어 껍질을 벗기지 않은 채로 한 입 와삭 베어 물면 상큼 달달한 과즙의 향이 퍼집니다.
 일반적인 사과와 달리 청사과는 좀 더 빨리 수확을 하며 여름 제철 과일인 만큼 한여름의 향기를 품고 있습니다.',1000000,'20210630','20210730','20210730');


insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (5,5,'부활 프로젝트 첫번째 이야기,안중근 의사 흉상',
'하나는 기록된 사진이 없어 그들의 업적, 행동을 주로 된 이미지로 기억하는것.
 또 다른 하나는 영웅들의 사진자료가 남아
영웅의 모습(얼굴)을 바탕으로 그들의 업적, 행동을 기억하는 것. 우리는 흉상으로 그분들의 진실한 모습을 부활시키고자 합니다.',
2000000,'20210630','20200730','20200730');



-- FundingInfo(후원정보) - UserInfo(회원정보), Project(프로젝트) 외래키 받음
select
	FundingNo, UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress, PayYN, EndYN
from fundinginfo;

insert into fundinginfo values
(00001, 00001, 00001, 00001, 000000001,98765,'대구 달서구','영남인재교육원 201호', 0,0);
#default값 null값 제외
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 1, 2, '12341234',12345,'대구시 북구','아파트203호' );
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 2, 3, '12341234',12345,'대구시 북구','아파트203호' );
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 1, 4, '12341234' ,12345,'대구시 북구','아파트203호');
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 1, 1, '3131214' ,12345,'대구시 북구','아파트203호');




-- PrjOption(프로젝트구매옵션) - Project(프로젝트) 외래키 받음
select
	OptNo, PrjNo, OptName, OptPrice, OptContent
from prjoption;


insert into prjoption values
(1, 1, '실버세트', 50000, '실버 50개+생사초50개');
-- default값 null값 제외
insert into prjoption (prjno, OptName, OptPrice,OptContent)
values (1, '골드세트', 100000, '골드 50개 + 고급장비 상자');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (1,'다이아세트', 150000, '다이아 50개 + 고급장비 상자 + 한정 캐릭터 1종');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (2,'방구석 1열', 15000, 'USB로 공연영상 제공');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (2,'방구석 1열', 22000, 'USB로 공연영상 제공 / 그날의 기록 제작 이야기가 담긴 책');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (2,'방구석 1열', 35000, 'USB로 공연영상 제공/그날의기록 제작 이야기가 담긴 책/그날의기록노트');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (3,'얼리버드E', 18000, '마스크훅3개');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (3,'얼리버드F', 25000, '마스크훅3개+업사이클립2개');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (3,'얼리버드G', 51000, '마스크훅3개+업사이클립2개+뚜밴커터2개');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (4,'애플머스캣 EDP 30ml', 40000, '애플머스캣 EDP 30ml');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (4,'애플머스캣 EDP 30ml*2', 75000, '애플머스캣 EDP 30ml*2');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (4,'애플머스캣 EDP 30ml*3', 110000, '애플머스캣 EDP 30ml*3');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (5,'안중근 흉상 A세트+배송비무료', 40000, '안중근 흉상 A(1번형) + 안중근 흉상 A 전용 고급 케이스');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (5,'안중근 흉상 B세트+배송비무료', 75000, '안중근 흉상B(2번형) + 안중근 흉상 B 전용 고급 케이스');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (5,'안중근 흉상 C세트+배송비무료', 110000, '안중근 흉상 C(3번형) + 안중근 흉상 C 전용 고급 케이스');




-- PrjBoard(프로젝트게시판) - Project(프로젝트) 외래키 받음
insert into prjboard values
(00001, 00001, 00001, '고생들했어요', now(), null );
#default값 null값 제외
insert into prjboard (PrjNo, UserNo, PostContent )
values (2, 2, '잘되고있어요');









