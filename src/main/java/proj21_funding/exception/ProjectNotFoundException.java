package proj21_funding.exception;

@SuppressWarnings("serial")
public class ProjectNotFoundException extends RuntimeException {

	public ProjectNotFoundException() {
		// TODO Auto-generated constructor stub
	}

	public ProjectNotFoundException(String message) {
		super("등록된 프로젝트가 없습니다.");
	}

}
