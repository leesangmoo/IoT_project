<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="error_view.jsp"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.io.*, java.util.*"%>
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<link href="All.css" rel="stylesheet" type="text/css">
</head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
table {
	width: 20%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	padding: 5px;
}
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
        window.location.replace("BuildingList.jsp");
    </script>
</head>

<body>
	<form name='myform' action="db2.jsp" method="post">
		<center>
			<header>
				<section id="top">
					<img src="camlogo.PNG" width="100px" height="70px" align="left">
					<h1>군산대학교 시설관리 페이지</h1>
				</section>

				<nav id="main_menu">
					<ul>
						<li><a href="BuildingList.jsp">건물 목록</a></li>
						<li><a href="javascript:goBack();">뒤로 가기</a></li>
					</ul>
				</nav>
			</header>

			<div id="bottom">
				<br> 안녕하세요 군산대학교 시설관리 페이지입니다.<br> 시설보수팀 번호 : 010-7713-5605<br>
				(우)54150, 전라북도 군산시 대학로 558(미룡동) / TEL.063) 469-4113~4
			</div>
	</form>
</body>
</html>

<%

	request.setCharacterEncoding("UTF-8");
   
	FileInputStream fis = null;
	
	String path = request.getRealPath("‪C:/Users/Dsem/Desktop/IoT_project_workspace/IoT_project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/IoT_project"); //업로드 위치
	int maxSize = 1024 * 1024 * 5;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy(); 
	
	Timestamp time_s = new Timestamp(System.currentTimeMillis());
	
	MultipartRequest multi = null;
	
  	Connection conn=null;
 	PreparedStatement pstmt = null;
 	String str="";

  try{
	  String path2 = "C:/Users/Dsem/Desktop/IoT_project_workspace/IoT_project/IoT_project/WebContent/save";
	  multi = new MultipartRequest(request,path2,maxSize,enc,dp);
	  String human_name = multi.getParameter("text_Human");
	  String buildingName = multi.getParameter("building_name");
	  String building_sub_name = multi.getParameter("sub_name");
	  String text = multi.getParameter("allText");
	  String sysName = multi.getFilesystemName("save");
	  String orgName = multi.getOriginalFileName("save");
	  String type = multi.getContentType("save");
	  type = type.split("/")[0];
	  
	  if(!type.equals("image"))
	  {
		  File f = multi.getFile("save");
		  f.delete();
		  out.println("파일 확장자 타입이 맞지 않습니다.");
	  }
	  
	  
	  	String jdbcUrl= "jdbc:mysql://localhost:3306/jsptest?useUnicode=true&characterEncoding=utf8";
        String dbId="jspid";
        String dbPass= "jsppass";
 
        Class.forName( "com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        String sql = "insert into apply_table(human_name,time_s,building_name,building_sub_name,text,sysName,orgName) values (?,?,?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        
        
        pstmt.setString(1, human_name);
        pstmt.setTimestamp(2, time_s);
        pstmt.setString(3, buildingName);
        pstmt.setString(4, building_sub_name);
        pstmt.setString(5, text);
        pstmt.setString(6, sysName);
        pstmt.setString(7, orgName);
        pstmt.executeUpdate();
        
           out.println("----------------------------------->>> 시설보수 신청 완료");
        
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