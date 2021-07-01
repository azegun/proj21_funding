package proj21_funding.service.impl;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
import proj21_funding.exception.DateTimeOverException;
import proj21_funding.mapper.MyListMapper;
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
	
	@Autowired
	private MyListMapper myMapper;

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
		//트렌젝션 prjNo 찾아오기 위함.
		prjoption.setPrjNo(project);
		
		  if(uploadfile.getSize() !=0) {
			  
		      String saveName = "project"+prjoption.getPrjNo().getPrjNo()+".jpg";	     
		      
		      File saveFile = new File(UPLOAD_PATH, saveName);
		      try {
		         uploadfile.transferTo(saveFile);
		      }catch (IOException e) {
		      e.printStackTrace();
		      }      
		  }		
	      
	      res += prjOptMapper.insertPrjOption(prjoption);	      
	      
	      if(res != 2) throw new RuntimeException();            
	}

	@Override
	public void trremovePrjAndPrjOpt(int prjNo) {
		int res = prjOptMapper.removePrjOption(prjNo);
		
		res += pMapper.removeProject(prjNo);
		
	    if(res != 2) throw new RuntimeException();        
	      
		
	}
	//등록업데이트
	@Override
	public void trUpdateAddOptionsOfFourTimes(Map<String, Object> map) {
		int res = prjOptMapper.updateAllAddOptionsByMap(map);
		System.out.println("map >> "+ map);
		res += prjOptMapper.updateSubOptByMap(map);
		System.out.println("res >> "+ res);
		if(res != 3) throw new RuntimeException();
	}
	//myList 업데이트
	@Override
	public void trUpdateListAddOptionsOfFourTimes(Map<String, Object> map) {
		int res = myMapper.updateListAllAddOptionsByMap(map);
		res += myMapper.updateListSubOptByMap(map);
		
		if(res != 3) throw new RuntimeException();
	}
	}
