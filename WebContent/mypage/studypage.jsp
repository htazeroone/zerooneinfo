<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/toggle2.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/studylist2.css" />

<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script>
function allChk(){

	var frm = document.frm;
	'<c:forEach var="q" items="${qInfo}" varStatus="no">'

		var id = ${q.id};
		var chk = $('input:radio[name='+${q.id}+']').is(':checked');

		if(!chk){
			alert('문제를 빠짐없이 풀어주세요');
			return;
		}
	'</c:forEach>'
		frm.action = "Note?subject=${subject}&chid=${chid}";
		frm.submit();
}

function ddQuiz(){
	var ddfrm = document.frm;
	var chkArr = new Array();
	var msg = "";
	var size = $('input:checkbox[name=deleteId]').length;

	'<c:forEach var="a" items="${res }">'

		var id = ${a.id};
		var chk = $('input:checkbox[id='+${a.id}+']').prop('checked');
		id += '';

		if(chk){
			msg += id+'번 '
		}

	'</c:forEach>'
		msg += '문제를 삭제합니다.'

	alert(msg)
	ddfrm.action = "Note?subject=${subject}&chid=${chid}&delete=delete";
	ddfrm.submit();

}

</script>


<!-- 문제 출력 부분  -->

<c:choose>
	<c:when test="${!empty idAndInput && !empty res }">



		<form name="frm" method="post">
		<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
		<input type="hidden" value="${chid }" name="chid">
		<input type="hidden" value="${subject }" name="subject">


		<c:forEach var="in" items="${idAndInput }">
			<c:forEach var="a" items="${res }">

			<c:if test="${a.id==in.id }">






	<div class="contest-stream" style="width:978px;min-height:378px; *min-height:1500px; margin-bottom:47px; display:inline-block; zoom:1; *display:inline;">

	<div class="new_list_item " style="border-left: 5px solid #ff9557;padding-left:12px;">

		<div class="new_list_left inline">

			<div class="new_list_sub inline">

				<div class="new_list_sub_top">
        			<div class="new_list_cate inline">
        				문제${in.id }. &nbsp;|&nbsp;
        			</div>
					<strong>${in.question }</strong>
        		</div>

				<div class="new_list_sub_bot">
        			<div class="new_list_id inline">
        				정답률
					</div>
        			<div class="new_list_count inline">
			<strong><fmt:formatNumber value="${in.correction/in.total*100 }" pattern=".0" />%</strong>
        			</div><br/><br/>



				<c:choose>
					<c:when test="${in.input==(no.index+1) }">
					<div><input type="radio" name="${in.id }" value="1" checked="checked" id="${in.s1 }">
					<label for="${in.s1 }"><span></span>${in.s1 }</label></div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="1" id="${in.s1 }">
					<label for="${in.s1 }"><span></span>${in.s1 }</label></div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${in.input==(no.index+2) }">
					<div><input type="radio" name="${in.id }" value="2" checked="checked" id="${in.s2 }">
					<label for="${in.s2 }"><span></span>${in.s2 }</label></div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="2" id="${in.s2 }">
					<label for="${in.s2 }"><span></span>${in.s2 }</label></div>
					</c:otherwise>
				</c:choose>
								<c:choose>
					<c:when test="${in.input==(no.index+3) }">
					<div><input type="radio" name="${in.id }" value="3" checked="checked" id="${in.s3 }">
					<label for="${in.s3 }"><span></span>${in.s3 }</label></div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="3" id="${in.s3 }">
					<label for="${in.s3 }"><span></span>${in.s3 }</label></div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${in.input==(no.index+4) }">
					<div><input type="radio" name="${in.id }" value="4" checked="checked" id="${in.s4 }">
					<label for="${in.s4 }"><span></span>${in.s4 }</label></div>

					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="4" id="${in.s4 }">
					<label for="${in.s4 }"><span></span>${in.s4 }</label></div>

					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${in.input==(no.index+5) }">
					<div><input type="radio" name="${in.id }" value="5" checked="checked" id="${in.s5 }">
					<label for="${in.s5 }"><span></span>${in.s5 }</label></div>
					</c:when>
					<c:otherwise>
					<div><input type="radio" name="${in.id }" value="5" id="${in.s5 }">
					<label for="${in.s5 }"><span></span>${in.s5 }</label></div>
					</c:otherwise>
				</c:choose>


				</div>

			</div>
		</div>







		<div class="new_list_right inline">
			<div>
				<div class="new_list_pay" style="float:left;">
					학습노트에서 제거
				</div>



				<div class="onoffswitch" style="float:left; margin-bottom:10px; margin-left:5px;">
					<input type="checkbox" name="deleteId" value="${a.id }" class="onoffswitch-checkbox" id="${a.id }">
					<label class="onoffswitch-label" for="${a.id }">
					<span class="onoffswitch-inner"></span>
					<span class="onoffswitch-switch"></span>
					</label>
				</div>


			</div>
			<div>
				<div class="new_list_pay_twice" style="margin-top:37px;">
					결과:
					<c:choose>
						<c:when test="${a.ox eq '1' }">
						O
						</c:when>
						<c:otherwise>
						X
						</c:otherwise>
					</c:choose>

				</div>
			</div>
			<div>
				<div class="new_list_pay_twice ">
					정답: ${a.answer }
				</div>
			</div>
			<div>
				<div class="new_list_pay_twice ">
					이전 선택답: ${a.input }
				</div>
			</div>

        </div>
	</div>
</div>

				</c:if>
				</c:forEach>
			</c:forEach>

			<div><input type="button" onclick="allChk()" value="정답 확인" class="myButton" style="float:left"></div>
			<div><input type="button" onclick="ddQuiz()" value="선택 문제 삭제" class="myButton" style="margin-left: 100px; float:left"></div>
		</form>


	</c:when>

	<c:otherwise>

	<form name="frm" method="post">
	<input type="hidden" value="<%=session.getAttribute("pid") %>" name="pid">
	<input type="hidden" value="${chid }" name="chid">
	<input type="hidden" value="${subject }" name="subject">

		<c:if test="${!empty qInfo }">
		<c:forEach var="q" items="${qInfo }">

<div class="contest-stream" style="width:978px;min-height:378px; *min-height:1500px; margin-bottom:47px; display:inline-block; zoom:1; *display:inline;">

	<div class="new_list_item " style="border-left: 5px solid #ff9557;padding-left:12px;">

		<div class="new_list_left inline">

			<div class="new_list_sub inline">

				<div class="new_list_sub_top">
        			<div class="new_list_cate inline">
        				문제${q.id }. &nbsp;|&nbsp;
        			</div>
					<strong>${q.question }</strong>
        		</div>

				<div class="new_list_sub_bot">
        			<div class="new_list_id inline">
        				정답률
					</div>
        			<div class="new_list_count inline">
        			<strong><fmt:formatNumber value="${q.correction/q.total*100 }" pattern=".0" />%</strong>
        			</div><br/><br/>

						<input type="radio" name="${q.id }" value="1" id="${q.s1 }">
						<label for="${q.s1 }"><span></span>${q.s1 }</label><br/>

						<input type="radio" name="${q.id }" value="2" id="${q.s2 }">
						<label for="${q.s2 }"><span></span>${q.s2 }</label><br/>

						<input type="radio" name="${q.id }" value="3" id="${q.s3 }">
						<label for="${q.s3 }"><span></span>${q.s3 }</label><br/>

						<input type="radio" name="${q.id }" value="4" id="${q.s4 }">
						<label for="${q.s4 }"><span></span>${q.s4 }</label><br/>

						<input type="radio" name="${q.id }" value="5" id="${q.s5 }">
						<label for="${q.s5 }"><span></span>${q.s5 }</label><br/>
				</div>

			</div>
		</div>
	</div>
</div>


		</c:forEach>
		<div><input type="button" onclick="allChk()" value="정답 확인" class="myButton"></div>
		</c:if>

	</form>

	</c:otherwise>
</c:choose>

