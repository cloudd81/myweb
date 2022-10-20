package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.tomcat.util.security.KeyStoreUtil;

import net.member.*;
import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.MyAuthenticator;
import net.utility.Utility;

public class MemberDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public MemberDAO() {
		dbopen = new DBOpen();
	} // end
	
	// 비지니스 로직 구현
	public String loginProc(MemberDTO dto) {
		String mlevel = null;
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT mlevel ");
			sql.append(" FROM friends ");
			sql.append(" WHERE id = ? AND passwd = ? ");
			sql.append(" AND mlevel IN ('A1', 'B1', 'C1', 'D1') ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mlevel = rs.getString("mlevel");
			} // if end
			
		} catch (Exception e) {
			System.out.println("로그인 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return mlevel;
	} // end
	
	public int duplecateID(String id) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT count(id) as cnt ");
			sql.append(" FROM friends ");
			sql.append(" WHERE id = ? ");
			sql.append(" AND mlevel IN ('A1', 'B1', 'C1', 'D1') "); // 탈퇴한 회원의 아이디는 만들 수 있도록
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end
			
		} catch (Exception e) {
			System.out.println("아이디 중복확인 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return cnt;
	} // duplecateID() end
	
	public int duplecateEmail(String email) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT count(email) as cnt ");
			sql.append(" FROM friends ");
			sql.append(" WHERE email = ? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end
			
		} catch (Exception e) {
			System.out.println("이메일 중복확인 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return cnt;
	} // duplecateID() end
	
	public int join(MemberDTO dto) {
		int cnt = 0;
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" INSERT INTO friends(id, passwd, mname, tel, email, zipcode, address1, address2, job, hope, mlevel, mdate) ");
			sql.append(" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'D1', sysdate) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getHope());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("회원가입 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // join() end
	
	public int draw(MemberDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" DELETE FROM friends ");
			sql.append(" WHERE id=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // delete() end
	
	public boolean findID(MemberDTO dto) {
		boolean flag = false;
		String repasswd = getTmpPasswd();
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT id ");
			sql.append(" FROM friends ");
			sql.append(" WHERE mname = ? AND email = ? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getEmail());
			rs=pstmt.executeQuery();
			if(rs.next()) { // 이름과 이메일이 일치되었다면
				String id = rs.getString("id"); // 1) 아이디
				
				// 임시 비밀번호로 테이블 수정하기
				sql = new StringBuilder();
				sql.append(" UPDATE friends ");
				sql.append(" SET passwd = ? ");
				sql.append(" WHERE mname = ? AND email = ? ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, repasswd);
				pstmt.setString(2, dto.getMname());
				pstmt.setString(3, dto.getEmail());
				
				int cnt = pstmt.executeUpdate();
				
				if(cnt==1) {
					// 임시 비밀번호로 테이블이 수정 되었다면 아이디와 비밀번호를 이메일로 전송하기
					String content = "임시 비밀번호로 로그인 한 후, 회원 정보 수정에서 비밀번호를 변경하시기 바랍니다.<hr>";
					content += "아이디 : <span style='font-weight:bold;'>" + id + "</span><br>";
					content += "임시비밀번호 : <span style='font-weight:bold;'>" + repasswd + "</span>";
					
					String mailServer = "mw-002.cafe24.com"; // 메일 서버
					Properties props = new Properties();
					props.put("mail.smtp.host", mailServer);
					props.put("mail.smtp.auth", true);
					Authenticator myAuth = new MyAuthenticator();
					Session sess = Session.getInstance(props, myAuth);
					
					InternetAddress[] address = { new InternetAddress(dto.getEmail()) };
					Message msg = new MimeMessage(sess);
					msg.setRecipients(Message.RecipientType.TO, address);
					msg.setFrom(new InternetAddress("cloud@itwill.co.kr"));
					msg.setSubject("MyWeb 아이디와 비밀번호 입니다");
					msg.setContent(content, "text/html; charset=UTF-8"); // 메일 내용
					msg.setSentDate(new Date()); // 메일 보낸 날짜
					Transport.send(msg);
					
					flag = true;
				} // if end
			} else {
				flag = false;
			} // if end
		} catch (Exception e) {
			System.out.println("아이디/비밀번호 찾기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return flag;
	} // findID() end
	
	
	public int findID2(String mname, String email) {
		int cnt = 0;
		// 2) 임시 비밀번호 만들기
		String repasswd = getTmpPasswd();
		
		try {
			con = dbopen.getConnection();
			
			// 1) 이름과 이메일이 동일한지 확인하기
			sql = new StringBuilder();
			sql.append(" SELECT count(email) as cnt ");
			sql.append(" FROM friends ");
			sql.append(" WHERE mname = ? AND email = ? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
				
				sql = new StringBuilder();
				sql.append(" UPDATE friends ");
				sql.append(" SET passwd = ? ");
				sql.append(" WHERE mname = ? AND email = ? ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, repasswd);
				pstmt.setString(2, mname);
				pstmt.setString(3, email);
				cnt = pstmt.executeUpdate();//
				
				// 4) 임시비밀번호를 이메일로 보내주기
				System.out.println("11111111111111111111111");
				String mailServer = "mw-002.cafe24.com"; // 메일 서버
				Properties props = new Properties();
				props.put("mail.smtp.host", mailServer);
				props.put("mail.smtp.auth", true);
				Authenticator myAuth = new MyAuthenticator();
				Session sess = Session.getInstance(props, myAuth);
				String content = "임시 비밀번호는 <strong>" + repasswd + "</strong>입니다";
				
				InternetAddress[] address = { new InternetAddress(email) };
				Message msg = new MimeMessage(sess);
				
				msg.setRecipients(Message.RecipientType.TO, address); // 받는 사람
				msg.setFrom(new InternetAddress("cloudd81@itwill.com")); // 보내는 사람
				msg.setSubject("임시 비밀번호 발송 메일"); // 메일 제목
				msg.setContent(content, "text/html; charset=UTF-8"); // 메일 내용
				msg.setSentDate(new Date()); // 메일 보낸 날짜
				System.out.println("2222222222222222222222");
				Transport.send(msg);
				System.out.println("3333333333333333333");
				
				System.out.println(email + "님에게" + repasswd + " 비밀번호가 메일로 발송되었습니다<br>내용 : " + content);
				System.out.println(cnt);
			} // if end			
			
		} catch (Exception e) {
			System.out.println("아이디/비밀번호 찾기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return cnt;
	} // findID() end
	
	public String getTmpPasswd() {
		String[] ch = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
				  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
				  "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
				 };

		StringBuilder tmpPW = new StringBuilder();
		for (int i=0; i<10; i++) {
			int num = (int)(Math.random()*ch.length);
			tmpPW.append(ch[num]);
		}// for end
		return tmpPW.toString();
	} // getTmpPasswd() end
	
} // class end
