-- 컬럼은 위에 셀렉트문으로 확인!!!!!!
-- Message (메세지)
select
	MsgNo, SendUser, ReceiveUser,
	MsgContent, SendDate, ReadYN, DelSend, DelRecevie
from message;

insert into message
	 (SendUser, ReceiveUser, MsgContent, SendDate, ReadYN, DelSend, DelRecevie)
 values 
 ('test1', 'kykim', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.', now(), 1, 0, 0);

#default값 제외
insert into message (
	SendUser, ReceiveUser, MsgContent, ReadYN) 
values
( 'test1', 'sgkim', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'test1', 'mywns', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'test1', 'pinethx', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'test1', 'jrkim', '고전 게임의 재미를 계승한 모바일 게임 “퍼스트클로버”에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'test1', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'sgkim', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'mywns', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'pinethx', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'kykim', 'jrkim', '"청년들이 모여 1919년 청년들을 재해석하다."에  참여해주셔서 감사합니다.',  0),
( 'sgkim', 'kykim', '"[RE:PLA] 쓰레기도 줄여주고 플라스틱 업사이클까지??"에  참여해주셔서 감사합니다.',  0),
( 'sgkim', 'test1', '"[RE:PLA] 쓰레기도 줄여주고 플라스틱 업사이클까지??"에  참여해주셔서 감사합니다.',  0),
( 'mywns', 'kykim', '"청사과와 청포도의 싱그러운 만남 <애플머스캣> 그린 퍼퓸"에  참여해주셔서 감사합니다.',  0),
( 'mywns', 'test1', '"청사과와 청포도의 싱그러운 만남 <애플머스캣> 그린 퍼퓸"에  참여해주셔서 감사합니다.',  0),
( 'pinethx', 'kykim', '"부활 프로젝트 첫번째 이야기,안중근 의사 흉상"에  참여해주셔서 감사합니다.',  0),
( 'pinethx', 'test1', '"부활 프로젝트 첫번째 이야기,안중근 의사 흉상"에  참여해주셔서 감사합니다.',  0);


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

#default값 제외
insert into board ( CategoryNo, BoardTitle, BoardContent) values
(1, '[서비스 개선] 팔로우 탐색 개선 및 창작자 메시지 카카오 알림 지원 안내', '<p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">안녕하세요, 텀블벅입니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">언제나 텀블벅을 이용해 주셔서 감사합니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">2021년 6월 24일자로 개선된 기능을 안내드립니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><h3 style="box-sizing: inherit; font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; line-height: 45px; margin: 45px 0px 0px; font-weight: normal; padding: 0px; font-size: 30px; word-break: break-all; letter-spacing: -0.03em; color: rgb(61, 61, 61); background-color: rgb(255, 255, 255);">팔로우 목록 확인</h3><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">이제 다른 이용자의 프로필에서 팔로잉과 팔로워 목록을 확인할 수 있습니다. 관심 있는 이용자를 발견하고 팔로우하여 텀블벅에서의 네트워크를 확장해 보세요.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);"><img src="https://tumblbug-assets.imgix.net/cms_images/attachments/000/000/671/original/_ED_8C_94_EB_A1_9C_EC_9A_B0_20_EB_AA_A9_EB_A1_9D.png?1624596220" style="box-sizing: inherit; border: 0px; max-width: 100%; margin: 0px;"></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><h3 style="box-sizing: inherit; font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; line-height: 45px; margin: 45px 0px 0px; font-weight: normal; padding: 0px; font-size: 30px; word-break: break-all; letter-spacing: -0.03em; color: rgb(61, 61, 61); background-color: rgb(255, 255, 255);">후원자 관리 &gt; 메시지 기능 사용 시 카카오 알림톡 발송</h3><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">창작자가 후원자에게 메시지 보내기 기능을 사용하면 카카오톡 알림톡이 발송됩니다. 후원자는 알림톡의 "메시지 확인하기" 버튼을&nbsp;<span data-token-index="1" data-reactroot="" style="box-sizing: inherit;">누르면 메시지 전문을 확인할 수 있는 페이지로 이동합니다.</span></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);"><span data-token-index="1" data-reactroot="" style="box-sizing: inherit;"><img src="https://tumblbug-assets.imgix.net/cms_images/attachments/000/000/674/original/_EC_95_8C_EB_A6_BC_ED_86_A1.png?1624596531" width="346" style="box-sizing: inherit; border: 0px; max-width: 100%; margin: 0px auto; display: block;"></span></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);"><span data-token-index="1" data-reactroot="" style="box-sizing: inherit;">이 밖에도 후원 상세 페이지에 창작자에게 문의할 수 있는 버튼 추가, 프로젝트 상세 페이지 하단에 "최근 본 프로젝트" 안내 등이 추가되었습니다.</span></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255); text-align: justify;"><img src="https://tumblbug-assets.imgix.net/cms_images/attachments/000/000/675/original/_EC_B0_BD_EC_9E_91_EC_9E_90_EB_AC_B8_EC_9D_98__EC_B5_9C_EA_B7_BC_EB_B3_B8_ED_94_84_EB_A1_9C_EC_A0_9D_ED_8A_B8.png?1624602858" style="box-sizing: inherit; border: 0px; max-width: 100%; margin: 0px;"></p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">앞으로도 더욱 편리하게 이용하실 수 있도록 노력하겠습니다.</p><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">감사합니다.</p>'),
(2, '[파트너십 안내] CJ 대한통운 x 텀블벅 창작자 풀필먼트 서비스 지원', '<div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); margin-top: 0px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">안녕하세요. 텀블벅입니다.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">&nbsp;</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">그동안 프로젝트 마감 후 선물 배송에 고민인 창작자님이 많으셨는데요.<br style="box-sizing: inherit;">CJ 대한통운에서 텀블벅 창작자를 위해 무료 물류 상담과&nbsp;할인된 가격의 풀필먼트 서비스를 지원합니다.<br style="box-sizing: inherit;">풀필먼트 서비스란 단순 배송을 넘어 보관, 포장, CS 등 물류의 모든 과정을 제공하는 물류 일괄 대행 서비스로써,<br style="box-sizing: inherit;">이제 배송에 관한 고민은 내려놓고 프로젝트에 더욱 집중하실 수 있습니다.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">&nbsp;</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);"><strong style="box-sizing: inherit;">﹅&nbsp;제공 혜택</strong></div><ol class="p-rich_text_list p-rich_text_list__ordered" data-stringify-type="ordered-list" data-indent="0" style="box-sizing: inherit; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);"><li data-stringify-indent="0" style="box-sizing: inherit;">무료 물류 상담 서비스 : 언제라도 무료로 물류 상담을 받을 수 있습니다. 상담 이후 계약 여부를 결정하시면 되니 부담 없이 이용해주세요.</li><li data-stringify-indent="0" style="box-sizing: inherit;">풀필먼트 서비스 할인 혜택 : 텀블벅 창작자라면 CJ대한통운의 안정적인 풀필먼트 서비스를 할인된 가격에 이용하실 수 있습니다.</li></ol><p style="box-sizing: inherit; margin-top: 16px; line-height: 27px; word-break: break-all; font-size: 16px; letter-spacing: -0.32px; color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;</p><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">자세한 내용과 가격표는&nbsp;<a class="c-link" href="https://www.notion.so/tumcorp/cj-abb406aa17b94a1588af5101a6a75d56?utm_source=notice&amp;utm_medium=creator&amp;utm_campaign=fullfilment_cj&amp;utm_content=noti" target="_blank" rel="noopener noreferrer" data-stringify-link="https://www.notion.so/tumcorp/CJ-abb406aa17b94a1588af5101a6a75d56" data-sk="tooltip_parent" style="box-sizing: inherit; background: transparent; color: rgb(250, 100, 98); text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1);">여기</a>를 참고 해주세요.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">&nbsp;</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">많은 이용 부탁드립니다.</div><div class="p-rich_text_section" style="box-sizing: inherit; word-break: break-all; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); color: rgb(61, 61, 61); font-family: &quot;SF Pro Text&quot;, &quot;Helvetica Neue&quot;, &quot;Segoe UI&quot;, Arial, NotoSansKR, sans-serif; font-size: 16px; letter-spacing: -0.32px; background-color: rgb(255, 255, 255);">감사합니다.</div>');


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
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?'),
(2,3,'이벤트','언제시작?');


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
2000000,'20210630','20210730','20210730');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
	StartDate, EndDate, payDate)
values (6,11,'실무자가 알려주는 굿즈 제조업체 500선',
'초보자부터 프로까지 누구나 바로 써먹는 실전 책ㅣ전국 제조 업체, 용어, 단가 총 정리!',
500000,'20210530','20210630','20210630');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
StartDate, EndDate, payDate)
values (1,12,'세상에서 제일 예쁜 인테리어 무선충전기 <게이즈온 포 홈>',
'투박하고 못생긴 무선충전기는 이제 끝, 세.젤.예 인테리어 무선충전기를 만나보세요.',
700000,'20210702','20210730','20210730');

insert into project (UserNo, pcategoryNo, PrjName, PrjContent, PrjGoal,
StartDate, EndDate, payDate)
values (1,13,'영광의 순간을 위해, 나만 보는 각인링 <월계수 암시반지>',
'승리와 영광의 상징 월계수. 그 안쪽에는 나만 보는 꿈과 목표를 새기는 암시반지입니다.',
500000,'20210701','20210830','20210830');



-- FundingInfo(후원정보) - UserInfo(회원정보), Project(프로젝트) 외래키 받음
select
	FundingNo, UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress, PayYN, EndYN
from fundinginfo;

#default값 null값 제외
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo, ZipCode, Address, DetailAddress)
values (2, 1, 2, '12341234',12345, '대구시 북구', '아파트203호');
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 2, 3, '12341234',12345,'대구시 북구','아파트203호' );
insert into fundinginfo (UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values (2, 1, 4, '12341234' ,12345,'대구시 북구','아파트203호');


 
insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(2, 1, 2, '12341234',12345,'대구시 북구','아파트203호' ),
(2, 1, 3, '12341234',12345,'대구시 북구','아파트203호' ),
(2, 1, 1, '12341234',12345,'대구시 북구','아파트203호' ),
(3, 1, 1, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 1, 2, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 1, 1, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 2, 2, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 2, 3, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 2, 2, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 1, 1, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 1, 3, '63650204117478',43228,'대구시 달서구','월배로28' ),
(3, 4, 2, '63650204117478',43228,'대구시 달서구','월배로28' );
insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(4, 5, 1, '636528541125',42928,'서울시 관악구','28' ),
(4, 5, 2, '636528541125',42928,'서울시 관악구','28' ),
(4, 5, 3, '636528541125',42928,'서울시 관악구','28' ),
(4, 5, 2, '636528541125',42928,'서울시 관악구','28' ),
(4, 5, 1, '636528541125',42928,'서울시 관악구','28' ),
(4, 3, 1, '636528541125',42928,'서울시 관악구','28' ),
(4, 3, 2, '636528541125',42928,'서울시 관악구','28' ),
(4, 3, 1, '636528541125',42928,'서울시 관악구','28' ),
(4, 3, 2, '636528541125',42928,'서울시 관악구','28' ),
(4, 3, 3, '636528541125',42928,'서울시 관악구','28' ),
(4, 3, 1, '636528541125',42928,'서울시 관악구','28' ),
(4, 2, 1, '636528541125',42928,'서울시 관악구','28' ),
(4, 2, 2, '636528541125',42928,'서울시 관악구','28' ),
(4, 2, 3, '636528541125',42928,'서울시 관악구','28' ),
(4, 2, 2, '636528541125',42928,'서울시 관악구','28' ),
(4, 1, 2, '636528541125',42928,'서울시 관악구','28' ),
(4, 1, 3, '636533445234',23975,'대전시 유성구','중창로-28' ),
(4, 1, 2, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 1, 1, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 1, 1, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 2, 3, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 2, 2, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 3, 1, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 4, 3, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 5, 3, '636533445234',23975,'대전시 유성구','중창로-28' ),
(5, 3, 3, '636533445234',23975,'대전시 유성구','중창로-28' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(6, 1, 1, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 1, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 1, 3, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 1, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 2, 3, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 2, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 2, 1, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 3, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 3, 1, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 3, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 3, 3, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 4, 1, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 4, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 4, 3, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 5, 1, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 5, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 5, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 5, 2, '2267833445234',49875,'제주시 서귀포구','올레길-28' ),
(6, 3, 3, '2267833445234',49875,'제주시 서귀포구','올레길-28' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(7, 1, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 1, 2, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 1, 3, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 1, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 1, 3, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 2, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 2, 2, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 2, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 2, 3, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 3, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 3, 2, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 4, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 4, 2, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 4, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 5, 3, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 5, 3, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 4, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 3, 1, '2211243234', 34861,'경남 창원시','빌라604호' ),
(7, 3, 2, '2211243234', 34861,'경남 창원시','빌라604호' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(8, 1, 1, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 1, 3, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 1, 2, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 1, 3, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 1, 2, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 2, 2, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 2, 1, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 2, 1, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 2, 1, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 2, 1, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 3, 3, '2121243234', 32661,'경북 포항시','아파트1102호' ),
(8, 4, 3, '2121243234', 32661,'경북 포항시','아파트1102호' );

insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(9, 5, 1, '2121243234', 32661,'경남 밀양시','아파트3302호' ),
(9, 5, 1, '2121243234', 32661,'경남 밀양시','아파트3302호' ),
(9, 3, 1, '2121243234', 32661,'경남 밀양시','아파트3302호' );


insert into fundinginfo
	(UserNo, PrjNo, OptNo, AccountNo,ZipCode, Address, DetailAddress)
values
(10, 5, 3, '212362904', 21661,'경북 구미시','아파트802호' ),
(10, 5, 1, '212362904', 21661,'경북 구미시','아파트802호' ),
(11, 3, 1, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(11, 3, 2, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(11, 2, 1, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(11, 2, 1, '33797243234', 12571,'강원 삼척시','귀빈508호' ), 
(11, 5, 3, '33797243234', 12571,'강원 삼척시','귀빈508호' ),
(12, 5, 1, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 3, 2, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 1, 3, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 2, 1, '9515863234', 98691,'경기도 성남시','모란동' ),
(12, 3, 2, '9515863234', 98691,'경기도 성남시','모란동' ),
(13, 5, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(13, 3, 3, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(13, 2, 2, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(13, 4, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(13, 5, 3, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(13, 3, 1, '7785153234', 11661,'경기도 평택시','삼성전자기숙사203호' ),
(14, 5, 1, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(14, 3, 1, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(14, 2, 2, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(14, 2, 1,'8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(14, 2, 2, '8441243234', 22686,'전라북도 전주시','한옥동 89길' ),
(15, 5, 1, '44581243234', 33571,'충북 제천시','75길' ),
(15, 3, 1, '44581243234', 33571,'충북 제천시','75길' ),
(15, 2, 1,'44581243234', 33571,'충북 제천시','75길' );

-- PrjOption(프로젝트구매옵션) - Project(프로젝트) 외래키 받음
select
	OptNo, PrjNo, OptName, OptPrice, OptContent
from prjoption;



-- default값 null값 제외
insert into prjoption (prjno, OptName, OptPrice,OptContent)
values (1, '      세트', 100000, '골드 50개 + 고급장비 상자');
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

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (6,'[얼리버드] PDF 생활용품편 1권', 30000, '<제조백과 500> 생활용품편 (PDF) ( x 1 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (6,'PDF 문구편+생활용품편 SET', 35000, '<제조백과 500> 문구편 + 생활용품편 (PDF) ( x 1 )');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (6,'실물책 문구편+생활용품편 SET (배송비 포함)', 40000, '<제조백과 500> 문구편 + 생활용품편 (실물책) ( x 1 )');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (7,'옵션A', 30000, '게이즈온 포 홈 USB-C 골드 케이블 ');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (7,'옵션B', 50000, '게이즈온 포 홈 마블 스탠드 무선충전기');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (7,'옵션C', 100000, '게이즈온 포 홈 마블 스탠드 무선충전기 + 게이즈온 포 홈 화이트 마블 패드 무선충전기 + 게이즈온 포 홈 USB-C 골드 케이블 ');

insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'basic - 기본세트', 30000, '월계수 암시반지 - basic');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'bicolor - 기본세트', 50000, '월계수 암시반지 - bicolor');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'basic - 커플세트', 100000, '월계수 암시반지 - basic*2');
insert into prjoption (prjno,OptName,OptPrice,OptContent)
values (8,'bicolor - 커플세트', 100000, '월계수 암시반지 - bicolor*2');




-- PrjBoard(프로젝트게시판) - Project(프로젝트) 외래키 받음
select 
	PostNo, PrjNo, UserNo,
	PostContent ,PostDate ,PostFile 	
from prjboard;

insert into prjboard values
(00001, 00001, 00003, '고생들했어요', now(), null );
#default값 null값 제외
insert into prjboard (PrjNo, UserNo, PostContent )
values
(2, 3, '고생들했어요'),
(4, 3, '고생들했어요'),
(5, 3, '고생들했어요'),
(1, 2, '잘되고있어요'),
(3, 2, '잘되고있어요'),
(4, 2, '잘되고있어요'),
(5, 2, '잘되고있어요'),
(1, 4, '응원합니다. 화이팅!'),
(2, 4, '응원합니다. 화이팅!');


-- PrjBoardReply(프로젝트게시판답글)
select * from PrjBoard;
select ReplyNo, PostNo, UserNo, ReplyContent from PrjBoardReply;
insert into PrjBoardReply(PostNo, UserNo, ReplyContent)
values
(1, 1, "안녕하세요"),
(1, 2, "안녕하세요"),
(5, 3, "안녕하세요"),
(5, 4, "안녕하세요");





