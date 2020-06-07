<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, Web_modules.*, DataBase_structure.*" %>
	<%@page import="java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
    
<!-- jQuery  -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
    
<%
	String human_name2 = (String)request.getParameter("id");
    
	Database_Manager2 dbm2 = new Database_Manager2();
	dbm2.connect();
	apply dc = dbm2.getapply_s(human_name2);
	dbm2.disconnect();
	//String path2 = "C:/Users/Dsem/Desktop/IoT_project_workspace/IoT_project/IoT_project/WebContent/save";
	
%>
    
<html>
<head>
<link href="All.css" rel="stylesheet" type = "text/css">
</head>

<style>
.no-border { 
border:0px; background:#ffffff; 
}
</style>
<style>
table {
	width: 25%;
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

<script type="text/javascript">   
        function goBack(){
        window.history.back();
        	}
    </script>
<title>Insert title here</title>
</head>


<body>
<form name='myform6' action="ReviseFile.jsp" method="POST" enctype="multipart/form-data">
	<center>
	<header>
		<section id="top">
		<img src="camlogo.PNG" width="100px" height="70px" align="left">
         <h1>군산대학교 시설보수 신청 상세보기</h1>
        </section>
		
		<nav id="main_menu">
         <ul>
           <li><a href="javascript:goBack();">뒤로 가기</a></li>
            <li><a href="apply.jsp">시설보수 신청</a></li>
         </ul>
        </nav>
</header>

 <div id="bottom"><br>
    안녕하세요 군산대학교 시설관리 페이지입니다.<br>
    시설보수팀 번호 : 010-7713-5605<br>
    (우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
 </div>
	
	<h1>상세보기</h1>
	<table name="tb1" id="tb1" width="100%" border="1">
			<tr>
				<th>신청자</th>
				<td> 
				<input type="text" class="no-border" id="human_name" name="human_name" value="<%= dc.gethuman_name() %>" style = "text-align : center;"></td>
			</tr>
			<tr>
				<th>날짜</th>
				<td><input type="text" class="no-border" id="time_s" name="time_s" value="<%= dc.gettime_s() %>" style = "text-align : center;"></td>
			</tr>
			<tr>
				<th>시설명</th>
				<td><input type="text" class="no-border" id="building_sub_name" name="building_sub_name" value="<%= dc.getbuilding_sub_name() %>" style = "text-align : center;"></td>
			</tr>
			<tr>
				<th>신청내용</th>
				<td><input type="text" class="no-border" id="text" name="text" value="<%= dc.getext() %>" style = "text-align : center; width:300px; height:100px;"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><img src="./save/<%= dc.getsysname() %>" style = "text-align : center; width:300px; height:300px;" ></td>
			</tr>
			
	</table>
</center>	

			</form>
		</body>
	</html>