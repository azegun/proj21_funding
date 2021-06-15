package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserSerachService;

@Service
public class UserSerachServiceImpl implements UserSerachService {

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public UserInfo searchuserId(String userName, String userPhone) {
		try {
			UserInfo user = new UserInfo(userName, userPhone);
			UserInfo userInfo = mapper.selectUserbySearchId(user);
			return userInfo;
		} catch (NullPointerException e) {
			return null;
		}

	}

	@Override
	public UserInfo searchuserPw(String userId, String userName, String userPhone) {

		try {
			UserInfo user = new UserInfo(userName, userPhone);
			UserInfo userInfo1 = mapper.selectUserbyId(userId);
			UserInfo userInfo2 = mapper.selectUserbySearchId(user);
						
			if (userInfo1 != null && userInfo2 != null) {
				return userInfo1;
			} else {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			return null;
		}
	}
	
	@Transactional
	public void changePassword(String userId, String newPwd) {
		UserInfo userInfo = mapper.selectUserbyId(userId);
		if (userInfo == null) {
			throw new WrongIdPasswordException();
		}	
		userInfo.setUserPw(newPwd);		
		mapper.updateUserPw(userInfo);
	}

}
