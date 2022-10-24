<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header_mem.jsp" %>
 <!-- 본문 시작 -->
	<h3 class="font2"> 회원정보 수정 </h3>
	<div class="container">
<%
	String id = (String)session.getAttribute("s_id");
	dto = dao.read(id);
	String job = dto.getJob();
%>
<form name="memfrm" id="memfrm" action="memberModifyProc.jsp" onsubmit="return memberCheck2()"><!-- myscript.js -->
<span style="color:red; font-weight: bold">* 필수 입력 / 아이디는 수정할 수 없습니다</span>
<br>
<div class="container">
<div class="col-lg-2"></div>
<div class="col-lg-8">
<table class="table table-default">
<tr>
    <th>아이디</th>
    <td style="text-align: left">
      <input type="text" name="id" id="id" size="15" value="<%=id%>" readonly>
    </td>
</tr>
<tr>
    <th>*비밀번호</th>
    <td style="text-align: left"><input type="password" name="passwd" id="passwd" size="15" required></td>
</tr>
<tr>
    <th>*비밀번호 확인</th>
    <td style="text-align: left"><input type="password" name="repasswd" id="repasswd" size="15" required></td>
</tr>
<tr>
    <th>*이름</th>
    <td style="text-align: left"><input type="text" name="mname" id="mname" size="15" maxlength="20" value="<%=dto.getMname()%>" required></td>
</tr>
<tr>
    <th>*이메일</th>
    <td style="text-align: left">
      <input type="email" name="email" id="email" size="30" value="<%=dto.getEmail()%>" readonly>
      <input type="button" value="Email 중복확인" onclick="emailCheck()"><!-- myscript.js -->
    </td>
</tr>
<tr>
    <th>전화번호</th>
    <td style="text-align: left"><input type="text" name="tel" id="tel" size="15"></td>
</tr>
<tr>
    <th>우편번호</th>
    <td style="text-align: left">
      <input type="text" name="zipcode" id="zipcode" size="7"  readonly>
      <input type="button" value="주소찾기" onclick="DaumPostcode()">    
    </td>
</tr>
<tr>  
  <th>주소</th>
  <td style="text-align: left"><input type="text" name="address1" id="address1" size="45" readonly></td>
</tr>
<tr>  
  <th>나머지주소</th>
  <td style="text-align: left"><input type="text" name="address2" id="address2" size="45"></td>
</tr>
<tr>  
  <th>직업</th>
  <td style="text-align: left">
        <select name="job"  id="job">
          <option value="0">선택하세요.</option>
          <option value="A01" <%if(job.equals("A01")) {out.print("selected");}%>>칼쟁이</option>
          <option value="A02" <%if(job.equals("A02")) {out.print("selected");}%>>마법나부랭이</option>
          <option value="A03" <%if(job.equals("A03")) {out.print("selected");}%>>활쟁이</option>
          <option value="A04" <%if(job.equals("A04")) {out.print("selected");}%>>고기방패</option>
          <option value="A05" <%if(job.equals("A05")) {out.print("selected");}%>>기타</option>
        </select>
  </td>
</tr>
<tr style="height: 100px;">
  <th colspan="2" class="font1" style="padding-top: 35px;">서쪽 마녀를 쓰러뜨리면 오즈의 마법사가 당신의 소원을 이뤄줄 것입니다</th>
</tr>
<tr>
  <th>당신의 소원은?</th>
  <td style="text-align: left"><input type="text" name="hope" id="hope" size="45" value="<%=dto.getHope()%>" required></td>
</tr>
<tr>
    <td colspan="2">
        <input type="submit" value="수정"  class="btn btn-primary"/>
        <input type="reset"  value="취소"      class="btn btn-primary"/>
    </td>
</tr>
</table>

<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
</div>
<div class="col-lg-2"></div>
</div>
</form>

	</div>
 <!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>