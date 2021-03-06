<%@page import="java.util.*, Web_modules.*, DataBase_structure.*"%>
<!-- DB 값을 가져오기 위한 java 패키지 import -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	//데이터베이스 연동을 위한 객체 생성
	DataBase_Manager dbm = new DataBase_Manager();
	//db 연결
	dbm.connect();
	//db 테이블의 내용을 ArrayList로 저정함
	ArrayList<Building> BList = dbm.getBuildingList();
	//연결 끊음
	dbm.disconnect();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 외부 css 파일-->
<link href="All.css" rel="stylesheet" type="text/css">
<style>
table { /*테이블 크기와 위치 설정*/
	width: 80%;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td { /* th , td 의 크기와 글자 위치 설정*/
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
			<h1>군산대학교 건물 목록</h1>
			</section> <nav id="main_menu">
			<ul>
				<li><a href="javascript:goBack();">뒤로 가기</a></li>
				<li><a href="InsertBuilding.jsp">건물 등록</a></li>
			</ul>
			</nav> </header>

			<div id="bottom">
				<br> 안녕하세요 군산대학교 시설관리 페이지입니다.<br> 시설보수팀 번호 : 010-7713-5605<br>
				(우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
			</div>
		</center>

		<table id="tb1" width="100%" border="1">
			<tr>
				<th>건물명</th>
				<th>시설보수 신청 현황</th>
			</tr>
				<%
					for(int i=0; i<BList.size(); i++) {//DB 테이블 값 사이즈 만큼 반복
						Building bd = BList.get(i); // DB 값을 불러와 저장함
				%>
				<tr>
					<td><%= bd.getId() %></td> <!--db 값 <td> 에 넣음 -->
					
					<td>
					<!--GET 방식으로 status.jsp 페이지에 id 값을 넘겨서 이동함-->
						<button type="button"
							onclick="location.href='Status.jsp?id=<%=bd.getId()%>'">
							시설보수신청 현황</button>
					</td>
				</tr>

				<%
					}
				%>

		</table>
	</form>
</body>
</html>
