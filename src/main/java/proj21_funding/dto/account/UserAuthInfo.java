package proj21_funding.dto.account;

// 로그인상태 유지중 유저정보 저장
public class UserAuthInfo {

	private int userNo; // 회원번호
	private String userId; // 회원계정
	private String nickname; // 회원별명

	public UserAuthInfo() {
		// TODO Auto-generated constructor stub
	}

	public UserAuthInfo(int userNo, String userId, String nickname) {
		this.userNo = userNo;
		this.userId = userId;
		this.nickname = nickname;
	}

	// getter & setter
	public int getUserNo() {
		return userNo;
	}

	public String getUserId() {
		return userId;
	}

	public String getNickname() {
		return nickname;
	}

	@Override
	public String toString() {
		return String.format("UserAuthInfo [userNo=%s, userId=%s, nickname=%s]", userNo, userId, nickname);
	}

}
