<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp" %>
<%
String sql = " SELECT ";
       sql+= " P.p_city, ";
       sql+= " (CASE P.p_city ";
       sql+= " WHEN '10' THEN '서울' ";
       sql+= " WHEN '20' THEN '경기' ";
       sql+= " WHEN '30' THEN '강원' ";
       sql+= " WHEN '40' THEN '대구' ";
       sql+= " END)p_code, ";
       sql+= " COUNT(*)cnt ";
       sql+= " FROM tbl_patient_202004 P,tbl_result_202004 R ";
       sql+= " WHERE P.p_no = R.p_no ";
       sql+= " GROUP BY P.p_city ";

ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>∙ 검사건수통계 ∙</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<h2>(지역별)검사건수통계</h2>
<div class="table">
	<table width="400px">
		<tr>
			<th>지역코드</th>
			<th>지역별</th>
			<th>검사건수</th>
		</tr>
		<% while(rs.next()){%>
		<tr>
			<td><%=rs.getString("p_city") %></td>
			<td><%=rs.getString("p_code") %></td>
			<td><%=rs.getString("cnt") %></td>	
		</tr>
		<%} %>
	
	</table>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>