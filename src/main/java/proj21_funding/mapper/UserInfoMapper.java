package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.account.UserInfo;

@Component
public interface UserInfoMapper {

//	List<UserInfo> selectUserAll();

//	UserInfo selectUserbyNo(int userNo);

	UserInfo selectUserbyId(String userId);
	
	UserInfo selectUserbylogin(String userId, String userPw);

	int insertUser(UserInfo userInfo);

	int updateUser(UserInfo userInfo);

	int deleteUser(UserInfo userInfo);

}
