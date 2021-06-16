package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserMail;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserSerachService;


@Service
public class UserSerachServiceImpl implements UserSerachService {

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public UserInfo searchuserId(String userName, String email) {
		try {
			UserInfo user = new UserInfo(userName, email);			
			UserInfo userInfo = mapper.selectUserbySearchId(user);			
			return userInfo;
		} catch (NullPointerException e) {
			return null;
		}

	}

	@Override
	public UserInfo searchuserPw(String userId, String userName, String email) {

		try {
			UserInfo user = new UserInfo(userName, email);
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

	@Override
	public UserMail createMailAndChangePassword(String userName, String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePassword(String str, String email) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getTempPassword() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void mailSend(UserMail userMail) {
		// TODO Auto-generated method stub
		
	}

}
