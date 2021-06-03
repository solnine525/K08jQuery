<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#btnLogin2').click(function(){
			//요청할 서버의 URL
			var s_url = "./common/03PostLoginOracle.jsp";
			/*
				<form> 태그의 하위 태그들을 name 속성을 통해 JSON으로
				조립해준다. 전송할 폼값이 많을 경우 주로 사용한다.
			*/
			var s_params = $('#loginFrm').serialize();
			//Post 방식으로 서버에 요청한다.
			$.post(
				s_url,
				s_params,
				function(resData){
					//콜백데이터를 파싱한다.
					var d = JSON.parse(resData);
					//result를 통해 로그인 성공/실패를 판단한다.
					if(d.result==1){
						alert(d.message);
						//JSP에서 만든 HTML을 그대로 출력만 한다.
						$('#loginFrm').html(d.html);
						//로그인 버튼 숨김 처리
						$('#btnLogin2').hide();
					}
					else{
						alert(d.message);
					}					
					//콜백데이터를 화면 상에 출력(디버깅용)
					$('#jsonDisplay').text(resData);
				}
			);
		});
	});
	
	function checkFrm(){
		var f = document.getElementById("loginFrm");
		f.method = "post";
		f.action = "./common/03PostLoginOracle.jsp";
	}
</script>

</head>
<body>
<div class="container">
	<h2>$.post() 메소드 사용하기</h2>	
	<h3>로그인 구현하기 - JDBC연동</h3>
	<div class="row" id="loginTable">
		<form id="loginFrm" onsubmit="return checkFrm();">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="user_id" value="kosmo" />
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" name="user_pw" value="1234" />
					</td>
				</tr>
			</table>
			<button type="submit" class="btn btn-danger" 
				id="btnLogin1">
				로그인하기(HTML의submit사용)</button>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-success" 
				id="btnLogin2">
				로그인하기(jQuery의 $.post()사용)</button>
		</form>
	</div>
	<br/>
	<div class="row" id="jsonDisplay">
		JSON 데이터를 뿌려봅시다
	</div>
</div>	
</body>
</html>