package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.UserSignUp;

@Service
public interface UserRegisterService {
	int regist(UserSignUp req);
}
