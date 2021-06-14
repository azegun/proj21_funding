-- proj21_funding
DROP SCHEMA IF EXISTS proj21_funding;

-- proj21_funding
CREATE SCHEMA proj21_funding;

-- 회원정보
DROP TABLE IF EXISTS proj21_funding.UserInfo RESTRICT;

-- 프로젝트
DROP TABLE IF EXISTS proj21_funding.Project RESTRICT;

-- 프로젝트구매옵션
DROP TABLE IF EXISTS proj21_funding.PrjOption RESTRICT;

-- 후원정보
DROP TABLE IF EXISTS proj21_funding.FundingInfo RESTRICT;

-- 관리자
DROP TABLE IF EXISTS proj21_funding.Admin RESTRICT;

-- 메세지
DROP TABLE IF EXISTS proj21_funding.Message RESTRICT;

-- 프로젝트게시판
DROP TABLE IF EXISTS proj21_funding.PrjBoard RESTRICT;

-- Q&A
DROP TABLE IF EXISTS proj21_funding.QnA RESTRICT;

-- 사이트게시판
DROP TABLE IF EXISTS proj21_funding.Board RESTRICT;

-- 글분류
DROP TABLE IF EXISTS proj21_funding.BoardCategory RESTRICT;

-- 주소
DROP TABLE IF EXISTS proj21_funding.addresses RESTRICT;

-- 회원정보
CREATE TABLE proj21_funding.UserInfo (
	UserNo        INT(10)      NOT NULL COMMENT '회원번호', -- 회원번호
	UserId        VARCHAR(10)  NOT NULL COMMENT '회원계정', -- 회원계정
	UserPw        CHAR(41)     NOT NULL COMMENT '비밀번호', -- 비밀번호
	UserName      VARCHAR(20)  NOT NULL COMMENT '회원성명', -- 회원성명
	Nickname      VARCHAR(20)  NOT NULL COMMENT '별명', -- 회원성명	
	UserPhone     VARCHAR(20)  NOT NULL COMMENT '회원H.P', -- 회원H.P
	ZipCode		  INT(10)	   NOT NULL COMMENT '우편번호', -- 우편번호
	Address       VARCHAR(100) NOT NULL COMMENT '주소', -- 주소
	DetailAddress VARCHAR(50)  NULL     COMMENT '상세주소', -- 상세주소	
	Email         VARCHAR(100) NULL     COMMENT '이메일', -- 이메일	
	BankName      VARCHAR(10)  NULL     COMMENT '은행명', -- 은행명
	BankAccount   INT(20)      NULL     COMMENT '계좌번호', -- 계좌번호
	Secession	  TINYINT      NOT NULL DEFAULT 0 COMMENT '탈퇴여부' -- 탈퇴여부
)
COMMENT '회원정보';

-- 회원정보
ALTER TABLE proj21_funding.UserInfo
	ADD CONSTRAINT PK_UserInfo -- 회원정보 기본키
		PRIMARY KEY (
			UserNo -- 회원번호
		);

ALTER TABLE proj21_funding.UserInfo
	MODIFY COLUMN UserNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 프로젝트
CREATE TABLE proj21_funding.Project (
	PrjNo      INT(10)     NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	UserNo     INT(10)     NOT NULL COMMENT '프로젝트관리자', -- 프로젝트관리자
	PrjName    VARCHAR(30) NOT NULL COMMENT '프로젝트명', -- 프로젝트명
	PrjContent LONGTEXT    NOT NULL COMMENT '프로젝트내용', -- 프로젝트내용
	PrjGoal    INT(10)     NOT NULL COMMENT '목표금액', -- 목표금액
	StartDate  DATETIME    NOT NULL DEFAULT now() COMMENT '시작일', -- 시작일
	EndDate    DATETIME    NOT NULL COMMENT '마감일', -- 마감일
	PayDate    DATETIME    NOT NULL COMMENT '결제일', -- 결제일
	EndYN      TINYINT     NOT NULL DEFAULT 0 COMMENT '마감여부' -- 마감여부
)
COMMENT '프로젝트';

-- 프로젝트
ALTER TABLE proj21_funding.Project
	ADD CONSTRAINT PK_Project -- 프로젝트 기본키
		PRIMARY KEY (
			PrjNo -- 프로젝트번호
		);

ALTER TABLE proj21_funding.Project
	MODIFY COLUMN PrjNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '프로젝트번호';

-- 프로젝트구매옵션
CREATE TABLE proj21_funding.PrjOption (
	OptNo      INT(10)     NOT NULL COMMENT '옵션번호', -- 옵션번호
	PrjNo      INT(10)     NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	OptName    VARCHAR(30) NULL     COMMENT '옵션명', -- 옵션명
	OptPrice   INT(30)     NOT NULL COMMENT '옵션금액', -- 옵션금액
	OptContent VARCHAR(100) NOT NULL COMMENT '옵션내용' -- 옵션내용
)
COMMENT '프로젝트구매옵션';

-- 프로젝트구매옵션
ALTER TABLE proj21_funding.PrjOption
	ADD CONSTRAINT PK_PrjOption -- 프로젝트구매옵션 기본키
		PRIMARY KEY (
			OptNo -- 옵션번호
		);

ALTER TABLE proj21_funding.PrjOption
	MODIFY COLUMN OptNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '옵션번호';

-- 후원정보
CREATE TABLE proj21_funding.FundingInfo (
	FundingNo INT(10) NOT NULL COMMENT '후원번호', -- 후원번호
	UserNo    INT(10) NOT NULL COMMENT '회원번호', -- 회원번호
	PrjNo     INT(10) NULL     COMMENT '프로젝트번호', -- 프로젝트번호
	OptNo     INT(10) NOT NULL COMMENT '옵션번호', -- 옵션번호
	AccountNo INT(30) NOT NULL COMMENT '계좌(카드)번호', -- 계좌(카드)번호
	PayYN     TINYINT NOT NULL DEFAULT 0 COMMENT '결제여부', -- 결제여부
	EndYN     TINYINT NOT NULL DEFAULT 0 COMMENT '마감여부' -- 마감여부
)
COMMENT '후원정보';

-- 후원정보
ALTER TABLE proj21_funding.FundingInfo
	ADD CONSTRAINT PK_FundingInfo -- 후원정보 기본키
		PRIMARY KEY (
			FundingNo -- 후원번호
		);

ALTER TABLE proj21_funding.FundingInfo
	MODIFY COLUMN FundingNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '후원번호';

-- 관리자
CREATE TABLE proj21_funding.Admin (
	AdminNo   INT(10)     NOT NULL COMMENT '관리자번호', -- 관리자번호
	AdminId   VARCHAR(10) NOT NULL COMMENT '관리자아이디', -- 관리자아이디
	AdminPw   CHAR(41)    NOT NULL COMMENT '관리자비밀번호', -- 관리자비밀번호
	AdminName VARCHAR(10) NULL     COMMENT '관리자이름', -- 관리자이름
	AdminTel  VARCHAR(20) NULL     COMMENT '관리자연락처' -- 관리자연락처
)
COMMENT '관리자';

-- 관리자
ALTER TABLE proj21_funding.Admin
	ADD CONSTRAINT PK_Admin -- 관리자 기본키
		PRIMARY KEY (
			AdminNo -- 관리자번호
		);

ALTER TABLE proj21_funding.Admin
	MODIFY COLUMN AdminNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '관리자번호';

-- 메세지
CREATE TABLE proj21_funding.Message (
	MsgNo       INT(10)      NOT NULL COMMENT '메세지번호', -- 메세지번호
	SendUser    VARCHAR(10)  NOT NULL COMMENT '발신자', -- 발신자
	ReceiveUser VARCHAR(10)  NOT NULL COMMENT '수신자', -- 수신자
	MsgContent  VARCHAR(100) NOT NULL COMMENT '내용', -- 내용
	SendDate    DATETIME     NOT NULL DEFAULT current_timestamp COMMENT '발신일', -- 발신일
	ReadYN      TINYINT      NOT NULL DEFAULT 0 COMMENT '확인여부', -- 확인여부
	DelSend     TINYINT      NOT NULL DEFAULT 0 COMMENT '보낸메세지삭제', -- 보낸메세지삭제
	DelRecevie  TINYINT      NOT NULL DEFAULT 0 COMMENT '받은메세지삭제' -- 받은메세지삭제
)
COMMENT '메세지';

-- 메세지
ALTER TABLE proj21_funding.Message
	ADD CONSTRAINT PK_Message -- 메세지 기본키
		PRIMARY KEY (
			MsgNo -- 메세지번호
		);

ALTER TABLE proj21_funding.Message
	MODIFY COLUMN MsgNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '메세지번호';

-- 프로젝트게시판
CREATE TABLE proj21_funding.PrjBoard (
	PostNo      INT(10)     NOT NULL COMMENT '게시글번호', -- 게시글번호
	PrjNo       INT(10)     NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
	UserNo      INT(10)     NOT NULL COMMENT '글작성자', -- 글작성자
	PostTitle   VARCHAR(50) NOT NULL COMMENT '게시글제목', -- 게시글제목
	PostContent LONGTEXT    NOT NULL COMMENT '게시글내용', -- 게시글내용
	PostDate    DATETIME    NOT NULL DEFAULT current_timestamp COMMENT '게시글날짜', -- 게시글날짜
	PostFile    VARCHAR(50) NULL     COMMENT '첨부파일' -- 첨부파일
)
COMMENT '프로젝트게시판';

-- 프로젝트게시판
ALTER TABLE proj21_funding.PrjBoard
	ADD CONSTRAINT PK_PrjBoard -- 프로젝트게시판 기본키
		PRIMARY KEY (
			PostNo, -- 게시글번호
			PrjNo   -- 프로젝트번호
		);

ALTER TABLE proj21_funding.PrjBoard
	MODIFY COLUMN PostNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- Q&A
CREATE TABLE proj21_funding.QnA (
	QnaNo      INT(10)      NOT NULL COMMENT '문의번호', -- 문의번호
	UserNo     INT(10)      NOT NULL COMMENT '문의작성자', -- 문의작성자
	AdminNo    INT(10)      NULL     COMMENT '답변작성자', -- 답변작성자
	CategoryNo INT(1)       NOT NULL COMMENT '글 분류', -- 글 분류
	QnaTitle   VARCHAR(50)  NOT NULL COMMENT '문의제목', -- 문의제목
	QnaContent LONGTEXT     NOT NULL COMMENT '문의내용', -- 문의내용
	QnaDate    DATETIME     NOT NULL DEFAULT current_timestamp COMMENT '문의날짜', -- 문의날짜
	QnaReply   VARCHAR(300) NULL     COMMENT '문의답변', -- 문의답변
	ReplyDate  DATETIME     NULL     COMMENT '답변날짜', -- 답변날짜
	QnaFile    VARCHAR(50)  NULL     COMMENT '문의첨부파일' -- 문의첨부파일
)
COMMENT 'Q&A';

-- Q&A
ALTER TABLE proj21_funding.QnA
	ADD CONSTRAINT PK_QnA -- Q&A 기본키
		PRIMARY KEY (
			QnaNo -- 문의번호
		);

ALTER TABLE proj21_funding.QnA
	MODIFY COLUMN QnaNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '문의번호';

-- 사이트게시판
CREATE TABLE proj21_funding.Board (
	BoardNo        INT(10)     NOT NULL COMMENT '게시글번호', -- 게시글번호
	CategoryNo     INT(1)      NOT NULL COMMENT '글 분류', -- 글 분류
	BoardTitle     VARCHAR(50) NOT NULL COMMENT '공지제목', -- 공지제목
	BoardContent   LONGTEXT    NOT NULL COMMENT '공지내용', -- 공지내용
	BoardDate      DATETIME    NOT NULL DEFAULT current_timestamp COMMENT '작성일', -- 작성일
	BoardReadCount INTEGER(5)  NULL     default 0 COMMENT '조회수' -- 조회수
)
COMMENT '사이트게시판';

-- 사이트게시판
ALTER TABLE proj21_funding.Board
	ADD CONSTRAINT PK_Board -- 사이트게시판 기본키
		PRIMARY KEY (
			BoardNo -- 게시글번호
		);

ALTER TABLE proj21_funding.Board
	MODIFY COLUMN BoardNo INT(10) NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

-- 글분류
CREATE TABLE proj21_funding.BoardCategory (
	CategoryNo   INT(1)      NOT NULL COMMENT '글 분류', -- 글 분류
	CategoryName VARCHAR(10) NOT NULL COMMENT '분류명', -- 분류명
	CategoryClass VARCHAR(10) not null COMMENT '적용 카테고리' -- 적용 카테고리 (ex. qna / notice)
)
COMMENT '글분류';

-- 글분류
ALTER TABLE proj21_funding.BoardCategory
	ADD CONSTRAINT PK_BoardCategory -- 글분류 기본키
		PRIMARY KEY (
			CategoryNo -- 글 분류
		);

ALTER TABLE proj21_funding.BoardCategory
	MODIFY COLUMN CategoryNo INT(1) NOT NULL AUTO_INCREMENT COMMENT '글 분류';

-- 주소
CREATE TABLE proj21_funding.addresses (
	addr_id INT(11)     NOT NULL COMMENT '주소코드', -- 주소코드
	street  VARCHAR(50) NOT NULL COMMENT '도로', -- 도로
	city    VARCHAR(50) NOT NULL COMMENT '시', -- 시
	state   VARCHAR(50) NOT NULL COMMENT '구', -- 구
	zip     VARCHAR(10) NULL     COMMENT '우편번호', -- 우편번호
	country VARCHAR(50) NOT NULL COMMENT '읍' -- 읍
)
COMMENT '주소';

-- 주소
ALTER TABLE proj21_funding.addresses
	ADD CONSTRAINT
		PRIMARY KEY (
			addr_id -- 주소코드
		);


-- 프로젝트
ALTER TABLE proj21_funding.Project
	ADD CONSTRAINT FK_UserInfo_TO_Project -- 회원정보 -> 프로젝트
		FOREIGN KEY (
			UserNo -- 프로젝트관리자
		)
		REFERENCES proj21_funding.UserInfo ( -- 회원정보
			UserNo -- 회원번호
		);

-- 프로젝트구매옵션
ALTER TABLE proj21_funding.PrjOption
	ADD CONSTRAINT FK_Project_TO_PrjOption -- 프로젝트 -> 프로젝트구매옵션
		FOREIGN KEY (
			PrjNo -- 프로젝트번호
		)
		REFERENCES proj21_funding.Project ( -- 프로젝트
			PrjNo -- 프로젝트번호
		);

-- 후원정보
ALTER TABLE proj21_funding.FundingInfo
	ADD CONSTRAINT FK_UserInfo_TO_FundingInfo -- 회원정보 -> 후원정보
		FOREIGN KEY (
			UserNo -- 회원번호
		)
		REFERENCES proj21_funding.UserInfo ( -- 회원정보
			UserNo -- 회원번호
		);

-- 후원정보
ALTER TABLE proj21_funding.FundingInfo
	ADD CONSTRAINT FK_Project_TO_FundingInfo -- 프로젝트 -> 후원정보
		FOREIGN KEY (
			PrjNo -- 프로젝트번호
		)
		REFERENCES proj21_funding.Project ( -- 프로젝트
			PrjNo -- 프로젝트번호
		);

-- 프로젝트게시판
ALTER TABLE proj21_funding.PrjBoard
	ADD CONSTRAINT FK_Project_TO_PrjBoard -- 프로젝트 -> 프로젝트게시판
		FOREIGN KEY (
			PrjNo -- 프로젝트번호
		)
		REFERENCES proj21_funding.Project ( -- 프로젝트
			PrjNo -- 프로젝트번호
		);

-- Q&A
ALTER TABLE proj21_funding.QnA
	ADD CONSTRAINT FK_UserInfo_TO_QnA -- 회원정보 -> Q&A
		FOREIGN KEY (
			UserNo -- 문의작성자
		)
		REFERENCES proj21_funding.UserInfo ( -- 회원정보
			UserNo -- 회원번호
		);

-- Q&A
ALTER TABLE proj21_funding.QnA
	ADD CONSTRAINT FK_BoardCategory_TO_QnA -- 글분류 -> Q&A
		FOREIGN KEY (
			CategoryNo -- 글 분류
		)
		REFERENCES proj21_funding.BoardCategory ( -- 글분류
			CategoryNo -- 글 분류
		);

-- Q&A
ALTER TABLE proj21_funding.QnA
	ADD CONSTRAINT FK_Admin_TO_QnA -- 관리자 -> Q&A
		FOREIGN KEY (
			AdminNo -- 답변작성자
		)
		REFERENCES proj21_funding.Admin ( -- 관리자
			AdminNo -- 관리자번호
		);

-- 사이트게시판
ALTER TABLE proj21_funding.Board
	ADD CONSTRAINT FK_BoardCategory_TO_Board -- 글분류 -> 사이트게시판
		FOREIGN KEY (
			CategoryNo -- 글 분류
		)
		REFERENCES proj21_funding.BoardCategory ( -- 글분류
			CategoryNo -- 글 분류
		);