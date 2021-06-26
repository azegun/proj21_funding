package proj21_funding.dto.project;

import proj21_funding.dto.Project;

public class AddSecOption {
	private Project prjNo;
	private int addSecOptNo;
	private String addSecOptName;
	private int addSecOptPrice;
	private String addSecOptContent;

	
	public AddSecOption() {}


	public AddSecOption(Project prjNo) {
		this.prjNo = prjNo;
	}


	public AddSecOption(int addSecOptNo) {
		this.addSecOptNo = addSecOptNo;
	}


	public AddSecOption(Project prjNo, String addSecOptName, int addSecOptPrice, String addSecOptContent) {
		this.prjNo = prjNo;
		this.addSecOptName = addSecOptName;
		this.addSecOptPrice = addSecOptPrice;
		this.addSecOptContent = addSecOptContent;
	}


	public Project getPrjNo() {
		return prjNo;
	}


	public void setPrjNo(Project prjNo) {
		this.prjNo = prjNo;
	}


	public int getAddSecOptNo() {
		return addSecOptNo;
	}


	public void setAddSecOptNo(int addSecOptNo) {
		this.addSecOptNo = addSecOptNo;
	}


	public String getAddSecOptName() {
		return addSecOptName;
	}


	public void setAddSecOptName(String addSecOptName) {
		this.addSecOptName = addSecOptName;
	}


	public int getAddSecOptPrice() {
		return addSecOptPrice;
	}


	public void setAddSecOptPrice(int addSecOptPrice) {
		this.addSecOptPrice = addSecOptPrice;
	}


	public String getAddSecOptContent() {
		return addSecOptContent;
	}


	public void setAddSecOptContent(String addSecOptContent) {
		this.addSecOptContent = addSecOptContent;
	}


	@Override
	public String toString() {
		return String.format(
				"AddSecondOption [prjNo=%s, addSecOptNo=%s, addSecOptName=%s, addSecOptPrice=%s, addSecOptContent=%s]",
				prjNo, addSecOptNo, addSecOptName, addSecOptPrice, addSecOptContent);
	}	
	
}
