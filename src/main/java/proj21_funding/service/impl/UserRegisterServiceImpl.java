package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.RegisterRequest;
import proj21_funding.dto.UserInfo;
import proj21_funding.exception.DuplicateUserException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserRegisterService;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public int regist(RegisterRequest req) {
		UserInfo userInfo = mapper.selectUserbyId(req.getUserId());
		if (userInfo != null) {
			throw new DuplicateUserException("dup id" + req.getUserId());
		}
		UserInfo newUserInfo = new UserInfo(req.getUserId(), req.getUserPw(), req.getUserName(), req.getAddress(),
				req.getDetailAddress(), req.getUserPhone(), req.getEmail(), req.getBankAccount(), req.getBankName());

		mapper.insertMember(newUserInfo);
		return newUserInfo.getUserNo();
	}

}
