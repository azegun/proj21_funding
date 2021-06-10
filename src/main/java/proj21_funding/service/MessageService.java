package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.Message;

@Service
public interface MessageService {

	

	List<Message> showBySendUser(String sendUser);

	List<Message> showByreceiveUser(String receiveUser);

	List<Message> showByreceiveUserUnRead(String receiveUser);
	
	Message showByMsgNo(int msgNo);
	
	int sendMessage(Message message);
	
	int readMessage(Message message);
	
}
