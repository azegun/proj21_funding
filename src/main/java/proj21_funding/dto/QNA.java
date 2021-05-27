package proj21_funding.dto;

public class QNA {
	private int qnaNo; // 문의번호
	private UserInfo user; // 문의작성자
	private Admin adminId; // 답글작성자
	private String qnaTitle; // 문의제목
	private String qnaContent; // 문의내용
	private String qnaReply; // 문의답변

	public QNA() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QNA(int qnaNo, UserInfo user, Admin adminId, String qnaTitle, String qnaContent, String qnaReply) {
		super();
		this.qnaNo = qnaNo;
		this.user = user;
		this.adminId = adminId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaReply = qnaReply;
	}

	public QNA(int qnaNo, UserInfo user, String qnaTitle, String qnaContent) {
		super();
		this.qnaNo = qnaNo;
		this.user = user;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
	}

	public QNA(int qnaNo, Admin adminId, String qnaReply) {
		super();
		this.qnaNo = qnaNo;
		this.adminId = adminId;
		this.qnaReply = qnaReply;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}

	public Admin getAdminId() {
		return adminId;
	}

	public void setAdminId(Admin adminId) {
		this.adminId = adminId;
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

	@Override
	public String toString() {
		return "QNA [qnaNo=" + qnaNo + ", user=" + user + ", adminId=" + adminId + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaReply=" + qnaReply + "]";
	}

}
