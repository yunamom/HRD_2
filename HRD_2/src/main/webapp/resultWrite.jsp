<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과입력</title>
<link rel="stylesheet" href="style.css">
<style>
td{
	text-align:left;
}
</style>
</head>
<script>
	function fn_submit(){
		var f = document.frm
		var check = [f.p_no,f.t_code,f.t_sdate,f.t_status,f.t_ldate,f.t_result];
		var echo = ["환자번호가 입력되지 않았습니다!",
			"검사코드가 선택되지 않았습니다!",
			"검사시작일자가 입력되지 않았습니다!",
			"검사상태가 선택되지 않았습니다!",
			"검사완료일자가 입력되지 않았습니다!",
			"검사결과가 선택되지 않았습니다!"];
		var reg_no = /^[0-9]{4}$/; //4자리 숫자만 입력할수있는 정규식
		var reg_date = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
		//날짜 입력 정규식
		for(var i=0; i<check.length; i++){
			if(check[i].value == ""){
				alert(echo[i]);
				return false;
			}
			if(!reg_no.test(check[0].value)){
				alert("환자번호를 확인해주세요.");
				return false;
			}
			if(i==2 && !reg_date.test(check[i].value)){
				alert("시작일자를 확인해주세요.");
				return false;
			}
			if(i==4 && !reg_date.test(check[i].value)){
				alert("완료일자를 확인해주세요.");
				return false;
			}
		}
		f.submit();
	}
	function fn_onload(){
		document.frm.p_no.focus();
		document.frm.onload();
	}

</script>
<body onload="fn_onload()">
<%@ include file="topmenu.jsp" %>
<section>
<h2>∙ 검사결과입력 ∙</h2>
<div class="table">
<form name="frm" method="post" action="action.jsp">
	<table width="500px">
		<tr>
			<th>환자번호</th>
			<td>
			<input type="text" name="p_no"> 예)1001
			</td>
		</tr>
		<tr>
			<th>검사코드</th>
			<td>
			<select name="t_code">
				<option value="">검사명</option>
				<option value="T001">[T001]결핵</option>
				<option value="T002">[T002]장티푸스</option>
				<option value="T003">[T003]수두</option>
				<option value="T004">[T004]홍역</option>				
				<option value="T005">[T005]콜레라</option>				
			</select>
			</td>
		</tr>
		<tr>
			<th>검사시작일자</th>
			<td>
			<input type="text" name="t_sdate"> 예)20200101
			</td>
		</tr>
		<tr>
			<th>검사상태</th>
			<td>
			<input type="radio" name="t_status" value="1">검사중
			<input type="radio" name="t_status" value="2">검사완료
			</td>
		</tr>
		<tr>
			<th>검사완료일자</th>
			<td>
			<input type="text" name="t_ldate"> 예)20200101
			</td>
		</tr>
		<tr>
			<th>검사결과</th>
			<td>
			<input type="radio" name="t_result" value="X">미입력
			<input type="radio" name="t_result" value="P">양성
			<input type="radio" name="t_result" value="N">음성
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<button type="submit" onclick="fn_submit();return false;">검사결과등록</button>
			<button type="button" onclick="fn_reset()">다시쓰기</button>
			</td>	
		</tr>
	</table>
</form>
</div>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>