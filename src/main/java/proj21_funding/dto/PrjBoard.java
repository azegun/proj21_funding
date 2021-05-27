package proj21_funding.dto;

public class PrjBoard {
		private int postNo;   //게시글번호
		private Project prjNo;//프로젝트번호
		private String userNo;//글작성자
		private String postTitle;//게시글제목
		private String postContent;//게시글내용
	
		//기본생성자
		public PrjBoard() {}
	
		//게시글 번호 검색
		public PrjBoard(int postNo) {
			this.postNo = postNo;
		}
		//Getter &Setter
		public int getPostNo() {
			return postNo;
		}

		public void setPostNo(int postNo) {
			this.postNo = postNo;
		}

		public Project getPrjNo() {
			return prjNo;
		}

		public void setPrjNo(Project prjNo) {
			this.prjNo = prjNo;
		}

		public String getUserNo() {
			return userNo;
		}

		public void setUserNo(String userNo) {
			this.userNo = userNo;
		}

		public String getPostTitle() {
			return postTitle;
		}

		public void setPostTitle(String postTitle) {
			this.postTitle = postTitle;
		}

		public String getPostContent() {
			return postContent;
		}

		public void setPostContent(String postContent) {
			this.postContent = postContent;
		}

		@Override
		public String toString() {
			return String.format("PrjBoard [postNo=%s, prjNo=%s, userNo=%s, postTitle=%s, postContent=%s]", postNo,
					prjNo, userNo, postTitle, postContent);
		}
		
		
		
		
}