<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/SemiQuiz/cssb/bootstrap.css">
<script type="text/javascript" src="../../nse_files/js/HuskyEZCreator.js" charset="utf-8">
</script>   

<form name = "nse" action ="ModifyProblemReg" method="post"  enctype="multipart/form-data">
	<input type="hidden" name="page" value="${param.page }">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="subject" value="${subname }">
	<input type="hidden" name="chname" value="${chname }">
	<input type="hidden" name="id" value="${problem.id }">
	<table border="">
		<tr>
			<td>Question</td>
			<td  width="600" height="200">
			<textarea name="question" id="ir1" class="nse_content">${problem.question }</textarea>
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
			<td>선택지 1</td>
			<td><textarea name="s1" rows="1" cols="80">${problem.s1 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 2</td>
			<td><textarea name="s2" rows="1" cols="80">${problem.s2 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 3</td>
			<td><textarea name="s3" rows="1" cols="80">${problem.s3 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 4</td>
			<td><textarea name="s4" rows="1" cols="80">${problem.s4 } </textarea></td>
		</tr>
		<tr>
			<td>선택지 5</td>
			<td><textarea name="s5" rows="1" cols="80">${problem.s5 } </textarea></td>
		</tr>
		<tr>
			<td>정답</td>
			<td><textarea name="answer" rows="1" cols="80">${problem.answer }</textarea></td>
		</tr>								
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정" onclick="submitContents(this)" />
				<input type ="reset" value="초기화" />
				<a href="Chapter?num=${num}&page=${page }&subject=${subname }&chname=${chname}">[돌아가기]</a>
			</td>			
		</tr>				
	</table>
</form>    