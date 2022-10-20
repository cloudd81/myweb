/**
 * myscript.js 
 */
 
 function bbsCheck(){ // 게시판 유효성 검사
	// 1) 작성자 체크 - 2글자 이상 입력
	let wname = document.getElementById("wname").value; // 작성자 가져오기
	wname = wname.trim();
	if(wname.length<2){
		alert("이름은 2글자 이상 입력해주세요");
		document.getElementById("wname").focus(); // 작성자칸에 커서 생성하기
		return false;
	} // if end
	
	// 2) 제목 체크 - 2글자 이상 입력
	let subject = document.getElementById("subject").value; // 작성자 가져오기
	subject = subject.trim();
	if(subject.length<2){
		alert("제목은 2글자 이상 입력해주세요");
		document.getElementById("subject").focus(); // 작성자칸에 커서 생성하기
		return false;
	} // if end

	// 3) 내용 체크 - 2글자 이상 입력
	let content = document.getElementById("content").value; // 작성자 가져오기
	content = content.trim();
	if(content.length<2){
		alert("내용에 2글자 이상 입력해주세요");
		document.getElementById("content").focus(); // 작성자칸에 커서 생성하기
		return false;
	} // if end
	
	// 4) 비밀번호 체크 - 4글자 이상이면서, 숫자형 기호만 입력 
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){
		alert("비밀번호는 4글자 이상 숫자로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}
	
	return true; // onsubmit 이벤트에서 서버로 전송
}// bbsCheck() end

function pwCheck(){
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){
		alert("비밀번호는 4글자 이상 숫자로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	} // if end
	
	let message = "진행된 내용은 복구되지 않습니다\n계속 진행할까요?";
	if(confirm(message)){ // 확인 true, 취소 false
		return true;
	} else {
		return false;
	} // if end
	
} // pwChechk() end

 function updateCheck(){
	let wname = document.getElementById("wname").value;
	wname = wname.trim();
	if(wname.length<2){
		alert("이름은 2글자 이상 입력해주세요");
		document.getElementById("wname").focus();
		return false;
	} // if end
	
	let subject = document.getElementById("subject").value;
	subject = subject.trim();
	if(subject.length<2){
		alert("제목은 2글자 이상 입력해주세요");
		document.getElementById("subject").focus();
		return false;
	} // if end

	let content = document.getElementById("content").value;
	content = content.trim();
	if(content.length<2){
		alert("내용에 2글자 이상 입력해주세요");
		document.getElementById("content").focus();
		return false;
	} // if end
	
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<4 || isNaN(passwd)){
		alert("비밀번호는 4글자 이상 숫자로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	}
	
	let message = "수정하면 이전 내용은 사라집니다\n계속 진행할까요?";
	if(confirm(message)){ // 확인 true, 취소 false
		return true;
	} else {
		return false;
	} // if end
	
}// updateCheck() end

function searchCheck(){
	// 검색어를 입력해야만 서버로 전송
	let word = document.getElementById("word").value;
	word = word.trim();
	if(word.length==0){
		alert("검색어를 입력해주세요");
		return false;
	} // if end
	return true;
} // searchCheck() end

function loginCheck() { // 로그인 유효성 검사
	// 1) 아이디는 5~10글자 이내인지 검사
	let id = document.getElementById("id").value;
	id = id.trim();
	if(!(id.length>=5 && id.length<=10)){
		alert("아이디는 5~10글자 범위로 작성해주세요.");
		document.getElementById("id").focus();
		return false;
	} // if end
	
	// 2) 비밀번호 5~10글자 이내인지 검사
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(!(passwd.length>=5 && passwd.length<=10)){
		alert("비밀번호는 5~10글자 범위로 작성해주세요.");
		document.getElementById("passwd").focus();
		return false;
	} // if end
	
	return true;
} // loginCheck() end

function idCheck() {
	
	// 모달창
	// -> 부모창과 자식창이 한 몸으로 구성되어있음
	// -> 참조 : https://www.w3schools.com/bootstrap/bootstrap_modal.asp	
	
	// 새창 만들기
	// -> 부모창과 자식창이 별개로 구성되어 있음
	// -> 모바일에 기반을 둔 frontend단에서는 사용하지 말 것!
	// -> 참조 : https://www.w3schools.com/jsref/met_win_open.asp
	// window.open("파일명", "새창이름", "다양한 옵션들"); 
	window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
	
	
} // idCheck() end

function emailCheck() {
	 
	window.open("emailCheckForm.jsp", "mailwin", "width=400, height=350");
	
} // mailCheck() end


function memberCheck() { // 회원가입 유효성 검사
	//1)아이디 5~10글자 인지?
	let id = document.getElementById("id").value;
	id = id.trim();
	if(id.length<5 && id.length>10){
		alert("아이디는 5글자~10글자 사이로 입력해주세요");
		document.getElementById("id").focus();
		return false;
	} // if end
	
    //2)비밀번호 5~10글자 인지?
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<5 && passwd.length>10){
		alert("비밀번호는 5글자~10글자 사이로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	} // if end
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	let repasswd = document.getElementById("repasswd").value;
	repasswd = repasswd.trim();
	if(repasswd!=passwd){
		alert("비밀번호가 서로 일치하지 않습니다");
		document.getElementById("repasswd").focus();
		return false;
	} // if end

    //4)이름 2글자 이상 인지?
	let mname = document.getElementById("mname").value;
	mname = mname.trim();
	if(mname.length<2){
		alert("이름은 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();
		return false;
	} // if end
	
    //5)이메일 5글자 인지?
	let email = document.getElementById("email").value;
	email = email.trim();
	if(email.length<5){
		alert("이메일은 5글자 이상 입력해주세요");
		document.getElementById("email").focus();
		return false;
	} // if end

    //6)직업을 선택했는지?
	let job = document.getElementById("job").value;
	if(job==0){
		alert("직업을 선택해주세요");
		document.getElementById("job").focus();
		return false;
	} // if end
	
	return true;
} // memberCheck() end

function pwCheck2(){
	let passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<5 && passwd.length>10){
		alert("비밀번호는 5글자~10글자 사이로 입력해주세요");
		document.getElementById("passwd").focus();
		return false;
	} // if end
	
	let message = "진행된 내용은 복구되지 않습니다\n계속 진행할까요?";
	if(confirm(message)){ // 확인 true, 취소 false
		return true;
	} else {
		return false;
	} // if end
	
} // pwChechk2() end

function findCheck() {
	 
	window.open("findID.jsp", "findwin", "width=400, height=350");
	
} // mailCheck() end