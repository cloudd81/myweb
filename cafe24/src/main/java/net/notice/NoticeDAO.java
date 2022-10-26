package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public NoticeDAO() {
		dbopen = new DBOpen();
	} // end
	
	public int create(NoticeDTO dto) {
		int cnt = 0;
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" INSERT INTO tb_notice(subject, content, regdt) ");
			sql.append(" VALUES (?, ?, now()) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("공지사항 업로드 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // create() end
	
	public ArrayList<NoticeDTO> list(String col, String word, int nowPage, int recordPerPage) {
		ArrayList<NoticeDTO> list = null;
		
		// 페이지당 출력할 행의 갯수(10개를 기준)
		int startRow = ((nowPage-1) * recordPerPage) + 1;
		int endRow = nowPage * recordPerPage;
		// 내가 볼 페이지를 지정해줄 nowPage(ssi.jsp) 변수와 페이지를 어떻게 나누어줄 것인지 정하는 recordPerPage(bbsList.jsp)
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			
			word = word.trim(); // 검색어 좌우 공백 제거
			
			if(word.length()==0) { // 검색하지 않는 경우
				sql.append(" SELECT noticeno, subject, content, regdt, r ");
				sql.append(" FROM ( ");
				sql.append(" 	SELECT noticeno, subject, content, regdt, @RNO := @RNO + 1 AS r ");
				sql.append(" 	FROM ( ");
				sql.append(" 		SELECT noticeno, subject, content, regdt ");
				sql.append(" 		FROM tb_notice ");
				sql.append(" 		)A, (SELECT @RNO := 0) B ORDER BY regdt DESC ");
				sql.append(" 	)C ");
				sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow );
				
			} else { // 검색한 경우
				sql.append(" SELECT noticeno, subject, content, regdt, r ");
				sql.append(" FROM ( ");
				sql.append(" 	SELECT noticeno, subject, content, regdt, @RNO := @RNO + 1 AS r ");
				sql.append(" 	FROM ( ");
				sql.append(" 		SELECT noticeno, subject, content, regdt ");
				sql.append(" 		FROM tb_notice ");
				
				String search = "";
				if(col.equals("subject_content")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
					search += " OR content LIKE '%" + word + "%' ";
				} else if(col.equals("subject")) {
					search += " WHERE subject LIKE '%" + word + "%' ";
				} else if(col.equals("content")) {
					search += " WHERE content LIKE '%" + word + "%' ";
				} // if end
				sql.append(search);
				
				sql.append(" 		ORDER BY regdt DESC ");
				sql.append(" 		)A, (SELECT @RNO := 0) B ORDER BY regdt DESC ");
				sql.append(" 	)C ");
				sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow );
			}
			
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();	
			if(rs.next()) {
				// 전체 행을 저장할 수 있는
				list = new ArrayList<>();
				do {
					NoticeDTO dto = new NoticeDTO();
					dto.setNoticeno(rs.getInt("noticeno"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setRegdt(rs.getString("regdt"));
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
	
	public int count(String col, String word) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append(" FROM tb_notice ");
			
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
	} // count() end
	
	public NoticeDTO read(int noticeno) {
		NoticeDTO dto = null;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT noticeno, subject, content, regdt ");
			sql.append(" FROM tb_notice ");
			sql.append(" where noticeno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			rs= pstmt.executeQuery();
			if(rs.next()){
				dto = new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdt(rs.getString("regdt"));				
			} // if end
		} catch (Exception e) {
			System.out.println("상세보기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	} // read() end
	
	public int delete(NoticeDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_notice ");
			sql.append(" WHERE noticeno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNoticeno());
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("삭제 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // delete() end
	
	public int updateproc(NoticeDTO dto) {
		int cnt = 0; // 성공 또는 실패 여부 반환
		try {
			con=dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" UPDATE tb_notice ");
			sql.append(" SET subject=?, content=? ");
			sql.append(" WHERE noticeno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNoticeno());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("업데이트 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	} // updateproc() end
	
} // class end