<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert('${msg}');
	location.href="${url}";
	

</script>

	<%
	//로그아웃 또는 회원 탈퇴 시 세션 삭제 
	
	if(request.getAttribute("logout")!=null || request.getAttribute("out")!=null){
		session.removeAttribute("pname");
		session.removeAttribute("pid");
		
	}
	%>