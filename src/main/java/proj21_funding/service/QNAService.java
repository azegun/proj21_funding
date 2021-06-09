package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;

import proj21_funding.dto.QNA;

@Service
public interface QNAService {

	List<QNA> showQNAAll();

	List<QNA> showQNAByUserId(int userNo);
	
	List<QNA> showQNAByBC(int categoryNo);
	
	int uploadQNA (QNA qna);
	
	int replyQNA (QNA qna);
	
	int removeQNA (int qnaNo);
	
}
