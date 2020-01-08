<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete JSP</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body>
<center>
<%
String id = request.getParameter("delid");
String tablename = request.getParameter("tablist");
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection connect = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
  //NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
    String Query="delete from "+tablename+" where id="+id;
	PreparedStatement psm=connect.prepareStatement(Query);
	psm.executeUpdate();
	out.println("");
	response.sendRedirect("delete.jsp");
%>
<%
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</center>
</body>
</html>