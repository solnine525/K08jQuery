<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
/*
	$.ajax()
		: jQuery에서 사용되는 AJAX관련 메소드로 load(), get(), post()
		메소드의 모든 기능을 가지고 있다. 그러므로 가장 활용빈도가 높다.
		별도의 인자가 존재하지 않고, JSON형태의 인자 하나만 존재한다.
	인자의 속성
		url : 요청할 서버의 경로
		type : 요청시 사용할 전송방식. get, post
		dataType : 콜백 데이터의 형식. json, xml, script. text, html 등
		success : 요청에 성공했을 때 콜백 메소드
		error : 요청에 실패했을 때 콜백 메소드
		contentType : 전송시 사용할 컨텐츠 타입(get과 post가 다름)
		data : 서버로 전송할 파라미터. JSON형식
 */
	$(function(){
		/*
		해당 메소드는 문서의 로드가 끝난 직후 js파일을 현재 문서에 로드한다.
		즉, load() 메소드와 동일한 역할로 사용된다.
		*/
		$.ajax({
			url : './common/04JsData.js',
			type : 'get',
			dataType : "script", //콜백 데이터의 형식은 JS로 지정
			//요청 성공시 콜백 메소드 : 무기명 함수 형태로 정의함
			success : function(resData){
				MyAlert("Hello"," AJAX");
			},
			//요청 실패시 콜백 메소드 : 외부함수 형태로 정의함.
			error : errFunc //작성시 함수명만 기술해야 한다.  errFunc() <= X
		});
		
		$('#ajaxBtn').click(function(){
			$.ajax({
				//요청할 서버의 URL
				url : "./common/02PrintToday.jsp",
				//콜백데이터 형식
				dataType : "html",
				//요청시 전송방식
				type : "get",
				//get방식일 때의 컨텐츠 타입
				contentType : "text/html;charset:utf-8",
				//파라미터 
				data : {
					msg : $(this).text(),
					varStr : "$.ajax() 메소드 열라 짱 조아효"
				},
				//성공, 실패시의 콜백 메소드. 함수명만 기술해야 한다. 
				success : sucFunc,
				error : errFunc
			});
		});
	});
	
	/*
	요청에 실패할 경우 호출되는 콜백메소드 정의.
	반드시 jQuery 영역이 아닌 JS영역에 순수 함수로 정의해야 한다.
	*/
	function errFunc(){
		alert("에러발생. 디버깅하세요.");
	}
	/*
	요청성공시 호출한 콜백메소드로 jQuery 외부에 정의한다.
	함수명만으로 지정하더라도 콜백 데이터는 파라미터로 전달
	받을 수 있다.
	*/
	function sucFunc(resData){
		alert("$.ajax()메소드 요청성공");
		$('#ajaxDisplay').html(resData);
	}
</script>
</head>
<body>
	<h2>$.ajax() 메소드 사용하기</h2>
	
	<button id="ajaxBtn">ajax()메소드실행하기</button>
	
	<div id="ajaxDisplay">
		ajax결과를 여기에 디스플레이
	</div>
</body>

</html>