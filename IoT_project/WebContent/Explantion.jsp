<%@page import="java.util.*, Web_modules.*, DataBase_structure.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="All.css" rel="stylesheet" type="text/css">
<style>
#work {
	width: 300px;
	margin: 0 auto;
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
			document.myform.action = "BuildingList.jsp";
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
<title>부서 소개</title>
</head>

<body>
	<form name='myform' action="db2.jsp" method="post">
		<center>

			<header> <section id="top"> <img src="camlogo.PNG"
				width="100px" height="70px" align="left">
			<h1>군산대학교 시설과 주요업무</h1>
			</section> <nav id="main_menu">
			<ul>
				<li><a href="javascript:goBack();">뒤로 가기</a></li>
			</ul>
			</nav> </header>


			<div id="bottom">
				<br> 안녕하세요 군산대학교 시설관리 페이지입니다.<br> 시설보수팀 번호 : 010-7713-5605<br>
				(우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
			</div>

		</center>
		<div id="work">
			<h1 style="font-size: 35px">시설과 주요업무</h1>
			<li>시설물 신축 및 증축 보수공사</li>
			<br>
			<li>시설예산 편성 및 집행계획 수립</li>
			<br>
			<li>도시계획 및 인허가 업무</li>
			<br>
			<li>시설환경 유지 및 보수 업무</li>
			<br>
			<li>시설물 안전관리에 관한 업무</li>
			<br>
			<li>연구실 안전관리 계획수립 및 추진</li>
			<br>
			<li>조경 및 조경시설 유지관리</li>
			<br>
			<li>상하수도 관리 및 도시가스 관리</li>
			<br>
			<li>냉난방 및 위생시설 유지관리</li>
			<br>
			<li>전기, 소방, 기계설비 유지관리</li>
			<br>
			<li>에너지 관리 업무</li>
			<br>
			<li>학내 석면관리 업무</li>
			<br>
			<li>시설통계 및 대학정보 공시제 업무</li>
		</div>
</body>
</html>
