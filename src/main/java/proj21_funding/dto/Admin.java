package proj21_funding.dto;

public class Admin {

	private String adminId; // 관리자아이디
	private String adminPw; // 관리자비밀번호
	private String adminName; // 관리자이름
	private String adminTel; // 관리자연락처

	public Admin() {
		super();
	}

	public Admin(String adminId, String adminPw, String adminName, String adminTel) {
		super();
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.adminName = adminName;
		this.adminTel = adminTel;
	}

	public Admin(String adminId, String adminName, String adminTel) {
		super();
		this.adminId = adminId;
		this.adminName = adminName;
		this.adminTel = adminTel;
	}
	
	/* getter & setter */
	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminTel() {
		return adminTel;
	}

	public void setAdminTel(String adminTel) {
		this.adminTel = adminTel;
	}
	
	/* toString */
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminPw=" + adminPw + ", adminName=" + adminName + ", adminTel="
				+ adminTel + "]";
	}

}
