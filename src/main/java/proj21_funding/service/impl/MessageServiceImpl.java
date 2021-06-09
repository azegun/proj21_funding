package proj21_funding.service.impl;

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

}
