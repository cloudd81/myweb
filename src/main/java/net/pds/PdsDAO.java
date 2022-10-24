package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

public class PdsDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public PdsDAO() {
		dbopen = new DBOpen();
	} // end
	
	// 비지니스 로직 구현
	public int create(PdsDTO dto) {
		int cnt = 0;
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate) ");
			sql.append(" VALUES (pds_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("포토 업로드 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // create() end
	
	public ArrayList<PdsDTO> list() {
		ArrayList<PdsDTO> list = null;
		
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT pdsno, wname, subject, filename, filesize, readcnt, regdate ");
			sql.append(" FROM tb_pds ");
			sql.append(" ORDER BY regdate DESC ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();	
			if(rs.next()) {
				// 전체 행을 저장할 수 있는
				list = new ArrayList<>();
				do {
					PdsDTO dto = new PdsDTO();
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdate(rs.getString("regdate"));
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
	
	public PdsDTO read(int pdsno) {
		PdsDTO dto = null;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT pdsno, passwd, wname, subject, filename, filesize, readcnt, regdate ");
			sql.append(" FROM tb_pds ");
			sql.append(" where pdsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			rs= pstmt.executeQuery();
			if(rs.next()){
				dto = new PdsDTO();
				dto.setPdsno(rs.getInt("pdsno"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getLong("filesize"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdate(rs.getString("regdate"));
			} // if end
		} catch (Exception e) {
			System.out.println("상세보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	} // read() end
	
	public void incrementCnt(int pdsno) {
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" UPDATE tb_pds ");
			sql.append(" SET readcnt = readcnt + 1 ");
			sql.append(" WHERE pdsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			System.out.println("조회수 증가 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end		
	} // incrementCnt() end
	
	public int count2(String col, String word) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM tb_pds ");
			
			if(word.length()>=1) { // 검색어가 존재한다면
				String search = "";
				if(col.equals("wname_subject")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
					search += " OR subject LIKE '%" + word + "%' ";
				} else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
				} else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
				} // if end
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
	
	public ArrayList<PdsDTO> list3(String col, String word, int nowPage, int recordPerPage) {
		ArrayList<PdsDTO> list = null;
		
		// 페이지당 출력할 행의 갯수(10개를 기준)
		int startRow = ((nowPage-1) * recordPerPage) + 1;
		int endRow = nowPage * recordPerPage;
		// 내가 볼 페이지를 지정해줄 nowPage(ssi.jsp) 변수와 페이지를 어떻게 나누어줄 것인지 정하는 recordPerPage(bbsList.jsp)
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			
			word = word.trim(); // 검색어 좌우 공백 제거
			
			if(word.length()==0) { // 검색하지 않는 경우
				sql.append(" SELECT * ");
				sql.append(" FROM ( ");
				sql.append(" 	SELECT pdsno, wname, subject, filename, filesize, readcnt, regdate, rownum as r ");
				sql.append(" 	FROM ( ");
				sql.append(" 		SELECT pdsno, wname, subject, filename, filesize, readcnt, regdate ");
				sql.append(" 		FROM tb_pds ");
				sql.append(" 		ORDER BY regdate DESC ");
				sql.append(" 		) ");
				sql.append(" 	) ");
				sql.append(" WHERE r>=" + startRow + "AND r<=" + endRow );
				
			} else { // 검색한 경우
				sql.append(" SELECT * ");
				sql.append(" FROM ( ");
				sql.append(" 	SELECT pdsno, wname, subject, filename, filesize, readcnt, regdate, rownum as r ");
				sql.append(" 	FROM ( ");
				sql.append(" 		SELECT pdsno, wname, subject, filename, filesize, readcnt, regdate ");
				sql.append(" 		FROM tb_pds ");
				
				String search = "";
				if(col.equals("wname_subject")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
					search += " OR subject LIKE '%" + word + "%' ";
				} else if(col.equals("wname")) {
					search += " WHERE wname LIKE '%" + word + "%' ";
				} else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
				} // if end
				sql.append(search);
				
				sql.append(" 		ORDER BY regdate DESC ");
				sql.append(" 		) ");
				sql.append(" 	) ");
				sql.append(" WHERE r>=" + startRow + "AND r<=" + endRow );
			}
			
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();	
			if(rs.next()) {
				// 전체 행을 저장할 수 있는
				list = new ArrayList<>();
				do {
					PdsDTO dto = new PdsDTO();
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdate(rs.getString("regdate"));
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
	
	public int delete(int pdsno, String passwd, String saveDir) {
		int cnt=0;
		
		try {
			// 테이블의 행을 삭제하기 전에 삭제하고자 하는 파일명을 가져온다.
			String filename = "";
			PdsDTO oldDTO = read(pdsno);
			if(oldDTO!=null) {
				filename = oldDTO.getFilename();
			} // if end

			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_pds ");
			sql.append(" WHERE pdsno = ? AND passwd = ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.setString(2, passwd);
			
			cnt = pstmt.executeUpdate();
			if(cnt==1) {
				Utility.deleteFile(saveDir, filename);
			} // if end
			
		} catch (Exception e) {
			System.out.println("파일 삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		
		
		return cnt;
	} // delete() end
	
	public int updateproc(PdsDTO dto, String saveDir) { System.out.println(dto);
		int cnt = 0;
		try {
			// 테이블의 행을 삭제하기 전에 삭제하고자 하는 파일명을 가져온다.
			String filename = "";
			PdsDTO oldDTO = read(dto.getPdsno());
			if(oldDTO!=null) {
				filename = oldDTO.getFilename();
			} // if end
			
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" UPDATE tb_pds ");
			sql.append(" SET wname=?, subject=?, filename=?, filesize=? ");
			sql.append(" WHERE pdsno=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getFilename());
			pstmt.setLong(4, dto.getFilesize());
			pstmt.setInt(5, dto.getPdsno());
			pstmt.setString(6, dto.getPasswd());
			
			cnt = pstmt.executeUpdate();
			if(cnt==1) {
				Utility.deleteFile(saveDir, filename);
			} // if end
			
		} catch (Exception e) {
			System.out.println("포토 업로드 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // updateproc() end
	
} // class end
