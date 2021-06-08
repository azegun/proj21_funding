package proj21_funding.mapper;

import org.springframework.stereotype.Component;

import proj21_funding.dto.Message;

@Component
public interface MessageMapper {

	Message selectBySendUser(String sendUser);

	Message selectByreceiveUser(String receiveUser);
	
	int insertMessage(Message message);	

	Message selectByRead(boolean readYN);
	
	
}
