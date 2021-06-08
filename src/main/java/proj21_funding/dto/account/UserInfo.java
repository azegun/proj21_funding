package proj21_funding.dto.account;

// 회원정보 
public class UserInfo {
	private int userNo; // 회원번호
	private String userId; // 회원계정
	private String userPw; // 비밀번호
	private String userName; // 회원성명
	private String userPhone; // 회원H.P
	private int zipCode; // 우편번호
	private String address; // 주소
	private String detailAddress;// 상세주소
	private String email; // 이메일
	private String bankName; // 은행명
	private int bankAccount; // 계좌번호

	
	public UserInfo(String userId) {
		this.userId = userId;
	}

	public UserInfo(String userId, String userPw, String userName, String userPhone, int zipCode, String address,
			String detailAddress, String email, String bankName, int bankAccount) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.zipCode = zipCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.email = email;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
	}

	// 생성자
	public UserInfo() {
	}

	// 회원번호
	public UserInfo(int userNo) {
		this.userNo = userNo;
	}

	// getter & setter
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
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

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public int getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(int bankAccount) {
		this.bankAccount = bankAccount;
	}

	@Override
	public String toString() {
		return String.format(
				"UserInfo [userNo=%s, userId=%s, userPw=%s, userName=%s, userPhone=%s, zipCode=%s, address=%s, detailAddress=%s, email=%s, bankName=%s, bankAccount=%s]",
				userNo, userId, userPw, userName, userPhone, zipCode, address, detailAddress, email, bankName,
				bankAccount);
	}

}
