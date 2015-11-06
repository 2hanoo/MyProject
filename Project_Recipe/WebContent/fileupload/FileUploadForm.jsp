<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>FileUpload Form 예제 FileUploadForm.jsp</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="./image/icon.png" />
<link rel="apple-touch-icon" href="./image/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
	<script src="./js/html5shiv.js"></script>
<![endif]-->

<script type="text/javascript"
	src="/Project_Recipe/include/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/Project_Recipe/include/js/board.js"></script>
<script type="text/javascript">




	$(function() {
		$("#upload").click(function() {

			if (!chkFile($("#fileName")))
				return;
			else {
				$("#uploadForm").attr({
					"method" : "post",
					"action" : "fileUpload.jsp"
				});
				$("#uploadForm").submit();
			}
		});
		$("#img1").click(function() {
			$("#fileName").click()
		})
		
		


	});
	
</script>

</head>
<body>
	<form name="uploadForm" id="uploadForm" enctype="multipart/form-data">

		<table border="1">
			<tr>
				<td colspan="2" class="tc"><h3>파일 업로드 폼</h3></td>
			</tr>
			<tr>
				<td>파일 :</td>
			<!-- 	<td><img src=./image/sampleimg.jpg id="photo"> -->
				<td><input id="fileName" type="file" name="fileName" style="display: none;">
					 <IMG id="img1" SRC="/Project_Recipe/include/image/upload.png" BORDER=0 width="200" height="200">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="tc">
				<input type="button" value="전송"
					id="upload"> <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>