package proj21_funding.dto;

//후원정보
public class FundingInfo {
	private String fundingNo;//후원번호  		ex)F00001
//	private UserInfo userNo; //회원번호  		ex)U00001
//	private PrjOption optNo; //옵션번호		ex)O00001
//	private Project prjNo;   //프로젝트번호  		ex)P00001
	private int accountNo;	 //계좌(카드)번호
	private boolean payYn;	 //결제여부
	private boolean endYn;	 //마감여부
	
//	생성자
	public FundingInfo() {
	}
	

	//후원번호 검색
	public FundingInfo(String fundingNo) {
		this.fundingNo = fundingNo;
	}

	
//	getter & setter
	public String getFundingNo() {
		return fundingNo;
	}
	public void setFundingNo(String fundingNo) {
		this.fundingNo = fundingNo;
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
	public boolean isEndYn() {
		return endYn;
	}
	public void setEndYn(boolean endYn) {
		this.endYn = endYn;
	}

	@Override
	public String toString() {
		return String.format("FundingInfo [fundingNo=%s, accountNo=%s, payYn=%s, endYn=%s]", fundingNo, accountNo,
				payYn, endYn);
	}
	
}
