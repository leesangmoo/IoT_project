<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="All.css" rel="stylesheet" type = "text/css">
</head>
<style>
  table {
    width:20%;
	margin-left:auto;
    margin-right:auto;
    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 15px;
  }
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function check(no) {
		if (myform.b_name.value == "") {
			alert("값을 입력해 주세요");

			myform.b_name.focus();
			return false;
		}
		if (no == 1) {
			document.myform.action = "b_insert_query.jsp";
		} else if (no == 2) {
			document.myform.action = "test2.jsp";
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
        function goBack(){
        window.history.back();
        	}
    </script>
</head>

<body>
	<form name='myform' action="DbSelect.jsp" method="post">
	
		<center>
			<header>
		<section id="top">
		<img src="camlogo.PNG" width="100px" height="70px" align="left">
         <h1>군산대학교 건물 등록 페이지</h1>
        </section>
		
		<nav id="main_menu">
         <ul>
            <li><a href="javascript:goBack();">뒤로 가기</a></li>
         </ul>
        </nav>
</header>

 <div id="bottom"><br>
    안녕하세요 군산대학교 시설관리 페이지입니다.<br>
    시설보수팀 번호 : 010-7713-5605<br>
    (우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
 </div>
			</center>
	<br><br>
		<table id="example" border="3px" style="margin-left: auto; margin-right: auto;">

			<tr>
			<tr>
				<th> 건물명 </th>
				<td><input type="text" name="b_name" placeholder="입력" style="width:300px;height:30px;" /></td>
			</tr>
			<tr>
				<th>등록</th>
				<td><button type="button" onclick="check(1)"style="width:304px;height:30px;">등록</button></td>
			</tr>

			</tr>
		</table><br><br>
		
		
	</form>
</body>
</html>
