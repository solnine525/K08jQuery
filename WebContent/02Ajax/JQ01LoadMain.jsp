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
		1.load()
			: 외부의 문서를 동적으로 로드(포함)할 때 사용한다.
			형식] $(셀렉터).load('파일경로','파라미터');
				파라미터는 JSON을 통해 여러개의 값을 설정할 수 있다.
		
	*/
		var loadCode = function() {
			/*
			JS함수 내부에서 jQuery 코드를 사용할 수 있다.
			*/
			$('#loadView').load('./common/01LoadSub.jsp');
			alert('문서가 로드되었습니다.');
		}
		
		$(function(){
			//외부의 Txt파일을 현재문서로 로드한다.
			$('#loadTxtBtn').click(function(){
				$('#loadTxt').load('./common/01LoadTxt.txt');
				alert('txt문서가 로드되었습니다.');
			});
			
			$('#loadParamBtn').click(function(){
				//체크한 라디오 버튼의 값을 얻어온다.
				var radioVar = 
					$('input[type="radio"][name="params"]:checked').val();
				//파라미터를 JSON으로 생성한다.
				var params = {"params":radioVar};
				//load() 메소드 호출 시 두번째 인자로 파라미터를 전달한다.
				$('#loadParam').load('./common/01LoadParam.jsp', params);
					
			});
		});
	</script>
	<style>
		div{
			width:400px; height:100px;
			border:1px solid black; margin-top:50px;
		}
	</style>
</head>
<body>
<div>
	<h2>$.load() 메소드 사용하기</h2>
	
	<h3>jsp파일 로드하기</h3>	
	<div id="loadView">
		여긴 loadView 입니다.
	</div>
	<button onclick="loadCode();">
		Load()테스트1
	</button>
	
	<h3>txt파일 로드하기</h3>	
	<div id="loadTxt">
		여긴 loadTxt 입니다. 텍스트파일의 내용을
		비동기방식으로 로드합니다.
	</div>
	<button id="loadTxtBtn">
		Load()테스트2
	</button>
	
	<h3>파라미터로 구분해서 로드하기</h3>
	<div id="loadParam">
		파라미터 영역입니다.
	</div>
	<label>
		<input type="radio" name="params" value="good"
			checked />좋은파라미터
	</label>
	<label>
		<input type="radio" name="params" value="bad"
			/>나쁜파라미터
	</label>
	<button id="loadParamBtn">
		Load()테스트3
	</button>
	
	<br /><br /><br /><br /><br /><br /><br />
	<br /><br /><br /><br /><br /><br /><br />
</div>	
</body>

</html>