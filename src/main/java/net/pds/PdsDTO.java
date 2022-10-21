package net.pds;

public class PdsDTO {
	private int		pdsno;
	private String	wname;
	private String  subject;
	private String	regdate;
	private String	passwd;
	private int		readcnt;
	private String 	filename;
	private long	filesize;
	
	public PdsDTO() {} // 생성자 함수

	public int getPdsno() {
		return pdsno;
	}

	public void setPdsno(int pdsno) {
		this.pdsno = pdsno;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	@Override
	public String toString() {
		return "PdsDTO [pdsno=" + pdsno + ", wname=" + wname + ", subject=" + subject + ", regdate=" + regdate
				+ ", passwd=" + passwd + ", readcnt=" + readcnt + ", filename=" + filename + ", filesize=" + filesize
				+ "]";
	}
	
	
} // class end
