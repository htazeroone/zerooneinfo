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
	width: 800px;
	height: 500px;	
}

</style>

<div id="dd">
<form name="nse" action="ModifyReg" method="post">
<input type="hidden" name="id" value="${data.id }">
<input type="hidden" name="subject" value="${param.subject}">

<table border="" class="table">
	<tr>
		<td>챕터</td>
		<td>
			<select name="head">
				<c:forEach var="i" items="${chapList }" varStatus="no">
					<c:if test="${no.count != 1 }">
					<c:choose>
						<c:when test="${i == chapName}">
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
		<td>제목</td>
		<td><input type="text" name="title" value="${data.title }"></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><input type="text" name="pname" value="${data.pname }"></td>
	</tr>

	<tr>
		<td>이론설명</td>
			<td  width="600" height="200">
			<textarea name="content" id="ir1" class="nse_content">${data.content }</textarea>
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
			<input type="submit" value="수정하기" onclick="submitContents(this)"/>
			<a href="ModifyForm?id=${data.id }&subject=${param.subject}">초기화</a>
			<a href="List?id=${data.id }&subject=${param.subject}">목록</a>
			<a href="Detail?id=${data.id }&subject=${param.subject}">뒤로</a>
		</td>
	</tr>
</table>
</form>
</div>
<script src="/SemiQuiz/jsb/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/SemiQuiz/jsb/bootstrap.js"></script>