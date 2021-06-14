package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.dto.account.UserSignUp;
import proj21_funding.exception.DuplicateUserException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserRegisterService;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public int regist(UserSignUp userSignUp) {
		UserInfo userInfo = mapper.selectUserbyId(userSignUp.getUserId());
		if (userInfo != null) {
			throw new DuplicateUserException("dup id" + userSignUp.getUserId());
		}
		UserInfo newUserInfo = new UserInfo(
				userSignUp.getUserId(), userSignUp.getUserPw(), userSignUp.getUserName(),
				userSignUp.getNickname(), userSignUp.getUserPhone(), userSignUp.getZipCode(),
				userSignUp.getAddress(), userSignUp.getDetailAddress(), userSignUp.getEmail(),
				userSignUp.getBankName(), userSignUp.getBankAccount());

		mapper.insertUser(newUserInfo);
		return newUserInfo.getUserNo();
	}

}
