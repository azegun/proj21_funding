package proj21_funding.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import proj21_funding.dto.PrjBoard;

@Component
public interface PrjBoardMapper {
	List<PrjBoard> selectPrjBoardbyPrjNo(int prjNo);

	List<PrjBoard> selectPrjBoardbyUserNo(PrjBoard prjBoard);

	int insertPrjBoard(PrjBoard prjBoard);

	int updatePrjBoard(PrjBoard prjBoard);

	int deletePrjBoard(PrjBoard prjBoard);
}
