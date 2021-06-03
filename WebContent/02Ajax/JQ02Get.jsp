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
	jQuery에서 제공하는 Ajax관련 메소드
	2. $.get()
		: HTTP get방식을 통해 서버로부터 데이터를 받을 때
		사용하는 메소드
		형식] $.get(url, param, callback);
		-url : 정보를 요청할 경로 및 파일명
		-param : 서버로 전송할 파라미터. JSON형태로 기술 
		-callback : 요청이 성공했을 때 실행되는 콜백(Callback)
			메소드. 콜백메소드가 호출될 떄 전달되는 파라미터를 통해
			성공 혹은 실패여부를 판단할 수 있다.
	※서버로 요청시 파라미터가 없는 경우 생략가능함.
	*/
		$(function(){
			$('#btnXml').click(function(){
				$.get('./common/02NameCard.xml', //요청 URL
					//파라미터는 없으므로 생략가능함.
					function(data){ //콜백 메소드
						//요청성공시 xml파일의 모든 내용을 파라미터를 통해 전달해준다.
						console.log(data)
						
						//콜백해준 내용을 대상으로 파싱(Parsing)을 진행한다.
						
						/*
							find()를 통해 xml파일의 엘리먼트를 찾는다.
							attr()을 통해 엘리먼트의 속성에 접근한다.
							text()를 통해 태그사이의 값에 접근한다.
						*/
;						$(data).find("명함").each(function(){
							var html="<div>이름:"+
								$(this).find("성명").attr("이름") +"<div>";
							
							html += "<div>주소:"+
								$(this).find("주소").text() +"<div>";
							html += "<div>직위:"+
								$(this).find("직위").text() +"<div>";
							html += "<div>이메일:"+
								$(this).find("e-mail").text() +"<div>";
							html += "<div>핸드폰:"+
								$(this).find("Mobile").text() +"<div>";
							html += "<div>전화번호:"+
								$(this).find("TEL").text() +"<div>";
							html += "<div>카피라이트:"+
								$(this).find("copyright").text() +"<div>";
							//파싱된 내용을 저장한 문자열을 html()메소드를 통해 출력한다.
							$('#xmlDisplay').html(html);	
						});	
					}
				);
			});
			/*
			서버로 요청시 파라미터가 있는 경우에는 2번째 인자에
			JSON형태로 조립해서 기술한다.
			*/
			$('#btnJSP').click(function(){
				$.get('./common/02PrintToday.jsp' //요청 URL
					, {
						'msg' : $(this).text(), //버튼 사이의 텍스트를 읽어와서 사용.
						'varStr' : 'jQuery좋아요'
					},//파라미터
					function(data){
						alert(data);
						$('#jspDisplay').html(data);
					}//콜백메소드
				);
			});
		});	
		function locationGo(link){
			window.open(link, '', 'width=500, height=500');
		}
		
	</script>
</head>
<body>
<div>	
	<h2>$.get() 메소드 사용하기</h2>
	
	<h3>xml파일 읽어오기</h3>
	<button onclick="locationGo('./common/02NameCard.xml');">
		NameCard.xml바로가기
	</button>
	
	<button id="btnXml">
		XML데이터 읽어오기
	</button>
	
	<div class="displayDiv" id="xmlDisplay">
		XML데이터 정보를 디스플레이합니다.
	</div>
	
	
	<h3>jsp파일에서 읽어오기</h3>
	<button onclick="locationGo('common/02PrintToday.jsp?msg=안녕하세요&varStr=jQuery조아효');">
		PrintToday.jsp바로가기
	</button>
	<button id="btnJSP">
		JSP결과 읽어오기
	</button>
	<div class="disDisplay" id="jspDisplay">
		JSP결과를 디스플레이 합니다.
	</div>	
</div>
</body>

</html>