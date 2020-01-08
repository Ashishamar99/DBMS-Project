<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor JSP</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body>
<center>
<%
//int docid = 3000;
String docname = request.getParameter("doctorname");
String docaddr = request.getParameter("doctoraddress");
String doccontact = request.getParameter("doctorcontact");
String docbg = request.getParameter("doctorbg");
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
  //NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
    String sql="insert into doctor(id,doctorname,doctoraddress,doctorcontact,doctorbg)values(?,?,?,?,?)";
    PreparedStatement preparestatement=con.prepareStatement(sql);
    preparestatement.setString(1,null);
    preparestatement.setString(2,docname);
    preparestatement.setString(3,docaddr);
    preparestatement.setString(4,doccontact);
    preparestatement.setString(5,docbg);
    preparestatement.execute();
	}
catch(SQLException e)
{
out.println("error in loading data");
out.println(e);
}
%>
<p>Doctor</p>
<table border="1">
<tr>
<td>Doctor ID</td>
<td>Doctor Name</td>
<td>Doctor Address</td>
<td>Doctor Contact</td>
<td>Doctor Blood Group</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection connect = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
    Statement fetchdata = connect.createStatement();
    String sqlquery = "select * from doctor";
    ResultSet displaydata = fetchdata.executeQuery(sqlquery);
    while(displaydata.next())
    {%>
    <tr>
    <td><%=displaydata.getString("id") %></td>
    <td><%=displaydata.getString("doctorname") %></td>
    <td><%=displaydata.getString("doctoraddress") %></td>
    <td><%=displaydata.getString("doctorcontact") %></td>
    <td><%=displaydata.getString("doctorbg") %></td>
    </tr>
    <%
    }
}catch(Exception e)
{
	System.out.println(e);
}
%>
</table>
<a href="menu.html">Go Back To Menu</a>
</center>
</body>
</html>