package proj21_funding.dto.project;

import proj21_funding.dto.Project;

public class AddPrjOption {
	private Project prjNo;
	private int addOptNo;
	private String addOptName;
	private int addOptPrice;
	private String addOptContent;
	
	public AddPrjOption() {}	


	public AddPrjOption(Project prjNo) {
		this.prjNo = prjNo;
	}

	public AddPrjOption(int addOptNo) {
		this.addOptNo = addOptNo;
	}


	public AddPrjOption(String addOptName, int addOptPrice, String addOptContent) {
		this.addOptName = addOptName;
		this.addOptPrice = addOptPrice;
		this.addOptContent = addOptContent;
	}
//	프로젝트 등록 (추가)
	public AddPrjOption(Project prjNo, String addOptName, int addOptPrice, String addOptContent) {
		this.prjNo = prjNo;
		this.addOptName = addOptName;
		this.addOptPrice = addOptPrice;
		this.addOptContent = addOptContent;
	}
	
	// 프로젝트 수정 (추가)
	 
	
	public Project getPrjNo() {
		return prjNo;
	}

	public AddPrjOption(int addOptNo, String addOptName, int addOptPrice, String addOptContent) {
		this.addOptNo = addOptNo;
		this.addOptName = addOptName;
		this.addOptPrice = addOptPrice;
		this.addOptContent = addOptContent;
	}


	public int getAddOptNo() {
		return addOptNo;
	}


	public void setAddOptNo(int addOptNo) {
		this.addOptNo = addOptNo;
	}


	public void setPrjNo(Project prjNo) {
		this.prjNo = prjNo;
	}

	public String getAddOptName() {
		return addOptName;
	}

	public void setAddOptName(String addOptName) {
		this.addOptName = addOptName;
	}

	public int getAddOptPrice() {
		return addOptPrice;
	}




	public void setAddOptPrice(int addOptPrice) {
		this.addOptPrice = addOptPrice;
	}

	public String getAddOptContent() {
		return addOptContent;
	}

	public void setAddOptContent(String addOptContent) {
		this.addOptContent = addOptContent;
	}
	

	@Override
	public String toString() {
		return String.format("AddPrjOption [prjNo=%s, addOptNo=%s, addOptName=%s, addOptPrice=%s, addOptContent=%s]",
				prjNo, addOptNo, addOptName, addOptPrice, addOptContent);
	}
	
	
	
	

}
