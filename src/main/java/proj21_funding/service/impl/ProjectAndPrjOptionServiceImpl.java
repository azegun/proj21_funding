package proj21_funding.service.impl;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.exception.DateTimeOverException;
import proj21_funding.mapper.PrjOptionMapper;
import proj21_funding.mapper.ProjectMapper;
import proj21_funding.service.ProjectAndPrjOptionService;
@Service
public class ProjectAndPrjOptionServiceImpl implements ProjectAndPrjOptionService {
	//web.xml에 있는 multipart-config 주소랑 동일시하게 
	private static final String UPLOAD_PATH = "C:\\workspace_web\\proj21_funding\\src\\main\\webapp\\images\\project";
	
	@Autowired
	private ProjectMapper pMapper;
	
	@Autowired
	private PrjOptionMapper prjOptMapper;

	@Override
	public void trJoinPrjAndPrjOpt(Project project, PrjOption prjoption, MultipartFile uploadfile ) {
//		날짜비교
		LocalDate EndDate = project.getEndDate();
		LocalDate PayDate = project.getPayDate();
		
		int compareEtoP = EndDate.compareTo(PayDate);
//		날짜비교
		
		int res;
		if(compareEtoP <= 0) {
			 res = pMapper.insertProject(project);
		}else {
			throw new DateTimeOverException("결제일이 마감일보다 빠를 수 없습니다.");
		}	
		
		  prjoption.setPrjNo(project);
	      String saveName = "project"+prjoption.getPrjNo().getPrjNo()+".jpg";
	      System.out.println("saveName: "+ saveName);
	      
	      File saveFile = new File(UPLOAD_PATH, saveName);
	      try {
	         uploadfile.transferTo(saveFile);
	      }catch (IOException e) {
	      e.printStackTrace();
	      }      
	      
	      res += prjOptMapper.insertPrjOption(prjoption);
	      
	      
	      if(res != 2) throw new RuntimeException();            
	}

	@Override
	public void trremovePrjAndPrjOpt(int prjNo) {
		int res = prjOptMapper.removePrjOption(prjNo);
		System.out.println("trans res1 >> " + res);
		
		res += pMapper.removeProject(prjNo);
		System.out.println("trans res2 >> " + res);
		
	    if(res != 2) throw new RuntimeException();        
	      
		
	}
	}
