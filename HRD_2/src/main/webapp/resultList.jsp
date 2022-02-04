<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp" %>
<%
String sql = " SELECT ";
       sql+= " P.p_no, ";
       sql+= " P.p_name, ";
       sql+= " T.t_name, ";
       sql+= " R.t_sdate, ";
       sql+= " if(R.t_status = '1','검사중','검사완료') t_status,";
       sql+= " R.t_ldate, ";
       sql+= " (CASE R.t_result ";
       sql+= " WHEN 'X' THEN '미입력' ";
       sql+= " WHEN 'P' THEN '양성' ";
       sql+= " WHEN 'N' THEN '음성' ";
       sql+= " END) t_result ";
       sql+= " FROM tbl_patient_202004 P,";
       sql+= " tbl_lab_test_202004 T,tbl_result_202004 R ";
       sql+= " WHERE P.p_no = R.p_no and T.t_code = R.t_code ";
       sql+= " ORDER BY p_no ASC";

ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과조회</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<h2>검사결과조회</h2>
<div class="table">
	<table width="700px">
		<tr>
			<th>환자번호</th>
			<th>환자명</th>
			<th>검사명</th>
			<th>검사시작일</th>
			<th>검사상태</th>
			<th>검사완료일</th>
			<th>검사결과</th>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("p_no") %></td>
			<td><%=rs.getString("p_name") %></td>
			<td><%=rs.getString("t_name") %></td>
			<td><%=rs.getString("t_sdate") %></td>
			<td><%=rs.getString("t_status") %></td>
			<td><%=rs.getString("t_ldate") %></td>
			<td><%=rs.getString("t_result") %></td>
		</tr>
		<%} %>
	</table>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>