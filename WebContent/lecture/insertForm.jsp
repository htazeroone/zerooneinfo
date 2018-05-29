<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ct" tagdir="/WEB-INF/tags" %>

<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
<script type="text/javascript" src="../../nse_files/js/HuskyEZCreator.js" charset="utf-8">
</script>

<style>
#dd{
	margin: 0 auto;
	width: 1000px;
	height: 400px;
		
}
.title {
	text-align:center;
}

table {
	width:1000px;
	height:400px;
}
#sel {
	text-align: left;
}
</style>

<div id="dd">
<form name="nse" action="InsertReg" method="post" enctype="multipart/form-data">
<input type="hidden" name="subject" value="${param.subject }">

<table border="" >
	<tr>
		<td class="title">챕터</td>
		<td>
			<select id="sel"  name="head">
				<c:forEach var="i" items="${chapList }" varStatus="no">
					<c:if test="${no.count != 1 }">
					<c:choose>
						<c:when test="${no.index == head}">
							<option value="${no.index }" selected="selected">${i }</option>
						</c:when>
						<c:otherwise>
							<option value="${no.index }">${i }</option>
						</c:otherwise>
					</c:choose>
					</c:if>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="title">제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td class="title">글쓴이</td>
		<td><input type="text" name="pname" value="${sessionScope.pname}"></td>
	</tr>

	<tr>
		<td class="title">이론설명</td>
			<td  width="600" height="200">
			<textarea name="content" id="ir1" class="nse_content">text editor야 되어라</textarea>
			<script type="text/javascript">
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "ir1",
				sSkinURI : "../../nse_files/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
			
			function submitContents(elClickedObj) {
				// 에디터의 내용이 textarea에 적용됩니다.
				oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
				try {
					elClickedObj.form.submit();
				} catch (e) {
				}
			}
		</script>
		</td>			
	</tr>
	<tr>
		<td colspan="2" align="right">
			<input type="submit" value="글 등록" onclick="submitContents(this)"/>&nbsp&nbsp&nbsp
			<a href="List?page=${param.page }&subject=${param.subject}">뒤로</a>
		</td>
	</tr>
</table>
</form>
</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>
