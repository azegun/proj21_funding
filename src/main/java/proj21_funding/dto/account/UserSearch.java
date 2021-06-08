package proj21_funding.dto.account;

import javax.validation.constraints.Size;

public class UserSearch {
	private String userId; // 회원계정
	private String userName; // 회원성명
	private String userPhone; // 회원H.P
	@Size(min = 4)
	private String newUserPw; // 변경할비밀번호
	@Size(min = 4)
	private String confirmUserPw; // 비밀번호 확인

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

	public String getNewUserPw() {
		return newUserPw;
	}

	public void setNewUserPw(String newUserPw) {
		this.newUserPw = newUserPw;
	}

	public String getConfirmUserPw() {
		return confirmUserPw;
	}

	public void setConfirmUserPw(String confirmUserPw) {
		this.confirmUserPw = confirmUserPw;
	}

	public boolean isPasswordEqualToComfirmPassword() {
		return newUserPw.equals(confirmUserPw);
	}

	@Override
	public String toString() {
		return String.format("UserSearch [userId=%s, userName=%s, userPhone=%s, newUserPw=%s, confirmUserPw=%s]",
				userId, userName, userPhone, newUserPw, confirmUserPw);
	}

}
