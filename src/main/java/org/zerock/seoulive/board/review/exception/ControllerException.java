package org.zerock.seoulive.board.review.exception;

// 개발자가 만드는 컨트롤러의 핸들러 메소드에서 오류발생시, 
// 아래에 정의된 사용자 정의 예외 객체로 Wrapping해서 throw하게
// 하기 위해 정의도니 예외클래스
// 사용자 정의 예외 클래스
public class ControllerException extends Exception {
	
	private static final long serialVersionUID = 1L;

//	private static final long serialVersionUID = -3641399688300723640L;

	public ControllerException(String message) {
		super(message);
	}	// Default Constructor
	
	public ControllerException(Exception orignalException) {
		super(orignalException);
	}	// Default Constructor
}	// end class
