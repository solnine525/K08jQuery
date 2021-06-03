<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//옵션 select를 선택했을 때 change 이벤트 발생
		$('#goodsOptionId1').change(function(){
			$.ajax({
				url : "./common/07GoodsSelect1.jsp",
				type : "get",
				data : {
					//select에서 선택한 항목을 파라미터로 전달
					goodsOptionName : $("#goodsOptionId1").val()
				},
				dataType : "html", //콜백 데이터의 타입
				contentType : "text/html;charset:utf-8",
				success : function(d){
					//hidden으로 새ㅇ성된 기본자격을 가져와서 숫자로 변경함.
					var totalPrice =parseInt($('#totalPrice').val());
					//선택한 옵션의 value를 가져옴.
					var goodsOption = $('#goodsOptionId1').val();
					//옵션에 따라 금액을 판단하여 합산.
					if(goodsOption=='op01') totalPrice += 5000;
					else if(goodsOption=='op02') totalPrice += 7000;
					else if(goodsOption=='op03') totalPrice += 10000;
					//게산된 금액을 hidden 박스에 입력하고 
					$('#totalPrice').val(totalPrice);
					//화면에 출력한다.
					$('#priceDisplay').html("총상품금액:"+totalPrice);
					//옵션을 처음 선택했다면 기존 문자열을 지우고 옵션을 추가한다.
					if($('#goodsList').html()=="여기에 선택한 옵션이 리스팅됨"){
						$('#goodsList').empty();
					}
					//옵션상품을 추가한다.
					$('#goodsList').append(d);
				},
				error : function(e){
					alert("실패"+e.status);
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
	<div class="row">
		<h2>장바구니 구현하기</h2>
	</div>
	<div class="row">
		<div class="col-md-6">
			<!-- 상품이미지 -->
			<img src="../images/amazon.png" 
				class="img-thumbnail" />
		</div>
		<div class="col-md-6">
			<!-- 상품가격과 옵션 -->
			<form id="goodsFrm">
			
			<!-- 상품가격+옵션가격 -->
			<input type="hid-den" id="totalPrice" 
				value="70000" 
				style="background-color:#bbbbbb;
					color:red;"/>				
			
			<table class="table table-bordered">
			<colgroup>
				<col width="30%"/>
				<col width="*"/>
			</colgroup>
			<tr>
				<td>상품명</td>
				<td>3 in 1 Type-C HDMI 케이블</td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><del>100,000원</del> -> 70,000원</td>
			</tr>
			<tr>
				<td>옵션선택</td>
				<td>
					<select id="goodsOptionId1">
						<option value="">선택하삼</option>
						<option value="op01">옵션1(+5000)</option>
						<option value="op02">옵션2(+7000)</option>
						<option value="op03">옵션3(+10,000)</option>
					</select>
				</td>
			</tr>			
			</table>
			</form>			
			<div class="row" id="goodsList">여기에 선택한 옵션이 리스팅됨</div>			
			<div class="row" id="priceDisplay" 
				style="font-size:1.5em; color:red;">
				총상품금액 : 70,000원
			</div>
		</div>
	</div>	
</div>
	
</body>
</html>