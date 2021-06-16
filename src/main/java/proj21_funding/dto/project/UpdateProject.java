package proj21_funding.dto.project;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

public class UpdateProject {
	private int prjNo;						//프로젝트번호
	private int pCategoryNo;		//프로젝트 분류
	private String prjName;  			//프로젝트명
	private String prjContent;			//프로젝트내용
	private int prjGoal;						//목표금액
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDate;	//마감일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate payDate;	//결제일
	private String optName;			 //옵션명
	private int optPrice;				//옵션급액
	private String optContent;		//옵션내용
		
	
	public UpdateProject() {}


	public UpdateProject(int prjNo, String prjName, String prjContent, int prjGoal, LocalDate endDate,
			LocalDate payDate, String optName, int optPrice, String optContent) {
		this.prjNo = prjNo;
		this.prjName = prjName;
		this.prjContent = prjContent;
		this.prjGoal = prjGoal;
		this.endDate = endDate;
		this.payDate = payDate;
		this.optName = optName;
		this.optPrice = optPrice;
		this.optContent = optContent;
	}


	public int getPrjNo() {
		return prjNo;
	}


	public void setPrjNo(int prjNo) {
		this.prjNo = prjNo;
	}


	public int getpCategoryNo() {
		return pCategoryNo;
	}


	public void setpCategoryNo(int pCategoryNo) {
		this.pCategoryNo = pCategoryNo;
	}


	public String getPrjName() {
		return prjName;
	}


	public void setPrjName(String prjName) {
		this.prjName = prjName;
	}


	public String getPrjContent() {
		return prjContent;
	}


	public void setPrjContent(String prjContent) {
		this.prjContent = prjContent;
	}


	public int getPrjGoal() {
		return prjGoal;
	}


	public void setPrjGoal(int prjGoal) {
		this.prjGoal = prjGoal;
	}


	public LocalDate getEndDate() {
		return endDate;
	}


	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}


	public LocalDate getPayDate() {
		return payDate;
	}


	public void setPayDate(LocalDate payDate) {
		this.payDate = payDate;
	}


	public String getOptName() {
		return optName;
	}


	public void setOptName(String optName) {
		this.optName = optName;
	}


	public int getOptPrice() {
		return optPrice;
	}


	public void setOptPrice(int optPrice) {
		this.optPrice = optPrice;
	}


	public String getOptContent() {
		return optContent;
	}


	public void setOptContent(String optContent) {
		this.optContent = optContent;
	}


	@Override
	public String toString() {
		return String.format(
				"UpdateProject [prjNo=%s, prjName=%s, prjContent=%s, prjGoal=%s, endDate=%s, payDate=%s, optName=%s, optPrice=%s, optContent=%s]",
				prjNo, prjName, prjContent, prjGoal, endDate, payDate, optName, optPrice, optContent);
	}
	

	
}