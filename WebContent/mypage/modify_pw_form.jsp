<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css" />

<script type="text/javascript">
	function pwChk(){
		var frm = document.frm;
		var newpw1 = frm.newpw1;
		var newpw2 = frm.newpw2;

        if(newpw1.value==''|| !(/^(?=.*[a-zA-Z])(?=.*[0-9]).{7,20}$/.test(newpw1.value))){
        	alert('비밀번호 규칙을 확인해주세요');
        	newpw1.value='';
        	newpw2.value='';
        	newpw1.focus();
            return;
        }

		if(newpw1.value!=newpw2.value){
			alert('새비밀번호가 일치하지 않습니다.');
			newpw1.value='';
			newpw2.value='';
			newpw1.focus();
			return;
		}

		frm.action="ModifyPwReg";
		frm.submit();
	}
</script>


  <div class="site__container">
<p class="text--center">* 비밀번호는 영대소문자, 숫자조합으로 7자 이상 20자 이하입니다</p>
    <div class="grid__container">


<form name="frm" method="post"  class="form form--login">
	<input type="hidden" name="pid" value="<%=session.getAttribute("pid") %>" />

         <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" name="oldpw" type="password" class="form__input" placeholder="Password" required>
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" name="newpw1" type="password" class="form__input" placeholder="New Password" required>
        </div>

        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" name="newpw2" type="password" class="form__input" placeholder="Confirm the New Password" required>
        </div>

        <div class="form__field">
          <input type="button" onclick="pwChk()" value="비밀번호변경">
        </div>

	</form>
    </div>

  </div>
