<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Page</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body>
<center>
<br><br>
<form method="get" action="deleteaction.jsp">
Enter the ID:<input type="number" name="delid" /><br><br>
<%
ResultSet tablenames=null;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection
("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
//NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
Statement fetchtablename=con.createStatement() ;
tablenames=fetchtablename.executeQuery("show tables");
%>
Select Table name:
<select name="tablist">
<%  while(tablenames.next()){ %>
<option><%= tablenames.getString(1)%></option>
<% } %>
</select><br><br>
<%
}
catch(Exception e)
{
out.println(e);
}
%>
<input type="submit" value="Delete" />
<input type="reset" value="Cancel" />
</form><p> </p><br><br><p> </p><br><br>
<form method="get" action="delete.jsp">
Display Table:
<select name="tablelist">
<option>Donor</option>
<option>Receiver</option>
<option>Doctor</option>
<option>Inventory</option>
</select><br><br>
<input type="submit" value="Display" />
<input type="reset" value="Cancel" />
</form>
<%
String tablename = request.getParameter("tablelist");
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection connection = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
    String sql="select * from "+tablename;
    //String getnocol = "SELECT count(*) FROM information_schema.columns WHERE table_name = '"+tablename+"';";
    //Statement loadcol = connection.createStatement();
    //ResultSet getnoc = loadcol.executeQuery(getnocol);
    //int noc = Integer.valueOf(String.valueOf(getnoc));
    Statement loadtable = connection.createStatement();
    ResultSet displaytable = loadtable.executeQuery(sql);
    if(tablename.equals("Donor")){
    	while(displaytable.next())
	    {
	    %>
	    <table>
	   	<tr>
	   	<td><%=displaytable.getString(1) %><td>
	   	<td><%=displaytable.getString(2) %><td>
	   	<td><%=displaytable.getString(3) %><td>
	   	<td><%=displaytable.getString(4) %><td>
	   	<td><%=displaytable.getString(5) %><td>
	   	<td><%=displaytable.getString(6) %><td>
	   	<td><%=displaytable.getString(7) %><td>
	   	<td><%=displaytable.getString(8) %><td>
	   	</tr>
	   	</table>
	   	<%
		}
    }
    if(tablename.equals("Receiver")){
    	while(displaytable.next())
	    {
	    %>
	    <table>
	   	<tr>
	   	<td><%=displaytable.getString(1) %><td>
	   	<td><%=displaytable.getString(2) %><td>
	   	<td><%=displaytable.getString(3) %><td>
	   	<td><%=displaytable.getString(4) %><td>
	   	<td><%=displaytable.getString(5) %><td>
	   	<td><%=displaytable.getString(6) %><td>
	   	<td><%=displaytable.getString(7) %><td>
	   	<td><%=displaytable.getString(8) %><td>
	   	<td><%=displaytable.getString(9) %><td>
	   	<td><%=displaytable.getString(10) %><td>
	   	</tr>
	   	</table>
	   	<%
		}
    }
    if(tablename.equals("Doctor")){
    	while(displaytable.next())
	    {
	    %>
	    <table>
	   	<tr>
	   	<td><%=displaytable.getString(1) %><td>
	   	<td><%=displaytable.getString(2) %><td>
	   	<td><%=displaytable.getString(3) %><td>
	   	<td><%=displaytable.getString(4) %><td>
	   	<td><%=displaytable.getString(5) %><td>
	   	</tr>
	   	</table>
	   	<%
		}
    }
    if(tablename.equals("Inventory")){
    	while(displaytable.next())
	    {
	    %>
	    <table>
	   	<tr>
	   	<td><%=displaytable.getString(1) %><td>
	   	<td><%=displaytable.getString(2) %><td>
	   	<td><%=displaytable.getString(3) %><td>
	   	</tr>
	   	</table>
	   	<%
		}
    }
%>
<%
}
catch(SQLException e)
{
out.println("error in loading data");
out.println(e);
}
%>
<a href="menu.html">Go Back To Menu</a>
</center>
</body>
</html>