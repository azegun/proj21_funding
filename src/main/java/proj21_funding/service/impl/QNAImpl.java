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
		List<QNA> list = mapper.selectQNAAll();
		return list;
	}

	@Override
	public List<QNA> showQNAByUserId(int userNo) {
		List<QNA> list = mapper.selectQNAByUserId(userNo);
		return list;
	}

	@Override
	public List<QNA> showQNAByBC(int categoryNo) {
		List<QNA> list = mapper.selectQNAByBC(categoryNo);
		return list;
	}

	@Override
	public QNA showQNAByNo(int qnaNo) {
		QNA qna = mapper.selectQNAByNo(qnaNo);
		return qna;
	}
	
	@Override
	public int uploadQNA(QNA qna) {
		return mapper.insertQNA(qna);
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
