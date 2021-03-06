<%@page import="java.util.*, Web_modules.*, DataBase_structure.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	Database_Manager2 dbm2 = new Database_Manager2();

	dbm2.connect();

	
	String building_name = request.getParameter("id");
	ArrayList<apply> AList = dbm2.getapplyList(building_name);
	apply dc = dbm2.getapply_s2(building_name);
	dbm2.disconnect();
	
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="All.css" rel="stylesheet" type="text/css">
<style>
table {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 5px;
	text-align: center;
}
</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script location.href="./test?params="
	+encodeURI(params); 
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function check(no) {
		if (no == 1) {
			document.myform.action = "DbJson.jsp";
		} else if (no == 2) {
			document.myform.action = "FileSelect.jsp";
		} else if (no == 3) {
			document.myform.action = "db3.jsp";
		} else if (no == 4) {
			document.myform.action = "db4.jsp";
		} else {
			return;
		}
		document.myform.submit();
	}
</script>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
<title>학내 건물 조회</title>
</head>

<body>
	<form name='myform' action="db2.jsp" method="post">

		<center>
			<header> <section id="top"> <img src="camlogo.PNG"
				width="100px" height="70px" align="left">
			<h1>군산대학교 <%=building_name %> 시설보수 신청 현황</h1>
			</section> <nav id="main_menu">
			<ul>
				<li><a href="javascript:goBack();">뒤로 가기</a></li>
				<li><a href="apply.jsp">시설보수 신청</a></li>
			</ul>
			</nav> </header>

			<div id="bottom">
				<br> 안녕하세요 군산대학교 시설관리 페이지입니다.<br> 시설보수팀 번호 : 010-7713-5605<br>
				(우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
			</div>
		</center>

		<table id="tb1" width="100%" border="1">
			<tr>
				<th>신청자</th>
				<th>시설명</th>
				<th>내용</th>
				<th>날짜</th>
				<th>상세보기</th>
				<th>삭제</th>
			</tr>
			<tbody>
				<% 
					for(int i=0; i<AList.size(); i++) {
						apply ap = AList.get(i); //AList에 담긴 값을 받아옴 
				%>
				<tr>
					<td><%= ap.gethuman_name() %></td>
					<td><%= ap.getbuilding_sub_name() %></td>
					<td><%= ap.getext() %></td>
					<td><%= ap.gettime_s() %></td>
					<td>
					<!-- 상세보기 페이지를 위한 신청자 이름으로 검색 -->
						<button type="button"
							onclick="location.href='Detail.jsp?id=<%=ap.gethuman_name()%>'"
							target="_blank" width=" 600px";>상세보기</button>
					</td>
					<td>
					<!-- 시설보수 신청자 이름으로 테이블 삭제-->
						<button type="button"
							onclick="location.href='delete.jsp?id=<%=ap.gethuman_name()%>'"
							target="_blank" width=" 600px";>삭제</button>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</form>
</body>
</html>
