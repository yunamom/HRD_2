<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="db_connect.jsp" %>
<%

String sql = " SELECT ";
       sql+= " p_no, ";
       sql+= " p_name, ";
       sql+= " Concat(substr(p_birth,1,4),'년',";
       sql+= " substr(p_birth,5,6),'월',";
       sql+= " substr(p_birth,7,8),'일')p_birth, ";
       sql+= " if(p_gender='F','여','남')p_gender, ";
       sql+= " CONCAT(p_tel1,'-',p_tel2,'-',p_tel3)p_tel, ";
       sql+= " if(p_city=10,'서울',if('20','경기',if('30','강원','대구'))) p_city ";
       sql+= " FROM tbl_patient_202004";
ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>patientList</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<h2>환자조회</h2>
<div class="table">
	<table width="600px">
		<tr>
			<th>환자번호</th>
			<th>환자성명</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>지역</th>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("p_no") %></td>
			<td><%=rs.getString("p_name") %></td>
			<td><%=rs.getString("p_birth") %></td>
			<td><%=rs.getString("p_gender") %></td>
			<td><%=rs.getString("p_tel") %></td>
			<td><%=rs.getString("p_city") %></td>
		</tr>
		<%} %>
	</table>

</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>