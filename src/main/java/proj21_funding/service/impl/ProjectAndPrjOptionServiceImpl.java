package proj21_funding.service.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import proj21_funding.dto.PrjOption;
import proj21_funding.dto.Project;
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
	public void trJoinPrjAndPrjOpt(Project project, PrjOption prjoption, MultipartFile uploadfile) {
		int res = pMapper.insertProject(project);
		prjoption.setPrjNo(project);
		//컨트롤러에서 작성안한 이유는, 프로젝트 insert가 되어야지 prjno가 생성되므로, 여기서 파일 구현
		
		String saveName = "project"+prjoption.getPrjNo().getPrjNo()+".jpg";
//		System.out.println("saveName: "+ saveName);
		
		File saveFile = new File(UPLOAD_PATH, saveName);
		try {
			uploadfile.transferTo(saveFile);
		}catch (IOException e) {
		e.printStackTrace();
		}		
		
		res += prjOptMapper.insertPrjOption(prjoption);
		
		if(res != 2) throw new RuntimeException();				
	}

		
	


}