<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>00UnderstandAjax.jsp</title>
</head>
<body>
	<h2>Ajax 동작방식 이해하기</h2>
	<script>
		function formSubmit(f){
			f.method = "post";
			f.target = "hiddenFrame"
			f.action = "./common/00Callback.jsp"
			f.submit();
		}
	</script>
	<div id ="callBackData">
		콜백된 데이터는 여기에 출력합니다.
	</div>
	<form onsubmit="return formSubmit(this);">
		<input type="submit" value="폼값 전송하기" />
	</form>
	<iframe name="hiddenFrame" style="display:; width:300px; height:300px;"></iframe>
</body>
</html>