package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;

@Service
public interface UserInfoService {

	int modifyUserInfo(UserInfo userInfo);

	int removeUserInfo(String userId, String userPw);
}
