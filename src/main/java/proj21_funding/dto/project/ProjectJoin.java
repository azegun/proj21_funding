package proj21_funding.dto.project;

import java.util.Date;

public class ProjectJoin {
	private int prjNo;
	private String prjManager;
	private String prjName;
	private String prjContent;
	private int prjGoal;
	private Date startDate;
	private Date endDate;
	private Date payDate;
	private boolean endYn;
	private int optNo;
	private String optName;
	private int optPrice;
	private String optContent;
	private int fundingNo;
	private String sponsor;
	private int accountNo;
	private boolean payYn;
	private double rate;
	private int totalCount;
	private int totalPrice;
	public int getPrjNo() {
		return prjNo;
	}
	public void setPrjNo(int prjNo) {
		this.prjNo = prjNo;
	}
	public String getPrjManager() {
		return prjManager;
	}
	public void setPrjManager(String prjManager) {
		this.prjManager = prjManager;
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
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public boolean isEndYn() {
		return endYn;
	}
	public void setEndYn(boolean endYn) {
		this.endYn = endYn;
	}
	public int getOptNo() {
		return optNo;
	}
	public void setOptNo(int optNo) {
		this.optNo = optNo;
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
	public int getFundingNo() {
		return fundingNo;
	}
	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}
	public String getSponsor() {
		return sponsor;
	}
	public void setSponsor(String sponsor) {
		this.sponsor = sponsor;
	}
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	public boolean isPayYn() {
		return payYn;
	}
	public void setPayYn(boolean payYn) {
		this.payYn = payYn;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	
	
}
