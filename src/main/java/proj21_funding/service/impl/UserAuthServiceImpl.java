package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Admin;
import proj21_funding.dto.account.UserAuthInfo;
import proj21_funding.dto.account.UserInfo;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.mapper.AdminMapper;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserAuthService;

@Service
public class UserAuthServiceImpl implements UserAuthService {

	@Autowired
	private UserInfoMapper userInfoMapper;

	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public UserAuthInfo authenicate(String userId, String userPw) {

		UserInfo userInfo = userInfoMapper.selectUserbylogin(userId, userPw);
		Admin admin = adminMapper.selectAdminbylogin(userId, userPw);
		if (userInfo == null && admin == null) {
			throw new WrongIdPasswordException();
		}
			
		if(admin != null) {
			return new UserAuthInfo(-admin.getAdminNo(), admin.getAdminId(), admin.getAdminName(), "관리자"+ admin.getAdminNo());
		}else {
			if(userInfo.isSecession()) {
				throw new UserNotFoundException();
			}
			return new UserAuthInfo(userInfo.getUserNo(), userInfo.getUserId(), userInfo.getUserName(), userInfo.getNickName());
		}

	}

}
