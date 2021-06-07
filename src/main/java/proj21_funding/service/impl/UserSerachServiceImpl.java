package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserSerachService;

@Service
public class UserSerachServiceImpl implements UserSerachService {

	@Autowired
	private UserInfoMapper mapper;

	@Override
	public UserInfo seachuserId(String userName, String userPhone) {
		try {
			UserInfo userInfo = mapper.selectUserbySearchId(userName, userPhone);
			return userInfo;
		} catch (NullPointerException e) {
			return null;
		}

	}

	@Override
	public UserInfo seachuserPw(String userId, String userName, String userPhone) {

		try {
			UserInfo userInfo1 = mapper.selectUserbyId(userId);
			UserInfo userInfo2 = mapper.selectUserbySearchId(userName, userPhone);
			if (userInfo1 == userInfo2) {
				return userInfo1;
			} else {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			return null;
		}

	}

}
