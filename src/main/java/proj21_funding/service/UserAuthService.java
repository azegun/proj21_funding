package proj21_funding.service;

import org.springframework.stereotype.Service;
import proj21_funding.dto.account.UserAuthInfo;
@Service
public interface UserAuthService {
	UserAuthInfo authenicate(String userId, String userPw);
}
