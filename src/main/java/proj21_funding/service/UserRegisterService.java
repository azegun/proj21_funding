package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.RegisterRequest;

@Service
public interface UserRegisterService {
	int regist(RegisterRequest req);
}
