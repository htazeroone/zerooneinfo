<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/quiztoggle.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/quizlist.css" />

<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
<script>
function chkchk(){

   location.href='Chapter?num=${num}&page=${endPage+1 }&subject=${subname }&chname=${chname}';
}

function allChk(){

   var frm = document.frm;   
   '<c:forEach var="qq" items="${problem}" varStatus="no">'

      var id = ${qq.id};
      var chk = $('input:radio[name=selection'+${qq.id}+']').is(':checked');
      
      if(!chk){
         alert('문제를 빠짐없이 풀어주세요');
         return;
      }      
   
   '</c:forEach>'
      frm.action = "Answer?num=${param.num}&subject=${param.subject}&chname=${param.chname}";
      frm.submit();
}

function ssQuiz(){
   var ssfrm = document.frm;
   var schkArr = new Array();
   var msg = "";
   var size = $('input:checkbox[name=saveId]').length;
   
   '<c:forEach var="rs" items="${result }">'
      
      var id = ${rs.id}; 
      var chk = $('input:checkbox[id='+${rs.id}+']').prop('checked');
      id += '';
      
      if(chk){
         msg += id+'번 '
      }
            
   '</c:forEach>'
      msg += '문제를 저장합니다.'
   
   alert(msg)
   ssfrm.action = "ProblemSave?num=${param.num}&subject=${param.subject}&chname=${param.chname}";
   ssfrm.submit();
   
}
</script>

</head>

<div class="new_list_cate inline"><h3><strong>chapter${num }.${chname }&nbsp;|&nbsp;</strong></h3></div>
         <c:if test="${sessionScope.pid == 'admin'}">
            <a href="../quizbox/AddProblemForm?num=${num}&page=${page+1 }&subject=${subname }&chname=${chname}">[문제 추가]</a>
         </c:if>


 <c:choose>
   <c:when test="${!empty problem && !empty result }">
   
      
   <form name="frm" method="post">
   <input type="hidden" name="page" value="${param.page }">
   <input type="hidden" name="num" value="${num }"> 
   <input type="hidden" name="subject" value="${subname }"> 
   <input type="hidden" name="chname" value="${chname }">

   <c:forEach varStatus="no" var="in" items="${problem }">
   <c:forEach varStatus="no" var="rs" items="${result }">
   <c:if test="${rs.id==in.id }">

       <input type="hidden" name="qqid${in.id }" value="${in.id }">

            <div class="contest-stream"   style="width: 978px; min-height: 378px; *min-height: 1500px; margin-bottom: 47px; display: inline-block; zoom: 1; *display: inline;">

               <div class="new_list_item "   style="border-left: 3px solid #ff9557; padding-left: 12px;">

                  <div class="new_list_left inline">

                     <div class="new_list_sub inline">

                        <div class="new_list_sub_top">

                           <div class="new_list_cate inline">문제${in.id }.
                              &nbsp;|&nbsp;</div>
                           <strong>${in.question }</strong>   
                              <c:if test="${sessionScope.pid == 'admin'}">
                                 <a href="../quizbox/ModifyProblemForm?num=${num}&page=${page }&subject=${subname }&chname=${chname}&id=${in.id }">[문제 수정]</a>
                              </c:if>
                        </div>

                        <div class="new_list_sub_bot">
                           <div class="new_list_id inline">정답률</div>
                           <div class="new_list_count inline">
                              <strong>${in.correction/in.total*100 }%</strong>
                           </div><br /><br />
                           
                           <c:choose>
                              <c:when test="${rs.input=='1' }">
                              <div><input type="radio" name="selection${in.id }" value="1" checked="checked" id="${in.s1 }">
                              <label for="${in.s1 }"><span></span>${in.s1 }</label><br/> </div>
                              </c:when>
                              <c:otherwise>
                              <div><input type="radio" name="selection${in.id }" value="1" id="${in.s1 }">
                              <label for="${in.s1 }"><span></span>${in.s1 }</label><br/> </div>
                              </c:otherwise>
                           </c:choose>
                           <c:choose>
                              <c:when test="${rs.input=='2' }">                              
                              <div><input type="radio" name="selection${in.id }" value="2" checked="checked" id="${in.s2 }">
                              <label for="${in.s2 }"><span></span>${in.s2 }</label><br/> </div>
                              </c:when>
                              <c:otherwise>
                              <div><input type="radio" name="selection${in.id }" value="2" id="${in.s2 }">
                              <label for="${in.s2 }"><span></span>${in.s2 }</label><br/> </div>
                              </c:otherwise>
                           </c:choose>
                           <c:choose>
                              <c:when test="${rs.input=='3' }">                                                         
                              <div><input type="radio" name="selection${in.id }" value="3" checked="checked" id="${in.s3 }">
                              <label for="${in.s3 }"><span></span>${in.s3 }</label><br/></div>
                              </c:when>
                              <c:otherwise>
                              <div><input type="radio" name="selection${in.id }" value="3" id="${in.s3 }">
                              <label for="${in.s3 }"><span></span>${in.s3 }</label><br/></div>
                              </c:otherwise>
                           </c:choose>                              
                           <c:choose>
                              <c:when test="${rs.input=='4' }">                              
                              <div><input type="radio" name="selection${in.id }" value="4" checked="checked" id="${in.s4 }">
                              <label for="${in.s4 }"><span></span>${in.s4 }</label><br/></div>
                              </c:when>
                              <c:otherwise>
                              <div><input type="radio" name="selection${in.id }" value="4" id="${in.s4 }">
                              <label for="${in.s4 }"><span></span>${in.s4 }</label><br/></div>
                              </c:otherwise>
                           </c:choose>                              
                           <c:choose>
                              <c:when test="${rs.input=='5' }">                              
                              <div><input type="radio" name="selection${in.id }" value="5" checked="checked" id="${in.s5 }">
                              <label for="${in.s5 }"><span></span>${in.s5 }</label><br/> </div>
                              </c:when>
                              <c:otherwise>
                              <div><input type="radio" name="selection${in.id }" value="5" id="${in.s5 }">
                              <label for="${in.s5 }"><span></span>${in.s5 }</label><br/> </div>                                                            
                              </c:otherwise>
                           </c:choose>                                                            
                           </div>
                     </div>
               </div>
               
         <div class="new_list_right inline">
         <div>
            <div class="new_list_pay" style="float:left;">
               학습노트에 저장   
            </div>
            
            <div class="onoffswitch" style="float:left; margin-bottom:10px; margin-left:5px;">      
               <input type="checkbox" name="saveId" value="${rs.id }" class="onoffswitch-checkbox" id="${rs.id }">                                 
               <label class="onoffswitch-label" for="${rs.id }">
               <span class="onoffswitch-inner"></span>
               <span class="onoffswitch-switch"></span>
               </label>
            </div>

         
         </div>
         <div>
            <div class="new_list_pay_twice" style="margin-top:37px;">
               결과: 
               <c:choose>
                  <c:when test="${rs.ox eq '1' }">
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
               정답: ${in.answer }
            </div>
         </div>
        </div>
   </div>
</div>   
      </c:if>

         </c:forEach>      
         </c:forEach>         

      <table>
         <tr>
            <td><input type="button" onclick="allChk()" value="정답 확인" class="myButton"></td>
            <c:if test="${startPage > 1 }">
            <td><input type="button" onclick="location.href='Chapter?num=${num}&page=${startPage-1 }&subject=${subname }&chname=${chname}'" value="이전 페이지" class="myButton"></td>
            </c:if>
            <c:forEach var="i" begin="${startPage }" end="${endPage }">
               <c:choose>
                  <c:when test="${i!=page }">
                  <td><input type="button" onclick="Location.href='Chapter?num=${num}&page=${i }&subject=${subname }&chname=${chname}'" value="다음 페이지" class="myButton"></td>                  
                  </c:when>
               </c:choose>
            </c:forEach>
            <c:if test="${endPage < totalPage }">
            <td><input type="button" onclick="chkchk()" value="다음 페이지" class="myButton"></td>            
            </c:if>
            <td><input type="button" onclick="ssQuiz()" value="선택 문제 저장" class="myButton"></td>
         </tr>
      </table>            
         </form>
   </c:when>
   
   
   <c:otherwise>
   
   <form name="frm" method="post">
   <input type="hidden" name="page" value="${param.page }">
   <input type="hidden" name="num" value="${num }"> 
   <input type="hidden" name="subject" value="${subname }"> 
   <input type="hidden" name="chname" value="${chname }">

         <c:choose>
         <c:when test="${problem.size()==0 }">
             <strong>학습할 문제가 없습니다.</strong>
          </c:when>
      <c:otherwise>
      <c:forEach varStatus="no" var="qq" items="${problem }">
            <input type="hidden" name="qqid" value="${qq.id }">

            <div class="contest-stream"   style="width: 978px; min-height: 378px; *min-height: 1500px; margin-bottom: 47px; display: inline-block; zoom: 1; *display: inline;">

               <div class="new_list_item "   style="border-left: 3px solid #ff9557; padding-left: 12px;">

                  <div class="new_list_left inline">

                     <div class="new_list_sub inline">

                        <div class="new_list_sub_top">

                           <div class="new_list_cate inline">문제${qq.id }.
                              &nbsp;|&nbsp;</div>
                           <strong>${qq.question }</strong>   
                              <c:if test="${sessionScope.pid == 'admin'}">
                                 <a href="../quizbox/ModifyProblemForm?num=${num}&page=${page }&subject=${subname }&chname=${chname}&id=${qq.id }">[문제 수정]</a>
                              </c:if>
                        </div>

                        <div class="new_list_sub_bot">
                           <div class="new_list_id inline">정답률</div>
                           <div class="new_list_count inline">
                              <strong>${qq.correction/qq.total*100 }%</strong>
                           </div><br /><br />
                           
                              <input type="radio" name="selection${qq.id }" value="1" id="${qq.s1 }">
                              <label for="${qq.s1 }"><span></span>${qq.s1 }</label><br/>
                  
                              <input type="radio" name="selection${qq.id }" value="2" id="${qq.s2 }">
                              <label for="${qq.s2 }"><span></span>${qq.s2 }</label><br/>
                  
                              <input type="radio" name="selection${qq.id }" value="3" id="${qq.s3 }">
                              <label for="${qq.s3 }"><span></span>${qq.s3 }</label><br/>
                  
                              <input type="radio" name="selection${qq.id }" value="4" id="${qq.s4 }">
                              <label for="${qq.s4 }"><span></span>${qq.s4 }</label><br/>
                  
                              <input type="radio" name="selection${qq.id }" value="5" id="${qq.s5 }">
                              <label for="${qq.s5 }"><span></span>${qq.s5 }</label><br/>
                           </div>
                     </div>
               </div>
         </div>
</div>   
            </c:forEach>
         
         
      <table>
         <tr>
            <td><input type="button" onclick="allChk()" value="정답 확인" class="myButton"></td>
            
            <c:if test="${startPage > 1 }">
            <td>
            <input type="button" onclick="location.href='Chapter?num=${num}&page=${startPage-1 }&subject=${subname }&chname=${chname}'" value="이전 페이지" class="myButton">
            </td>
            </c:if>
            
            <c:forEach var="i" begin="${startPage }" end="${endPage }">
               <c:choose>
                  <c:when test="${i!=page }">
                  <td>
                     <input type="button" onclick="Location.href='Chapter?num=${num}&page=${i }&subject=${subname }&chname=${chname}'" value="다음 페이지" class="myButton">                  
                  </td>
                  </c:when>
               </c:choose>
            </c:forEach>
            <c:if test="${endPage < totalPage }">
               <td><input type="button" onclick="chkchk()" value="다음 페이지" class="myButton"></td>         
            </c:if>
            
         </tr>
      </table>
         </c:otherwise>
         </c:choose>
      </form>   
    </c:otherwise>
   </c:choose> 
</body>
</html>