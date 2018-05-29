<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css" />


  <div class="site__container">

    <div class="grid__container">
	<p class="text--center">회원탈퇴를 위해 비밀번호를 입력해주세요.</p>
	<form action="../mypage/OutReg" method="post"  class="form form--login">
	<input type="hidden" name="pid" value="<%=session.getAttribute("pid") %>" />


         <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input id="login__password" name="pw" type="password" class="form__input" placeholder="Password" required>
        </div>

        <div class="form__field">
          <input type="submit" value="회원탈퇴">
        </div>

	</form>

    </div>

  </div>
