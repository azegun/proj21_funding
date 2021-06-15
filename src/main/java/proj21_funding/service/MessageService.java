package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.FundingInfo;
import proj21_funding.dto.Message;
import proj21_funding.dto.Project;
import proj21_funding.dto.account.UserInfo;

@Service
public interface MessageService {

	List<Message> showBySendUser(String sendUser);

	List<Message> showByreceiveUser(String receiveUser);

	List<Message> showByreceiveUserUnRead(String receiveUser);
	
	Message showByMsgNo(int msgNo);
	
	int sendMessage(Message message);
	
	int readMessage(Message message);

	int removeReceiveMessage(Message message);
	
	int removeSendMessage(Message message);
	
	List<Project> showProjectsByUser(int userNo);
	
	List<FundingInfo> showFundingInfosByPrjNo(int prjNo);
	
	UserInfo showUserbyNo(int userNo);
	
}
