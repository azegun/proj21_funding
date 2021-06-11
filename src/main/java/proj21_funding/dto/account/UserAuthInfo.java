package proj21_funding.dto.account;

// 로그인상태 유지중 유저정보 저장
public class UserAuthInfo {

	private int userNo; // 회원번호
	private String userId; // 회원계정
	private String userName; // 회원성명
	private String nickname; // 회원별명
	private String userPhone; // 회원H.P
	private int zipCode; // 우편번호
	private String address; // 주소
	private String detailAddress;// 상세주소
	private String email; // 이메일
	private String bankName; // 은행명
	private int bankAccount; // 계좌번호

	public UserAuthInfo() {
		// TODO Auto-generated constructor stub
	}

	public UserAuthInfo(int userNo, String userId, String userName, String nickname, String userPhone, int zipCode,
			String address, String detailAddress, String email, String bankName, int bankAccount) {
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.nickname = nickname;
		this.userPhone = userPhone;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.email = email;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
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

	public String getNickname() {
		return nickname;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public int getZipCode() {
		return zipCode;
	}

	public String getAddress() {
		return address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public String getEmail() {
		return email;
	}

	public String getBankName() {
		return bankName;
	}

	public int getBankAccount() {
		return bankAccount;
	}

	@Override
	public String toString() {
		return String.format(
				"UserAuthInfo [userNo=%s, userId=%s, userName=%s, nickname=%s, userPhone=%s, zipCode=%s, address=%s, detailAddress=%s, email=%s, bankName=%s, bankAccount=%s]",
				userNo, userId, userName, nickname, userPhone, zipCode, address, detailAddress, email, bankName,
				bankAccount);
	}

}
