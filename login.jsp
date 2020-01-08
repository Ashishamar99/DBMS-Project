<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*"%>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<meta charset="ISO-8859-1">
<title>Login JSP</title>
</head>
<body>
<center>
<%
Connection conn = null;
String uname = request.getParameter("username");
String passwd = request.getParameter("password");
try{
	String url = "jdbc:mysql://localhost:3306/bloodbank?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false";
	//NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
	String username = "root";
	String password = "";
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,username,password);
	String Query="select * from logindetails where username=? and passwd=?";
    PreparedStatement psm=conn.prepareStatement(Query);
    psm.setString(1,uname);
    psm.setString(2,passwd);
    ResultSet rs=psm.executeQuery();
    if(rs.next())
    {
    response.sendRedirect("menu.html");
    }                  
        else
      { 
        	out.println("Login Failed!\nPlease Try Again");
          
      }
}catch(Exception e)
	{
		out.print(e);
	}

%>
<br><br><a href="index.html">Go Back To Login</a>
</center>
</body>
</html>