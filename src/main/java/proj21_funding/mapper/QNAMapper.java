package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.QNA;

@Component
public interface QNAMapper {
	
	List<QNA> selectQNAAll();
	
	int insertQNA(QNA qna);
	
	int updateQNA(QNA qna);
	
	int deleteQNA(int qnaNo);
	
}
