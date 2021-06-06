package proj21_funding.service.impl;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.exception.WrongIdPasswordException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	private static final Log log = LogFactory.getLog(UserInfoServiceImpl.class);

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public int modifyUserInfo(UserInfo userInfo) {
		return mapper.updateUser(userInfo);
	}

	@Override
	public int removeUserInfo(String userId, String userPw) {
		UserInfo userInfo = mapper.selectUserbylogin(userId, userPw);
		if (userInfo == null) {
			throw new WrongIdPasswordException();
		}
		return mapper.deleteUser(userInfo);
	}

}
