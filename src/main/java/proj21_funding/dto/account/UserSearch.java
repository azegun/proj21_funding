package proj21_funding.dto.account;

public class UserSearch {
	private String userId; // 회원계정
	private String userName; // 회원성명
	private String userPhone; // 회원H.P

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	@Override
	public String toString() {
		return String.format("UserSearch [userId=%s, userName=%s, userPhone=%s]", userId, userName, userPhone);
	}

}
