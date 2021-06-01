package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.AuthInfo;
import proj21_funding.dto.UserInfo;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.AuthService;



@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public AuthInfo authenicate(String userId, String userPw) {
		UserInfo userInfo = userInfoMapper.selectUserbyId(userId);
		if (userInfo == null) {
			throw new WrongIdPasswordException();
		}

		if (!userInfo.matchPassword(userPw)) {
			throw new WrongIdPasswordException();
		}

		return new AuthInfo(userInfo.getUserNo(), userInfo.getUserId(), userInfo.getUserName() );

	}

}
