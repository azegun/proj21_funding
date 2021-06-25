package proj21_funding.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import proj21_funding.dto.PrjOption;
import proj21_funding.service.PrjOptionService;

@RestController
public class RestOptionController {
	@Autowired
	private PrjOptionService optionService;
	
	@GetMapping("/getOptList/{prjNo}")
	public ResponseEntity<Object> member(@PathVariable int prjNo, HttpServletResponse response) {
        List<PrjOption> option = optionService.showSimpleOptionByPrjNo(prjNo);
        System.out.println(option);
        return ResponseEntity.ok(option);
    }
	

}
