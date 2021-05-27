package proj21_funding.dto;

import java.time.LocalDateTime;

public class Project {
	private String prjNo;			//프로젝트번호
//	private UserInfo userNo;		//프로젝트관리자
	private String prjName;			//프로젝트명
	private String prjContent;		//프로젝트내용
	private int prjGoal;			//목표금액
	private LocalDateTime startDate;//시작일
	private LocalDateTime endDate;	//마감일
	private LocalDateTime paydate;	//결제일
	private boolean	endYn;			//마감여부
	
//	생성자
	public Project() {
	}

	public Project(String prjNo) {
		this.prjNo = prjNo;
	}
	
//	getter & setter
	public String getPrjNo() {
		return prjNo;
	}

	public void setPrjNo(String prjNo) {
		this.prjNo = prjNo;
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

	public LocalDateTime getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDateTime startDate) {
		this.startDate = startDate;
	}

	public LocalDateTime getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDateTime endDate) {
		this.endDate = endDate;
	}

	public LocalDateTime getPaydate() {
		return paydate;
	}

	public void setPaydate(LocalDateTime paydate) {
		this.paydate = paydate;
	}

	public boolean isEndYn() {
		return endYn;
	}

	public void setEndYn(boolean endYn) {
		this.endYn = endYn;
	}

	@Override
	public String toString() {
		return String.format(
				"Project [prjNo=%s, prjName=%s, prjContent=%s, prjGoal=%s, startDate=%s, endDate=%s, paydate=%s, endYn=%s]",
				prjNo, prjName, prjContent, prjGoal, startDate, endDate, paydate, endYn);
	}
	
	
	
}
