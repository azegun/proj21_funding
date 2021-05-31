package proj21_funding.dto;

public class QNA {

	private int qnaNo; // 문의번호
	private UserInfo userNo; // 문의작성자
	private Admin adminNo; // 답변작성자
	private BoardCategory categoryNo; // 글 분류
	private String qnaTitle; // 문의제목
	private String qnaContent; // 문의내용
	private String qnaReply; // 문의답변
	private String qnaFile; // 문의첨부파일

	public QNA() {
		super();
	}

	public QNA(int qnaNo, UserInfo userNo, Admin adminNo, BoardCategory categoryNo, String qnaTitle, String qnaContent,
			String qnaReply, String qnaFile) {
		super();
		this.qnaNo = qnaNo;
		this.userNo = userNo;
		this.adminNo = adminNo;
		this.categoryNo = categoryNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaReply = qnaReply;
		this.qnaFile = qnaFile;
	}
	
	// 질문 작성자로 검색
	public QNA(UserInfo userNo) {
		super();
		this.userNo = userNo;
	}

	// 질문 카테고리로 검색
	public QNA(BoardCategory categoryNo) {
		super();
		this.categoryNo = categoryNo;
	}

	
	/* Getter & Setter */
	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public UserInfo getUserNo() {
		return userNo;
	}

	public void setUserNo(UserInfo userNo) {
		this.userNo = userNo;
	}

	public Admin getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(Admin adminNo) {
		this.adminNo = adminNo;
	}

	public BoardCategory getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(BoardCategory categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaReply() {
		return qnaReply;
	}

	public void setQnaReply(String qnaReply) {
		this.qnaReply = qnaReply;
	}

	public String getQnaFile() {
		return qnaFile;
	}

	public void setQnaFile(String qnaFile) {
		this.qnaFile = qnaFile;
	}
	
	/* toString */
	@Override
	public String toString() {
		return "QNA [qnaNo=" + qnaNo + ", userNo=" + userNo + ", adminNo=" + adminNo + ", categoryNo=" + categoryNo
				+ ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaReply=" + qnaReply + ", qnaFile="
				+ qnaFile + "]";
	}

}
