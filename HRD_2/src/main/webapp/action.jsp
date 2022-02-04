<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_connect.jsp" %>
<%
String p_no = request.getParameter("p_no");
String t_code = request.getParameter("t_code");
String t_sdate = request.getParameter("t_sdate");
String t_status = request.getParameter("t_status");
String t_ldate = request.getParameter("t_ldate");
String t_result = request.getParameter("t_result");

//유효성체크
String check[] = {p_no,t_code,t_sdate,t_status,t_ldate,t_result};
for(int i=0; i<check.length; i++){
	if(check[i] == "" || check[i] == null){ //에러나는 상황
		%>
		<script>
		alert("검사결과 입력을 확인해주세요!");
		history.back();
		</script>
		<%
		return;
	}
}
//데이터 넣기
String sql = " INSERT INTO tbl_result_202004 VALUES (";
       sql+= " '"+p_no+"', ";
       sql+= " '"+t_code+"', ";
       sql+= " '"+t_sdate+"', ";
       sql+= " '"+t_status+"', ";
       sql+= " '"+t_ldate+"', ";
       sql+= " '"+t_result+"' ) ";

int result = stmt.executeUpdate(sql);

if(result == 1){
%>
	<script>
	alert("검사결과가 정상적으로 등록 되었습니다!");
	location="index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("검사결과 등록에 실패하였습니다!");
	location="index.jsp";
	</script>
<%
}
%>