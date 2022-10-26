package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.*;
import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public BbsDAO() {
		dbopen = new DBOpen();
	} // end
	
	public int create(BbsDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			// sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno)");
			// sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs))");
			sql.append(" INSERT INTO tb_bbs(wname,subject,content,grpno,passwd,ip,regdt)");
		    sql.append(" VALUES(?, ?, ?, (SELECT ifnull(max(bbsno),0)+1 FROM tb_bbs as TB),?,?,now())");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("추가 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // create() end
	
	public ArrayList<BbsDTO> list() {
		ArrayList<BbsDTO> list = null;
		
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
			sql.append(" FROM tb_bbs ");
			sql.append(" ORDER BY grpno desc, ansnum asc ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();	
			if(rs.next()) {
				// 전체 행을 저장할 수 있는
				list = new ArrayList<>();
				do {
					BbsDTO dto = new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					list.add(dto);
				} while(rs.next());
			} else {
				list = null;
			} // if end
			
		} catch (Exception e) {
			System.out.println("목록 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return list;
	} // list() end
	
	public int count() {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT count(*) as cnt ");
			sql.append(" FROM tb_bbs ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end			
		} catch (Exception e) {
			System.out.println("전체 글 갯수 불러오기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end		
		return cnt;		
	} // count() end
	
	
	public BbsDTO read(int bbsno) {
		BbsDTO dto = null;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum, passwd ");
			sql.append(" FROM tb_bbs ");
			sql.append(" where bbsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs= pstmt.executeQuery();
			if(rs.next()){
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
		        dto.setSubject(rs.getString("subject"));
		        dto.setContent(rs.getString("content"));
		        dto.setReadcnt(rs.getInt("readcnt"));
		        dto.setRegdt(rs.getString("regdt"));
		        dto.setIp(rs.getString("ip"));
		        dto.setGrpno(rs.getInt("grpno"));
		        dto.setIndent(rs.getInt("indent"));
		        dto.setAnsnum(rs.getInt("ansnum"));
		        dto.setPasswd(rs.getString("passwd"));
			} // if end
		} catch (Exception e) {
			System.out.println("상세보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	} // read() end
	
	public void incrementCnt(int bbsno) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET readcnt = readcnt + 1 ");
			sql.append(" WHERE bbsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			System.out.println("조회수 증가 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end		
	} // incrementCnt() end
	
	public int delete(BbsDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_bbs ");
			sql.append(" WHERE bbsno=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // delete() end
	
	public int updateproc(BbsDTO dto) {
		int cnt = 0; // 성공 또는 실패 여부 반환
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET wname=?, subject=?, content=?, ip=? ");
			sql.append(" WHERE bbsno=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIp());
			pstmt.setInt(5, dto.getBbsno());
			pstmt.setString(6, dto.getPasswd());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("업데이트 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	} // updateproc() end
	
	public int reply(BbsDTO dto) {
		int cnt = 0;
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			
			// 1) 부모글 정보 가져오기(select문)
			int grpno = 0;
			int indent = 0;
			int ansnum = 0;
			sql.append(" SELECT grpno, ansnum, indent ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE bbsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				grpno = rs.getInt("grpno");
				indent = rs.getInt("indent")+1;
				ansnum = rs.getInt("ansnum")+1;
			} // if end			
			
			// 2) 글 순서 재조정하기
			sql.delete(0, sql.length()); // 1단계에서 사용했던 sql 값 지우기
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET ansnum=ansnum+1 ");
			sql.append(" WHERE grpno=? AND ansnum>=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			rs=pstmt.executeQuery();
			
			// 3) 답변글 추가하기(insert문)
			sql.delete(0, sql.length());
			// sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum)");
			// sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?) ");
			sql.append(" INSERT INTO tb_bbs(wname, subject, content, passwd, ip, grpno, indent, ansnum, regdt)");
		    sql.append(" VALUES(?,?,?,?,?,?,?,?,now())");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, grpno);
			pstmt.setInt(7, indent);
			pstmt.setInt(8, ansnum);
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("답글 달기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end		
		
		return cnt;		
	} // reply() end
	
	public int count2(String col, String word) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM tb_bbs ");
			
			if(word.length()>=1) { // 검색어가 존재한다면
				String search = "";
				if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
					search += " OR content LIKE '%" + word + "%' ";
				} else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
				} else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%' ";
				} else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
				}// if end
				sql.append(search);
			} // if end 
			
			pstmt = con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getInt("cnt");
			} // if end	

		} catch (Exception e) {
			System.out.println("검색 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end		
		return cnt;
	} // count2() end
	
	public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage) {
		ArrayList<BbsDTO> list = null;
		
		// 페이지당 출력할 행의 갯수(10개를 기준)
		int startRow = ((nowPage-1) * recordPerPage) + 1;
		int endRow = nowPage * recordPerPage;
		// 내가 볼 페이지를 지정해줄 nowPage(ssi.jsp) 변수와 페이지를 어떻게 나누어줄 것인지 정하는 recordPerPage(bbsList.jsp)
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			
			word = word.trim(); // 검색어 좌우 공백 제거
			
			if(word.length()==0) { // 검색하지 않는 경우
				sql.append(" SELECT bbsno,subject,wname,content,readcnt,indent,regdt, grpno,ansnum, r ");
				sql.append(" FROM( ");
				sql.append(" 	SELECT bbsno,subject,wname,content,readcnt,indent,regdt, grpno,ansnum, @RNO := @RNO + 1 AS r ");
				sql.append(" 	FROM (");
				sql.append("		SELECT bbsno,subject,wname,content,readcnt,indent,regdt, grpno,ansnum ");
				sql.append(" 		FROM tb_bbs  ");
				sql.append(" 		)A, (SELECT @RNO := 0) B ORDER BY grpno DESC, ansnum ASC ");
				sql.append(" )C WHERE r>=" + startRow + " AND r<=" + endRow );
				
			} else { // 검색한 경우
				sql.append(" SELECT grpno,ansnum,bbsno,subject,wname,content,readcnt,indent,regdt, r ");
				sql.append(" FROM( ");
				sql.append(" 		SELECT grpno,ansnum,bbsno,subject,wname,content,readcnt,indent,regdt, @RNUM := @RNUM + 1 AS r ");
				sql.append("       FROM ( ");
				sql.append("     		  SELECT grpno,ansnum,bbsno,subject,wname,content,readcnt,indent,regdt ");
				sql.append("              FROM tb_bbs ");
				
				String search = "";
				if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
					search += " OR content LIKE '%" + word + "%' ";
				} else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
				} else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%' ";
				} else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
				}// if end
				
				sql.append(search);
				sql.append("   ORDER BY grpno DESC, ansnum ASC ");
				sql.append("            )A, ( SELECT @RNUM := 0 ) B ");
				sql.append(" )C ");
				sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow );
			}
			
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();	
			if(rs.next()) {
				// 전체 행을 저장할 수 있는
				list = new ArrayList<>();
				do {
					BbsDTO dto = new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					list.add(dto);
				} while(rs.next());
			} else {
				list = null;
			} // if end
			
		} catch (Exception e) {
			System.out.println("목록 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return list;
	} // list3() end
	
} // class end
