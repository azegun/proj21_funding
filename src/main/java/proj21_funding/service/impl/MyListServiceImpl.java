package proj21_funding.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proj21_funding.dto.Project;
import proj21_funding.mapper.MyListMapper;
import proj21_funding.service.MyListService;
@Service
public class MyListServiceImpl implements MyListService {

	@Autowired
	private MyListMapper mapper;
		
	@Override
	public List<Project> showAllMyList(int userNo) {
		return mapper.showAllMyList(userNo);
	}

	@Override
	public Project showDetailListByprjNo(int prjNo) {
		return mapper.showDetailListByprjNo(prjNo);
	}

}
