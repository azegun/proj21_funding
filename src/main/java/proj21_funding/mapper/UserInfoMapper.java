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

	int insertMember(UserInfo userInfo);

	int updateMember(UserInfo userInfo);

	int deleteMember(int userNo);

}
