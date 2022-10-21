package net.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	// 사용하고자하는 메일 서버(POP3, SMTP)에서 인증받은 계정과 비밀번호 등록

	private PasswordAuthentication pa;
	
	public MyAuthenticator() { // 기본 생성자
		pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com", "soldesk6901");
	} // end
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

} // class end
