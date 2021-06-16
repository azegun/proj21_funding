package proj21_funding.dto.account;

public class UserMail {

	private String address;  //메일수신자
	private String title;	//메일제목
	private String message;	//메일내용

	public UserMail() {
		// TODO Auto-generated constructor stub
	}

	public UserMail(String address, String title, String message) {
		this.address = address;
		this.title = title;
		this.message = message;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
