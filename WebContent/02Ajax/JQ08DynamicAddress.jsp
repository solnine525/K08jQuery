<%@page import="java.util.ArrayList"%>
<%@page import="controller.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//DB 연결
ZipcodeDAO dao = new ZipcodeDAO();
// 시/도를 가져오기 위해 쿼리 실행
ArrayList<String> sidoList = dao.getSido();
// JSTL을 사용하기 위해 page 영역에 저장한다.
pageContext.setAttribute("sidoList", sidoList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 시/도를 선택했을 때 change 이벤트가 발생됨.
		$('#sido').change(function(){
			$.ajax({
				url : "./common/08GugunOption.jsp",
				type : "get",
				contentType : "text/html;charset:utf-8;",
				data : { // 선택한 시/도를 파라미터로 전달한다.
					sido : $('#sido option:selected').val()
				},
				dataType : "json",
				success : function(d) {
					console.log("콜백데이터", d);
					
					var optionStr ="";
					optionStr +="<option value=''>";
					optionStr += "-구군을 선택하세요-";
					optionStr += "</option>";
					/*
					콜백데이터는 JSON배열로 전달될 것이므로
					항목의 갯수만큼 반복하여 <option>태그를 생성한다.
					*/
					$.each(d, function(index, data){
						optionStr += '<option value="'+data+'">';
						optionStr += data;
						optionStr += '</option>';
					});
					// 구/군에 해당하는 <select> 태그에 삽입한다.
					$('#gugun').html(optionStr);
				},
				
				error:function(e){
					alert("오류발생:"+e.status+":"+e.statusText);
				}
			});
		});
	});
	
</script>
</head>
<body>
	<div class="container">
	<div class="row">
		<h2>우편번호DB를 이용한 시도/구군 동적셀렉트 구현</h2>
	</div>
	<form id="zipFrm">
	<div class="row">		
		<div class="col-4">
			시/도: <!-- 페이지 로드시 시/도는 즉시 삽입됨 -->
			<select id="sido" class="form-control">
				<option value="">-시/도선택하삼-</option>
				<!-- page영역에 저장된 데이터를 forEach문으로 반복 출력 -->
				<c:forEach items="${sidoList }" var="sidoStr">
					<option value="${sidoStr }">${sidoStr }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-8">
			구/군: <!-- 시/도를 선택했을 때 쿼리문을 통해 구/군을 가져와서 삽입함. -->
			<select id="gugun" class="form-control">
				<option value="">-구/군선택하삼-</option>
			</select>
		</div>		
	</div>
	</form>
</div>
	
</body>
</html>