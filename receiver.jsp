<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Receiver</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body>
<center>
<br><br><br><br>
<form method="post" action="receiveraction.jsp">
Name:<input type="text" name="receivername" /><br><br>
Gender:<input type="text" name="receivergender" /><br><br>
Address:<input type="text" name="receiveraddress" /><br><br>
Date:<input type="date" name="receiverdate" /><br><br>
Contact:<input type="number" name="receivercontact" /><br><br>
Blood Group:
<select name="receiverbg">
<option>A+</option>
<option>A-</option>
<option>B+</option>
<option>B-</option>
</select><br><br>
<%
ResultSet doctornames=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection
("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
//NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
Statement fetchdoctorname=con.createStatement() ;
doctornames=fetchdoctorname.executeQuery("select doctorname from doctor");
%>
Select Doctor name:
<select name="doclist">
<%  while(doctornames.next()){ %>
<option><%= doctornames.getString(1)%></option>
<% } %>
</select><br><br>
<%
}
catch(Exception e)
{
out.println(e);
}
%>
<%
ResultSet donorids=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection
("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
Statement fetchdonorid=con.createStatement() ;
donorids=fetchdonorid.executeQuery("select id from donor");
%>
Select Donor id:
<select name="donlist">
<%  while(donorids.next()){ %>
<option><%= donorids.getString(1)%></option>
<% } %>
</select><br><br>
<%
}
catch(Exception e)
{
out.println(e);
}
%>
<input type="submit" value="Submit" />
<input type="reset" value="Cancel" />
</form><br><br>
<a href="menu.html">Go Back To Menu</a>
</center>
</body>
</html>