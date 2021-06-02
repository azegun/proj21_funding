package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.UserAuthInfo;
import proj21_funding.dto.UserInfo;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserAuthService;



@Service
public class UserAuthServiceImpl implements UserAuthService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public UserAuthInfo authenicate(String userId, String userPw) {
		UserInfo userInfo = userInfoMapper.selectUserbyId(userId);
		if (userInfo == null) {
			throw new WrongIdPasswordException();
		}

		if (!userInfo.matchPassword(userPw)) {
			throw new WrongIdPasswordException();
		}

		return new UserAuthInfo(userInfo.getUserNo(), userInfo.getUserId(), userInfo.getUserName() );

	}

}
