package proj21_funding.dto;
//프로젝트구매옵션
public class PrjOption {
		private int optNo; //옵션번호
		private Project prjNo;//프로젝트번호
		private int optPrice;//옵션급액
		private String optContent;//옵션내용
		//기본 생성자
		public PrjOption() {}
		
		//옵션 번호로 검색
		public PrjOption(int optNo) {
			this.optNo = optNo;
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
			return String.format("PrjOption [optNo=%s, prjNo=%s, optPrice=%s, optContent=%s]", optNo, prjNo, optPrice,
					optContent);
		}
		
		

}
