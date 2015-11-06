<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>joinForm</title>


<!-- 모바일 웹 페이지 설정 -->
<!-- <link rel="shortcut icon" href="file:///C|/Users/Gunsik/Desktop/image/icon.png" /> -->
<!-- <link rel="apple-touch-icon" href="file:///C|/Users/Gunsik/Desktop/image/icon.png" /> -->
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="../js/html5shiv.js"></script>
		<![endif]-->

<link rel="stylesheet" type="text/css"
	href="/Project_Recipe/include/css/event.css">
<style type="text/css">
@import url("/Project_Recipe/include/css/event.css");
</style>
<script type="text/javascript"
	src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		//id 속성이 join인 <form>태그 안의 submit 버튼을 누른 경우
		$("#join").click(function() {
			/** 아이디 입력검사 */
			//$(input 요소).val() 함수는 사용자가 입력한 값.
			var id = $("input[name='id']").val();

			if (id.replace(/\s/g, "") == "") {
				alert("아이디를 입력하세요.");
				$("input[name='id']").val("");
				$("input[name='id']").focus();
				return false;
			}

			/**비밀번호 입력검사 */
			if ($("input[name='passwd']").val().replace(/\s/g, "") == "") {//비밀번호 값이 공백이면
				alert("비밀번호를 입력하세요.");
				$("input[name='passwd']").val("");
				$("input[name='passwd']").focus();

				//submit되면 결과 확인이 안되므로 전송처리 강제 종료
				return false;
			}
			/**이름 입력검사 */
			var name = $("input[name='name']").val();
			if (name.replace(/\s/g, "") == "") {
				alert("이름을 입력하세요.");
				$("input[name='name']").val("");
				$("input[name='name']").focus();
				return false;
			}

			/**닉네임 입력검사 */
			var nickname = $("input[name='nickname']").val();
			if (nickname.replace(/\s/g, "") == "") {
				alert("닉네임을 입력하세요.");
				$("input[name='nickname']").val("");
				$("input[name='nickname']").focus();
				return false;
			}

			/** 이메일주소 입력여부 검사 */
			if ($("input[name='email']").val().replace(/\s/g, "") == "") {
				alert("이메일 주소를 입력하세요.");
				$("input[name='email']").val("");
				$("input[name='email']").focus();
				return false;
			}

			/** 핸드폰 번호 입력여부 검사 */
			if ($("input[name='phone']").val().replace(/\s/g, "") == "") {
				alert("핸드폰 번호를 입력하세요.");
				$("input[name='phone']").val("");
				$("input[name='phone']").focus();
				return false;
			}
			var phone = /\d{3}-\d{3,4}-\d{4}/;
			if ($("input[name='phone']").val().search(phone) < 0) {
				alert("예로 [010-1234-5678] 형식으로 입력하셔야 합니다.");
				return false;
			} else {
				$("#f_join").attr("method", "POST");
				$("#f_join").attr("action", "/Project_Recipe/board/joinInsert.do");
				$("#f_join").submit();
			}
		});

	});

	//	/** 입력내용을 화면에 출력해 봅시다. */
	//		var id = $("input[name='id']").val();
	//		var passwd = $("input[name='passwd']").val();
	//		var name = $("input[name='name']").val();
	//		var nickname = $("input[name='nickname']").val();
	//		var email   = $("input[name='email']").val()+"@"
	//					 +$("select[name='emailAddress']").val();
	//		var phone    = $("input[name='phone']").val();

	/*	//출력할 문자열 만들기
		var result = "<ul>";
		result += "<li>아이디: " +id+"</li>";
		result += "<li>비밀번호: "+passwd+"</li>";
		result += "<li>성별: "	+gender+"</li>";
		result += "<li>이메일: "	+email+"</li>";
		result += "<li>핸드폰번호: "+phone+"</li>";
		result += "<li>취미: "	+select_hobby+"</li>";
		result += "<li>직업: "	+job+"</li>";
		result += "</ul>";
		
		
		$("#formResult").html(result);*/

	//submit 되면 결과확인이 안되므로 전송처리 강제종료
	/*return false;*/
</script>
</head>
<body>
	<h1>회원가입</h1>
	<form name="form1" id="f_join">
		<div id="input">
			<h3>아이디</h3>
			<input type="text" name="id" id="id" />
			<h3>비밀번호</h3>
			<input type="password" name="passwd" id="passwd" />
			<h3>이름</h3>
			<input type="text" name="name" id="name" placeholder="홍길동" />
			<h3>닉네임</h3>
			<input type="text" name="nickname" id="nickname" />
			<h3>이메일 주소</h3>
			<input type="text" name="email" id="email" />@ <select
				name="emailAddress" id="emailAddress">
				<option value="naver.com">naver.com</option>
				<option value="nate.com">nate.com</option>
				<option value="daum.net">daum.net</option>
			</select>

			<h3>핸드폰번호</h3>
			<input type="tel" name="phone" id="phone" placeholder="010-234-5678" />


			<input type="button" value="회원가입" id = "join" name ="join" class="myButton" /> <input
				type="reset" value="다시작성" class="myButton" />
		</div>
	</form>
	<div id="formResult"></div>
</body>
</html>