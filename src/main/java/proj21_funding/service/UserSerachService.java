package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;

@Service
public interface UserSerachService {

	UserInfo searchuserId(String userName, String userPhone);

	UserInfo searchuserPw(String userId, String userName, String userPhone);
	
	void changePassword(String userId, String newPwd);
	
}
