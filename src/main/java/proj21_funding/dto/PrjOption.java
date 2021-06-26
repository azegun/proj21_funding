package proj21_funding.dto;

//프로젝트구매옵션
public class PrjOption {
		private int optNo; //옵션번호
		private Project prjNo;//프로젝트번호
		private String optName; //옵션명
		private int optPrice;//옵션급액
		private String optContent;//옵션내용
		private String addOptName1;
		private String addOptName2;
		private int addOptPrice1;
		private int addOptPrice2;
		private String addOptContent1;
		private String addOptContent2;
		
		//기본 생성자
		public PrjOption() {}
		
		//옵션 번호로 검색
		public PrjOption(int optNo) {
			this.optNo = optNo;
		}		
		
		//insert (transaction)
		public PrjOption(Project prjNo, String optName, int optPrice, String optContent) {
			this.prjNo = prjNo;
			this.optName = optName;
			this.optPrice = optPrice;
			this.optContent = optContent;
		}
		
		//update
		public PrjOption(int optNo, String optName, int optPrice, String optContent) {
			this.optNo = optNo;
			this.optName = optName;
			this.optPrice = optPrice;
			this.optContent = optContent;
		}
		
		//joinUpdate
		public PrjOption(String optName, int optPrice, String optContent) {
			this.optName = optName;
			this.optPrice = optPrice;
			this.optContent = optContent;
		}

		//getter & setter
		public int getOptNo() {
			return optNo;
		}
		

		public void setOptNo(int optNo) {
			this.optNo = optNo;
		}
		public Project getPrjNo() {
			return prjNo;
		}
		public void setPrjNo(Project prjNo) {
			this.prjNo = prjNo;
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

		public String getAddOptName1() {
			return addOptName1;
		}

		public void setAddOptName1(String addOptName1) {
			this.addOptName1 = addOptName1;
		}

		public String getAddOptName2() {
			return addOptName2;
		}

		public void setAddOptName2(String addOptName2) {
			this.addOptName2 = addOptName2;
		}

		public int getAddOptPrice1() {
			return addOptPrice1;
		}

		public void setAddOptPrice1(int addOptPrice1) {
			this.addOptPrice1 = addOptPrice1;
		}

		public int getAddOptPrice2() {
			return addOptPrice2;
		}

		public void setAddOptPrice2(int addOptPrice2) {
			this.addOptPrice2 = addOptPrice2;
		}

		public String getAddOptContent1() {
			return addOptContent1;
		}

		public void setAddOptContent1(String addOptContent1) {
			this.addOptContent1 = addOptContent1;
		}

		public String getAddOptContent2() {
			return addOptContent2;
		}

		public void setAddOptContent2(String addOptContent2) {
			this.addOptContent2 = addOptContent2;
		}

		@Override
		public String toString() {
			return String.format("PrjOption [optNo=%s, prjNo=%s, optName=%s, optPrice=%s, optContent=%s]", optNo, prjNo.getPrjNo(),
					optName, optPrice, optContent);
		}
		
		

}
