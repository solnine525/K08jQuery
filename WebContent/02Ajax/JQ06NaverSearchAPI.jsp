<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	$(function(){
		$('#searchBtn').click(function(){
			$.ajax({
				//서블릿으로 요청을 전송한다.
				url : "../NaverSearchAPI.do",
				type : "get",
				//파라미터는 검색어, 시작위치를 JSON으로 설정한다.
				data : {
					keyword : $('#keyword').val(),
					startNum : $('#startNum option:selected').val()
				},
				dataType : "json",
				success : sucFuncJson,
				error : errFunc
			});
		});
	});
	//성공시 콜백 메소드
	function sucFuncJson(d){
		console.log("성공",d); //로그로 출력
		var str ="";
		/*
			$.ajax() 메소드는 콜백 데이터의 형식을 지정할 수 있으므로
			만약 json으로 지정하는 경우 JSON.parse() 메소드를 사용할
			필요가 없다.
		*/
		console.log("검색결과", d.total);
		//items의 갯수만큼 반복하여 파싱한다.
		$.each(d.items, function(index, item){
			str+="<ul>";
			str+="	<li>"+item.title+"</li>";
			str+="	<li>"+item.description+"</li>";
			str+="	<li>"+item.bloggername+"</li>";
			str+="	<li>"+item.bloggerlink+"</li>";
			str+="	<li>"+item.postdate+"</li>";
			str+="	<li><a href='"+item.link+"' ";
			str+="		target='_blank'>바로가기</a></li>";
			str+="</ul>";
		});
		//위에서 반복하여 저장한 문자열을 해당 엘리먼트에 출력한다.
		$('#searchResult').html(str);
	}
	
	function errFunc(e){
		alert("실패:"+e.status);
	}
</script>
<style>
	ul{
		border:2px #cccccc solid;
	}
</style>
</head>
<body>
	<div class="container">
	<div class="row">
		<a href="../NaverSearchAPI.do?keyword=가산디지털단지역 맛집">
			네이버검색정보JSON바로가기
		</a>
	</div>
	
	<div class="row">
		<form id="searchFrm">			
			한페이지에 20개씩 노출됨 <br />
			
			<select id="startNum">
				<option value="1">1페이지</option>
				<option value="21">2페이지</option>
				<option value="41">3페이지</option>
				<option value="61">4페이지</option>
				<option value="81">5페이지</option>
			</select>
			
			<input type="text" id="keyword" value="검색어" />
			<button type="button" class="btn btn-info"
				id="searchBtn">
				Naver검색API요청하기
			</button>		
		</form>	
	</div>
	
	<div class="row" id="searchResult">
		요기에 정보가 노출됩니다
	</div>	
	
</div>
	
</body>
</html>