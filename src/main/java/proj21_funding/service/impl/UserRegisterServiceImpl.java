package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.UserSignUp;
import proj21_funding.dto.UserInfo;
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
		UserInfo newUserInfo = new UserInfo(userSignUp.getUserId(), userSignUp.getUserPw(), userSignUp.getUserName(), userSignUp.getAddress(),
				userSignUp.getDetailAddress(), userSignUp.getUserPhone(), userSignUp.getEmail(), userSignUp.getBankAccount(), userSignUp.getBankName());

		mapper.insertUser(newUserInfo);
		return newUserInfo.getUserNo();
	}

}
