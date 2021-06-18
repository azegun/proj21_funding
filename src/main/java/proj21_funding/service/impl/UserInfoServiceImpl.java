package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserLogin;
import proj21_funding.exception.DuplicateEmailException;
import proj21_funding.exception.DuplicateNickNameException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public int modifyUserInfo(UserInfo userInfo) {
		UserInfo userInfo1 = mapper.selectUserbyNickname(userInfo.getNickName());

		if (userInfo.getNickName().equals("관리자")) {
			throw new DuplicateNickNameException("dup nickname" + userInfo.getNickName());
		}

		if (userInfo1 != null) {
			if (userInfo.getUserId().equals(userInfo1.getUserId())) {
			} else {
				throw new DuplicateNickNameException("dup nickname" + userInfo.getNickName());
			}
		}

		UserInfo userInfo2 = mapper.selectUserbyEmail(userInfo.getEmail());
		if (userInfo2 != null) {
			if (userInfo.getEmail().equals(userInfo2.getEmail())) {
			} else {
				throw new DuplicateEmailException();
			}
			
		}
		
		return mapper.updateUser(userInfo);
	}

	@Override
	public int removeUserInfo(String userId, String userPw) {
		UserLogin userLogin = new UserLogin(userId, userPw);
		UserInfo userInfo = mapper.selectUserbylogin(userLogin);
		return mapper.deleteUser(userInfo);
	}

	@Override
	public UserInfo showUserInfoById(String userId) {
		return mapper.selectUserbyId(userId);
	}

	@Override
	public List<UserInfo> showUserAll() {
		return mapper.selectUserAll();
	}

}
