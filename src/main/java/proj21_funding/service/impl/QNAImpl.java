package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.QNA;
import proj21_funding.mapper.QNAMapper;
import proj21_funding.service.QNAService;

@Service
public class QNAImpl implements QNAService {
	
	@Autowired
	QNAMapper mapper;

	@Override
	public List<QNA> showQNAAll() {
		return mapper.selectQNAAll();
	}

	@Override
	public List<QNA> showQNAByUserId(int userNo) {
		return mapper.selectQNAByUserId(userNo);
	}

	@Override
	public List<QNA> showQNAByBC(int categoryNo) {
		return mapper.selectQNAByBC(categoryNo);
	}

	@Override
	public int uploadQNA(QNA qna) {
		QNA newqna = new QNA(qna.getUserNo(), qna.getCategoryNo(), qna.getQnaTitle(), qna.getQnaContent(), qna.getQnaFile());
		return mapper.insertQNA(newqna);
	}

	@Override
	public int replyQNA(QNA qna) {
		return 0;
	}

	@Override
	public int removeQNA(int qnaNo) {
		return mapper.deleteQNA(qnaNo);
	}

}
