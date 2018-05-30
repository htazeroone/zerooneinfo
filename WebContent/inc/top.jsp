<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	DAO dao;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/top2.css" />
<title>Insert title here</title>

<!-- <style type="text/css">

.lec {
	overflow:hidden;
}
.main{
	position:relative;
	float:left;
	width: 200px;
	height: 23px;
	overflow: hidden;
}
.add {
	float:left;
}
.sub{
	position:relative;
	width: 85px;
	height: 20px;
	line-height: 20px;
	font-size: 20px;
	margin-left: 5px;
}

</style> -->

</head>
<body>



<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('.main').each(function() {
		$(this).attr('data-flag',0);
	});

	$('.main').click(
		function() {
			var hh = [$(this).find('.sub').length*27+30+"px", "30px"];
			var flag = eval($(this).attr('data-flag'));

			$(this).stop().animate( {height: hh[flag]}, 200, 'easeOutBounce');

			$(this).attr('data-flag', (++flag)%2);
		}
	);
});

</script>


<body>

<nav>
	<ul>
		<li><a href="../main/Main">Home</a></li>
		<li><a href="#">이론게시판</a>
			<ul>
			<%
				dao = new DAO();
				ArrayList<String> subjects = dao.getSubjects();

				for(int i = 0; i<subjects.size(); i++) { %>

					<li><a href="../lecture/List?subject=<%=subjects.get(i)%>"><%=subjects.get(i)%></a></li>


			<% }
				dao.close();
			%>

			</ul>
		</li>
		<li><a href="#">퀴즈</a>
			<ul>
			<%
				if(session.getAttribute("pname")!=null){
					for(int i = 0; i<subjects.size(); i++) { %>
						<li><a href="../quizbox/QuizMain?subject=<%=subjects.get(i)%>"><%=subjects.get(i)%></a></li>

			<% 		}
				}%>
			
			</ul>
		</li>
		<li><a href="#">Info</a>
			<ul>
				<li><a href="../info/Qna">QnA</a></li>
				<li><a href="../info/Notice">Notice</a></li>
			</ul>
		</li>

<%
	if(session.getAttribute("pname")!=null){
		%>
	<!-- <li><a href="#">마이페이지</a> -->
		<li><a href="#"><%=session.getAttribute("pname")%>님 페이지</a>
			<ul>
				<li><a href="../login/Logout">로그아웃</a></li>	
				<c:if test="${sessionScope.pid != 'admin' }">
				<li><a href="#">학습성취도</a>
						<ul>
				<%
					dao = new DAO();
					ArrayList<String> achieveLec = dao.getAchieveChapters(session);
					for(int i = 0; i<achieveLec.size(); i++) { %>
						<li><a href="../mypage/Achieve?subject=<%=achieveLec.get(i)%>"><%=achieveLec.get(i)%></a></li>
				<% }
					dao.close();
				%>
						</ul>
				
				
				</li>
				<li><a href="#">학습노트</a>
					<ul>
				<%
				dao = new DAO();
					ArrayList<String> studyLec = dao.getStudyChapters(session);
					for(int i = 0; i<studyLec.size(); i++) { %>
						<li><a href="../mypage/Note?subject=<%=studyLec.get(i)%>"><%=studyLec.get(i)%></a></li>
				<% }
					dao.close();
				%>
					</ul>
				</li>
				<li><a href="#" >오답노트</a>
					<ul>
				<%
				dao = new DAO();
					ArrayList<String> oxLec = dao.getOxChapter(session);
					dao.close();
					for(int i = 0; i<oxLec.size(); i++) { %>
						<li><a href="../mypage/IncorrectNote?subject=<%=oxLec.get(i)%>"><%=oxLec.get(i)%></a></li>
				<% }
					dao.close();
				%>
					</ul>
				
				</li>
				</c:if>
				<li><a href="../mypage/ModifyPwForm">비밀번호변경</a></li>
				
				<c:if test="${sessionScope.pid == 'admin'}">
					<li><a href="../lecture/AddLectureForm">과목 추가하기</a></li>
					<li><a href="../lecture/DeleteLectureForm">과목 삭제하기</a></li>
					
				</c:if>
				
				<c:if test="${sessionScope.pid != 'admin'}">
					<li><a href="../mypage/OutForm">회원탈퇴</a></li>
				</c:if>

			</ul>
		</li>

		<!-- <li><a href="../login/Logout">로그아웃</a></li> -->

		<%
	}else{
		%>

		<li><a href="../login/LoginForm">로그인</a></li>
		<%
	}
%>
	</ul>

</nav>


</body>
</html>

