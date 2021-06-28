package proj21_funding.dto;

//프로젝트구매옵션
public class PrjOption {
		private int optNo; //옵션번호
		private Project prjNo;//프로젝트번호
		private String optName; //옵션명
		private int optPrice;//옵션급액
		private String optContent;//옵션내용
		private int addOptNo1;
		private int addOptNo2;
		private int addOptNo3;
		private String addOptName1;
		private String addOptName2;
		private String addOptName3;
		private int addOptPrice1;
		private int addOptPrice2;
		private int addOptPrice3;
		private String addOptContent1;
		private String addOptContent2;
		private String addOptContent3;
		
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
		

		public int getAddOptNo3() {
			return addOptNo3;
		}

		public void setAddOptNo3(int addOptNo3) {
			this.addOptNo3 = addOptNo3;
		}

		public String getAddOptName3() {
			return addOptName3;
		}

		public void setAddOptName3(String addOptName3) {
			this.addOptName3 = addOptName3;
		}

		public int getAddOptPrice3() {
			return addOptPrice3;
		}

		public void setAddOptPrice3(int addOptPrice3) {
			this.addOptPrice3 = addOptPrice3;
		}

		public String getAddOptContent3() {
			return addOptContent3;
		}

		public void setAddOptContent3(String addOptContent3) {
			this.addOptContent3 = addOptContent3;
		}

		public int getAddOptNo1() {
			return addOptNo1;
		}

		public void setAddOptNo1(int addOptNo1) {
			this.addOptNo1 = addOptNo1;
		}

		public int getAddOptNo2() {
			return addOptNo2;
		}

		public void setAddOptNo2(int addOptNo2) {
			this.addOptNo2 = addOptNo2;
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
