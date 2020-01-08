<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Donor JSP</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body>
<center>
<%
//int did = 1000;
String dname = request.getParameter("donorname");
String dgender = request.getParameter("gender");
String address = request.getParameter("address");
String date = request.getParameter("date");
String contact = request.getParameter("contact");
String bg = request.getParameter("bg");
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
  //NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
    String sql="insert into donor(id,name,gender,address,date,quantity,contact,bg)values(?,?,?,?,?,?,?,?)";
    PreparedStatement preparestatement=con.prepareStatement(sql);
    preparestatement.setString(1,null);
    preparestatement.setString(2,dname);
    preparestatement.setString(3,dgender);
    preparestatement.setString(4,address);
    preparestatement.setString(5,date);
    preparestatement.setString(6,String.valueOf(350));
    preparestatement.setString(7,contact);
    preparestatement.setString(8,bg);
    preparestatement.execute();
	}
catch(SQLException e)
{
out.println("error in loading data");
out.println(e);
}
%>
<p>Donor</p>
<table border="1">
<tr>
<td>Donor ID</td>
<td>Donor Name</td>
<td>Donor Gender</td>
<td>Donor Address</td>
<td>Date Of Donation</td>
<td>Quantity Donated</td>
<td>Donor Contact</td>
<td>Donor Blood Group</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection connect = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
    Statement fetchdata = connect.createStatement();
    String sqlquery = "select * from donor";
    ResultSet displaydata = fetchdata.executeQuery(sqlquery);
    while(displaydata.next())
    {%>
    <tr>
    <td><%=displaydata.getString("id") %></td>
    <td><%=displaydata.getString("name") %></td>
    <td><%=displaydata.getString("gender") %></td>
    <td><%=displaydata.getString("address") %></td>
    <td><%=displaydata.getString("date") %></td>
    <td><%=displaydata.getString("quantity") %></td>
    <td><%=displaydata.getString("contact") %></td>
    <td><%=displaydata.getString("bg") %></td>
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