package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.UserInfo;

@Component
public interface UserInfoMapper {

	List<UserInfo> selectUserAll();

	UserInfo selectUserbyNo(int userNo);

	UserInfo selectUserbyId(String userId);

	UserInfo selectUserbyEmail(String email);

	int insertUser(UserInfo userInfo);

	int updateUser(UserInfo userInfo);

	int deleteUser(int userNo);

}
