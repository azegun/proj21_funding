package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.account.UserInfo;

@Service
public interface UserSerachService {

	UserInfo seachuserId(String userName, String userPhone);

	UserInfo seachuserPw(String userId, String userName, String userPhone);

}
