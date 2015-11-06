<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!-- 모바일 웹 페이지 설정 -->
<link rel="stylesheet" type="text/css"
	href="/Project_Recipe/include/css/main.css" />
<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
	<script src="../js/html5shiv.js"></script>
	<![endif]-->

<script src="http://use.edgefonts.net/alex-brush:n4:default.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<!-- javascript start -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#menu1").click(function() {
			/* location.href = "/Project_Recipe/board/recipeList.do"; */
			$.ajax({
				url : "/Project_Recipe/board/recipeList.do", //전송 url
				type : "POST", //전송시 method 방식
				/* 				data : $("#f_pwd").serialize(),//폼 전체 데이터 전송 */

				dataType : "text",
				error : function() { //실행시 오류가 발생하였을 경우
					alert('시스템 오류 입니다. 관리자에게 문의 하세요');
				},
				success : function(resultData) { //정상적으로 실행 되었을 경우
					$("#boardbody").html(resultData)
				}
			})
		});

		$("#loginbtn").click(function() {
			$("#loginForm").attr({
				"method" : "post",
				"action" : "/Project_Recipe/board/loginAction.jsp"
			});
			$("#loginForm").submit();

		});
		$("#regbtn").click(function() {
			window.open("/Project_Recipe/joinForm.jsp");
		});
	});
</script>
<script src="http://use.edgefonts.net/alex-brush:n4:default.js"
	type="text/javascript"></script>

<!-- javascript end -->
</head>
<body>

	<div>
		<div id="slidebox">
			<form id="loginForm" name="loginForm">
				<aside id="login">
					<img src="../img/logo_final.png" style="height: 100px; width: 200px;"
						id="mainlogo">
					<%
						String nickname = (String) session.getAttribute("s_name");
						if (nickname == null) {
					%>
					<span> <input type="text" name="id" id="id" placeholder="ID">&nbsp;&nbsp;&nbsp;
						<input type="password" name="passwd" id="passwd" placeholder="PW">
						&nbsp;&nbsp; <input type="button" value="로그인" name="loginbtn"
						id="loginbtn"> <input type="button" align="left"
						value="회원가입" name="regbtn" id="regbtn">
					</span>
			</form>
			<%
				} else {
					//시간을 얻었다.-객체가 유지되는 시간 -페이지가 이동해도 죽지않아 (default - 30분 web.xml에서 변경가능)

					StringBuilder sb_res = new StringBuilder();
					sb_res.append("<span style='align:right'>");
					sb_res.append(nickname + "님 환영합니다.");
					sb_res.append(" <input type='button' id='btn_logout' value='로그아웃' onclick='logout()'>");
					sb_res.append("</span>");
					out.print(sb_res.toString());

				}
			%>
			</aside>
			<ul id="slider">
				<li><img src="../img/broccoli-steak-12-1050x700.jpg"
					alt="image1.jpg" /></li>
				<li><img src="../img/how-to-wrap-onigiri-like-japanes-330x220.jpg"
					alt="image2.jpg" /></li>
				<li><img src="../img/mushrooms-858788_640.jpg" alt="image3.jpg" />
				</li>
			</ul>
		</div>
	</div>
	<div align="center">
		<table>
			<tr>
				<td><input type="button" class="menu" id="menu1" value="훔쳐온 레시피">&nbsp;&nbsp;</td> 
				<td><input type="button" class="menu" id="menu2" value="나만의 레시피">&nbsp;&nbsp;</td> 
				<td><input type="button" class="menu" id="menu3" value="자유 게시판"></td>
			</tr>
		</table>
	</div>
		<div id="boardbody" align="center" style="margin-top: 20px">
			<table border="1" id="maintable" width="800px" height="450px">
				<tr>
					<td><img src="../img/ice-cream-spring-roll23.jpg" class="menuimg"></td>
					<td><img src="../img/prosciutto-and-date-mooncake20.jpg"
						class="menuimg"></td>
					<td><img src="../img/ricotta-stuffed-scone-08.jpg"
						class="menuimg"></td>
				</tr>
				<tr>
					<td><img src="../img/924598_507824372716072_203203596_n.jpg"
						class="menuimg"></td>
					<td><img src="../img/11909313_752854688191582_1351963492_n.jpg"
						class="menuimg"></td>
					<td><img src="../img/11906317_1667559523489650_621965384_n.jpg"
						class="menuimg"></td>
				</tr>
			</table>
		</div>
</body>
<footer align="center" style="color: black; font-size: 12px;">
	<b>Copyright © 2015 God Joo Class 
</footer>
<script type="text/javascript">
	var slider = document.getElementById("slider");
	var slideArray = slider.getElementsByTagName("li");
	var slideMax = slideArray.length - 1;
	var curSlideNo = 0;
	var nextSlideNo = null;
	var fadeStart = false;
	var curSlideLevel = 1;
	var nextSlideLevel = 0;

	for (i = 0; i <= slideMax; i++) {
		if (i == curSlideNo)
			changeOpacity(slideArray[i], 1);
		else
			changeOpacity(slideArray[i], 0);
	}

	function startSlide(dir) {
		if (fadeStart === true)
			return;
		if (dir == "prev") {
			nextSlideNo = curSlideNo - 1;
			if (nextSlideNo < 0)
				nextSlideNo = slideMax;
		} else if (dir == "next") {
			nextSlideNo = curSlideNo + 1;
			if (nextSlideNo > slideMax)
				nextSlideNo = 0;
		} else {
			fadeStart = false;
			return;
		}
		fadeStart = true;
		changeOpacity(slideArray[curSlideNo], curSlideLevel);
		changeOpacity(slideArray[nextSlideNo], nextSlideLevel);
		fadeInOutAction(dir);
	}

	function fadeInOutAction(dir) {
		curSlideLevel = curSlideLevel - 0.1;
		nextSlideLevel = nextSlideLevel + 0.1;
		if (curSlideLevel <= 0) {
			changeOpacity(slideArray[curSlideNo], 0);
			changeOpacity(slideArray[nextSlideNo], 1);
			if (dir == "prev") {
				curSlideNo = curSlideNo - 1;
				if (curSlideNo < 0)
					curSlideNo = slideMax;
			} else {
				curSlideNo = curSlideNo + 1;
				if (curSlideNo > slideMax)
					curSlideNo = 0;
			}
			curSlideLevel = 1;
			nextSlideLevel = 0;
			fadeStart = false;
			return;
		}
		changeOpacity(slideArray[curSlideNo], curSlideLevel);
		changeOpacity(slideArray[nextSlideNo], nextSlideLevel);
		setTimeout(function() {
			fadeInOutAction(dir);
		}, 100);
	}

	function changeOpacity(obj, level) {
		obj.style.opacity = level;
		obj.style.MozOpacity = level;
		obj.style.KhtmlOpacity = level;
		obj.style.MsFilter = "'progid:DXImageTransform.Microsoft.Alpha(Opacity="
				+ (level * 100) + ")'";
		obj.style.filter = "alpha(opacity=" + (level * 100) + ");";
	}

	//1초마다 Fade In/Out 슬라이드를 반복하는 코드
	var autoslider = setInterval(function() {
		startSlide('next');
	}, 3000);
</script>
</body>
</html>