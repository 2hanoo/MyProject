<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_login").click(function(){//이 안에서만 쓰므로 익명함수
			var v_id = $("#imem_id").val();//test
			var v_pw = $("#imem_pw").val();//123
			var param = "mem_id="+v_id+"&mem_pw="+v_pw;
			$.ajax({
				type:"POST",
				url:"loginAction.jsp", 
				data : param ,
				success:function(data){// = out.print(r_name)
// 					alert("data : "+data);
					$("#d_loginForm").html(data);//html메소드 선택
					
				}
			});
		});
	});
	function logout(){
// 		alert("로그아웃 호출");
		location.href="logout.jsp";
	}

</script>
</head>
<body>
<table border="1" borderColor="green" width="100%" height="100%">
	<tr>
		<td align="left" valign="top">
		<table>
		<tr>
		<td height="50" width="200">
		<div id="d_loginForm">
		<table border="1">
			<tr>
			<td width="130">
				<input type="text" name="mem_id" id="imem_id" size="10" placeholder="id">
			</td>
			<td width="70" rowspan="2" align="center">
				<input type="button" id="btn_login" value="로그인">
			</td>
			</tr>
			<tr>
			<td>
				<input type="text" name="mem_pw" id="imem_pw" size="10" placeholder="pw">
			</td>
			</tr>
	 	</table>
	 	</div>
		</td>
		</tr>
			<tr><td height="25"><a href="index.jsp?menu=main">인트로</a></td></tr>
			<tr><td height="25"><a href="index.jsp?menu=board">게시판</a></td></tr>
			<tr><td height="300">&nbsp;</td></tr>
		</table>
		</td>
	</tr>
</table>

</body>
</html>