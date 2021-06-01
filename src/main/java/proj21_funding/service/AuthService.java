package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.AuthInfo;



@Service
public interface AuthService {
	AuthInfo authenicate(String userId, String userPw);
}
