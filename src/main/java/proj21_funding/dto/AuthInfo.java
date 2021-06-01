package proj21_funding.dto;

// 로그인상태 유지중 유저정보 저장
public class AuthInfo {

	private int userNo; // 회원번호
	private String userId; // 회원계정
	private String userName; // 회원성명

	public AuthInfo() {
		// TODO Auto-generated constructor stub
	}

	public AuthInfo(int userNo, String userId, String userName) {
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
	}

	// getter & setter
	public int getUserNo() {
		return userNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

}
