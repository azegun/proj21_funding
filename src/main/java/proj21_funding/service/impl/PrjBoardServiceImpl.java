package proj21_funding.service.impl;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjBoard;
import proj21_funding.mapper.PrjBoardMapper;
import proj21_funding.service.PrjBoardService;

@Service
public class PrjBoardServiceImpl implements PrjBoardService {

	@Autowired
	private PrjBoardMapper boardMapper;

	@Override
	public List<PrjBoard> showPrjBoardbyPrjNo(int prjNo) {
		return boardMapper.selectPrjBoardbyPrjNo(prjNo);
	}

	@Override
	public List<PrjBoard> showPrjBoardbyUserNo(PrjBoard prjBoard) {
		return boardMapper.selectPrjBoardbyUserNo(prjBoard);
	}

	@Override
	public int registPrjBoard(PrjBoard prjBoard, MultipartFile postFile) {
		if(prjBoard.getPostContent().equals("")) {
			throw new NullPointerException();
		}	
		
		if(!postFile.getOriginalFilename().equals("")) {
			byte[] pic = null;				
			
			try {
				pic = postFile.getBytes();
			} catch (IOException e2) {			
				e2.printStackTrace();
			}	
			
			if(pic != null) {
				prjBoard.setPostFile(pic);
			}		
		}	
		
		return boardMapper.insertPrjBoard(prjBoard);
	}

	@Override
	public int modifyPrjBoard(PrjBoard prjBoard) {
		return boardMapper.updatePrjBoard(prjBoard);
	}

	@Override
	public int removePrjBoard(PrjBoard prjBoard) {
		return boardMapper.deletePrjBoard(prjBoard);
	}

}
