<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(session.getAttribute("loginMemberEmail")!=null)
%>
<div>

	<form method="post" action="<%=request.getContextPath() %>/member/loginAction.jsp">
		<table class="table">
			<tr>
				<td>member_emmail</td>
				<td><input type="text" name= "member_email"></td>
			</tr>
			<tr>
				<td>member_pw</td>
				<td><input type="text" name= "member_pw"></td>
			<tr>
				<td>관리자</td>
				<td></td>
			</tr>
		
		
		</table>
</div>
</body>
</html>