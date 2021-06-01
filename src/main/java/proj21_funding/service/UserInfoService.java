package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.UserInfo;

@Service
public interface UserInfoService {

	List<UserInfo> showUserInfos();

	UserInfo showUserInfobyNo(int userNo);

	UserInfo showUserInfobyId(String userId);

	UserInfo showUserInfobyEmail(String email);

	int resisterUserInfo(UserInfo userInfo);

	int modifyUserInfo(UserInfo userInfo);

	int removeUserInfo(int userNo);
}
