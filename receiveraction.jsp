<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receiver JSP</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body>
<center>
<%
//int rid = 2000;
String rname = request.getParameter("receivername");
String rgender = request.getParameter("receivergender");
String raddress = request.getParameter("receiveraddress");
String rdate = request.getParameter("receiverdate");
String rcontact = request.getParameter("receivercontact");
String rbg = request.getParameter("receiverbg");
String docname = request.getParameter("doclist");
String donid = request.getParameter("donlist");
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
  //NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
    String sql="insert into receiver(id,receivername,gender,address,date,quantity,contact,bg,doctorname,donorid)values(?,?,?,?,?,?,?,?,?,?)";
    PreparedStatement preparestatement=con.prepareStatement(sql);
    preparestatement.setString(1,null);
    preparestatement.setString(2,rname);
    preparestatement.setString(3,rgender);
    preparestatement.setString(4,raddress);
    preparestatement.setString(5,rdate);
    preparestatement.setString(6,String.valueOf(350));
    preparestatement.setString(7,rcontact);
    preparestatement.setString(8,rbg);
    preparestatement.setString(9,docname);
    preparestatement.setString(10,donid);
    preparestatement.execute();
	}
catch(SQLException e)
{
out.println("error in loading data");
out.println(e);
}
%>
<p>Receiver</p>
<table border="1">
<tr>
<td>Receiver ID</td>
<td>Receiver Name</td>
<td>Receiver Gender</td>
<td>Receiver Address</td>
<td>Receiving Date</td>
<td>Quantity Received</td>
<td>Receiver Contact</td>
<td>Receiver Blood Group</td>
<td>Doctor Name</td>
<td>Donor ID</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection connect = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false","root","");
    Statement fetchdata = connect.createStatement();
    String sqlquery = "select * from receiver";
    ResultSet displaydata = fetchdata.executeQuery(sqlquery);
    while(displaydata.next())
    {%>
    <tr>
    <td><%=displaydata.getString("id") %></td>
    <td><%=displaydata.getString("receivername") %></td>
    <td><%=displaydata.getString("gender") %></td>
    <td><%=displaydata.getString("address") %></td>
    <td><%=displaydata.getString("date") %></td>
    <td><%=displaydata.getString("quantity") %></td>
    <td><%=displaydata.getString("contact") %></td>
    <td><%=displaydata.getString("bg") %></td>
    <td><%=displaydata.getString("doctorname") %></td>
    <td><%=displaydata.getString("donorid") %></td>
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