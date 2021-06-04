package proj21_funding.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import proj21_funding.dto.UserInfo;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.UserChangePwService;


@Service
public class UserChangePwServiceImpl implements UserChangePwService {

	@Autowired
	private UserInfoMapper mapper;

	@Transactional
	public void changePassword(String userId, String oldPwd, String newPwd) {
		UserInfo userInfo = mapper.selectUserbyId(userId);
		if (userInfo == null) {
			throw new UserNotFoundException();
		}
		userInfo.changePassword(oldPwd, newPwd);
		mapper.updateUser(userInfo);

	}

}
