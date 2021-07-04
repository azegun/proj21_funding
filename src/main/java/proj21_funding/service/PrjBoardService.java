package proj21_funding.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjBoard;

@Service
public interface PrjBoardService {
	List<PrjBoard> showPrjBoardbyPrjNo(int prjNo);
	
	List<PrjBoard> showPrjBoardbyUserNo(PrjBoard prjBoard);
	
	int registPrjBoard(PrjBoard prjBoard, MultipartFile postFile);

	int modifyPrjBoard(PrjBoard prjBoard);

	int removePrjBoard(PrjBoard prjBoard);	

}
