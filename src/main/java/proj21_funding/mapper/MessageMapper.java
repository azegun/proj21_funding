package proj21_funding.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import proj21_funding.dto.Message;

@Component
public interface MessageMapper {

	// 받은 메세지
	int countBySendUser(String sendUser);
	
	List<Message> selectBySendUser(@Param("sendUser")String sendUser,@Param("pageSearch") int pageSearch,@Param("cntPerPage") int cntPerPage);

	List<Message> selectByreceiveUser(String receiveUser);	

	List<Message> selectByRead(String receiveUser);
	
	Message selectByMsgNo(int msgNo);
	
	int insertMessage(Message message);	
	
	int updateMessage(Message message);	
	
	int delReceiveMessage(Message message);	
	
	int delSendMessage(Message message);	
	
}
