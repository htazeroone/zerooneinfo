<%@ tag language="java" pageEncoding="UTF-8"%>


<jsp:doBody var="con" scope="page"/>

<%
	String con = (String)jspContext.getAttribute("con");
		
	String res = "";
	
	if(Integer.parseInt(con) == 0) {
		res = "전체";
	} else if(Integer.parseInt(con) == 1) {
		res = "자바 시작하기";
	} else if(Integer.parseInt(con) == 2) {
		res = "변수와 타입";
	}else if(Integer.parseInt(con) == 3) {
		res = "연산자";
	}else if(Integer.parseInt(con) == 4) {
		res = "조건문과 반복문";
	}else if(Integer.parseInt(con) == 5) {
		res = "참조타입";
	}else if(Integer.parseInt(con) == 6) {
		res = "클래스";
	}else if(Integer.parseInt(con) == 7) {
		res = "상속";
	}else if(Integer.parseInt(con) == 8) {
		res = "인터페이스";
	}else if(Integer.parseInt(con) == 9) {
		res = "예외처리";
	} else if(Integer.parseInt(con) == 10) {
		res = "기본 API 클래스";
	}

%>

<%=res %>

