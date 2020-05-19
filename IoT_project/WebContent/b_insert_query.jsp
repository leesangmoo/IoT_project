<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link href="All.css" rel="stylesheet" type = "text/css">
</head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
  table {
    width:20%;

    border: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #444444;
    padding: 5px;
  }
 
</style>
<style>
	p{width:1700px;height:60px;background:orange;list-style:none;padding-top:15px}
		p{float:center;margin-right:10px}					
	p{font-size:20px;color:black;font-weight:bold;text-decoration:none}	
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">   
        function check(no){
        	if (no == 1){
        	document.myform.action = "DbJson.jsp";
        	}
        	else if (no == 2){
        		document.myform.action = "db2.jsp";
        	}
        	else if (no == 3){
        		document.myform.action = "db3.jsp";
        	}
        	else if (no == 4){
        		document.myform.action = "db4.jsp";
            	}
        	else{
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
 <form name='myform' action="db2.jsp" method="post">
<center>
<header>
		<section id="top">
         <h1>군산대학교 시설관리 페이지</h1>
        </section>
		
		<nav id="main_menu">
         <ul>
            <li><a href="BuildingList.jsp">건물 목록</a></li>
            <li><a href="javascript:goBack();">뒤로 가기</a></li>
         </ul>
        </nav>
</header>

    <div id="bottom"><br>
    안녕하세요 군산대학교 시설관리 페이지입니다.<br>
    시설보수팀 번호 : 010-7713-5605<br>
    (우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
    </div>
	</form>
</body>
</html>

<%
	request.setCharacterEncoding("UTF-8");

	String building_name = request.getParameter("b_name");
	
  	Connection conn=null;
 	PreparedStatement pstmt = null;
 	String str="";

  try{
     
        String jdbcUrl= "jdbc:mysql://localhost:3306/jsptest?useUnicode=true&characterEncoding=utf8";
        String dbId="jspid";
        String dbPass= "jsppass";
 
        Class.forName( "com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        
        String sql = "insert into building_register (building_name) values (?)";
        pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, building_name);
        
        pstmt.executeUpdate();
        
           out.println("----------------------------------->>> 건물 등록 완료");
        
  }catch(Exception e){
           e.printStackTrace();
           out.println("----------------------------------->>> 건물 등록 실패");
  }finally{ //리소스 해제
	  if(pstmt != null)
		  try{
			  pstmt.close();
		  }catch(SQLException sqle){}
  	if(conn != null){
  		try{
  			conn.close();
  		}catch(SQLException sqle){}
  	}
  }

%>