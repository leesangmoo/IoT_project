<%@page import="java.util.*, Web_modules.*, DataBase_structure.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	text-align : center;
}
</style>
<style>
p {
	width: 100%;
	height: 60px;
	background: #87CEEB;
	list-style: none;
	padding-top: 15px
}

p {
	float: center;
	margin-right: 10px;
}

p {
	font-size: 20px;
	color: black;
	font-weight: bold;
	text-decoration: none;
}
#header {
	margin-left: 3px;
    position:absolute;
    width:99%;
    top : 0;
}
#bottom {
	
    position:absolute;

    bottom:0;

    width:2118px;

    height:100px;   

    background:#ccc;

}
header #main_menu {
      height: 38px;
      margin-top: 15px;
      background-color: #4e4c4d;
   }
   header #main_menu ul {
      padding-top: 9px;
      text-align: center;
   }
   header #main_menu li {
      display: inline;
      margin: 40px;
   }
   header #main_menu a:link {
      color:#ffffff;
   }
    header #main_menu a:visited {
      color:#ffffff;
   }
    header #main_menu a:active {
      color:#ffffff;
   }
</style>
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
<title>학내 건물 조회</title>
</head>

<body>
	<form name='myform' action="db2.jsp" method="post">
		<center>	

<header>
		<section id="top">
         <h1>군산대학교 시설관리 페이지</h1>
        </section>
		
		<nav id="main_menu">
         <ul>
            <li><a href="BuildingList.jsp">건물 목록</a></li>
            <li><a href="Explantion.jsp">부서 소개</a></li>
         </ul>
        </nav>
</header>
		
		<div id = "img_tag">
			 <img src="camlogo2.PNG" alt="이미지   없음"; width = "1057px"; height = "868px"; style="float:left"; margin-right = "50px";/>
			 <img src="camlogo4.PNG" alt="이미지   없음"; width = "1040px"; height = "868px"; style="float:right"; margin-right = "50px";/>	
	 	</div>

    <div id="bottom"><br>
    안녕하세요 군산대학교 시설관리 페이지입니다.<br>
    시설보수팀 번호 : 010-7713-5605<br>
    (우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
    </div>

		</center>
	
	
</body>
</html>
