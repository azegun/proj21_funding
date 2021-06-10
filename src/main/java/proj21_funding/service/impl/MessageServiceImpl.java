package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Message;
import proj21_funding.exception.UserNotFoundException;
import proj21_funding.mapper.MessageMapper;
import proj21_funding.mapper.UserInfoMapper;
import proj21_funding.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageMapper mapper;

	@Autowired
	private UserInfoMapper userMapper;

	@Override
	public int sendMessage(Message message) {
		try {			
			userMapper.selectUserbyId(message.getSendUser());
			userMapper.selectUserbyId(message.getReceiveUser());
		} catch (NullPointerException e) {
			throw new UserNotFoundException();
		}
		Message newMessage = new Message(message.getSendUser(), message.getReceiveUser(), message.getMsgContent());
		return mapper.insertMessage(newMessage);
	}

	@Override
	public List<Message> showBySendUser(String sendUser) {		
		return mapper.selectBySendUser(sendUser);
	}

	@Override
	public List<Message> showByreceiveUser(String receiveUser) {			
		return mapper.selectByreceiveUser(receiveUser);
	}

	@Override
	public List<Message> showByreceiveUserUnRead(String receiveUser) {
		return mapper.selectByRead(receiveUser);
	}

	@Override
	public Message showByMsgNo(int msgNo) {		
		return mapper.selectByMsgNo(msgNo);
	}

	@Override
	public int readMessage(Message message) {		
		return mapper.updateMessage(message);
	}

	@Override
	public int removeMessage(Message message) {	
		return mapper.deleteMessage(message);
	}

}
