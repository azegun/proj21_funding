package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.Message;

@Component
public interface MessageMapper {

	int insertMessage(Message message);	
	
	List<Message> selectBySendUser(String sendUser);

	List<Message> selectByreceiveUser(String receiveUser);	

	List<Message> selectByRead(String receiveUser);
	
	Message selectByMsgNo(int msgNo);
}
