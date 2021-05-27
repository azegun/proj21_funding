package proj21_funding.dto;

public class BoardCategory {
	private int categoryNo; // 게시글 분류
	private String categoryName; // 분류명

	public BoardCategory() {
		super();
	}

	public BoardCategory(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "BoardCategory [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}

}
