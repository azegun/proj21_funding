package proj21_funding.dto.account;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class UserMail  extends Authenticator{
	PasswordAuthentication passAuth;

	public UserMail() {
		passAuth = new PasswordAuthentication("mywns1231@gmail.com", "");
	}

	public PasswordAuthentication getPassAuth() {
		return passAuth;
	}

	

}
