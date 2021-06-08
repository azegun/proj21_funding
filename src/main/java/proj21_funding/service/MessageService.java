package proj21_funding.service;

import org.springframework.stereotype.Service;

import proj21_funding.dto.Message;

@Service
public interface MessageService {

	int sendMessage(Message message);
}
