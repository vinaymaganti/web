<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>
<jsp:useBean id="clock" class="java.util.Date" /> 
<%String userid = session.getAttribute("userid")+"";%>
<%session.setAttribute("userid", userid);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
<script language="javascript">
function validateR(){
  var selectedCombobox=(frm.depart.value);
  if (selectedCombobox=="0") {
  alert("Please Select department to be deleted");
  return false;
  }
  return true;
  }
  </script>
</head>
<body>
<div id="top"><div class="overlay"></div></div><div id="wrapper"><div class="overlay"></div><div class="border-top"></div>  
<div class="content"><div id="container"><div class="hd"><div id="container-top"></div><div id="banner"></div><div id="hmenu-wpr"><ul id="hmenu" class="sf-menu sf-js-enabled sf-shadow">
<li class="current" style="border:none">
<a class="toplvl sf-with-ul" href="adminhome.jsp">Home</a></li>
<li><a href="#" class="toplvl">Profile</a>
<ul>
<li><a href="changeadmin.jsp">Change Password</a></li><li><a href="adminlogout.jsp">Logout</a></li></ul></li>
<li><a href="#" class="toplvl">Student</a>
<ul><li><a href="viewstud.jsp">View Students</a></li><li><a href="stureset.jsp">Reset Password</a></li>
<li><a href="studelete.jsp">Remove Student</a></li></ul></li>

<li><a href="#" class="toplvl">Faculty</a>
<ul><li><a href="viewfac.jsp">View Faculty</a></li>
<li><a href="facdelete.jsp">Remove Faculty</a></li><li><a href="facreset.jsp">Reset passwword</a></li></ul></li>

<li><a href="" class="toplvl">Department</a>
<ul><li><a href="viewdept.jsp">View Department</a></li><li><a href="adddept.jsp">Add department</a></li>
<li><a href="deptdelete.jsp">Delete Department</a></li><li><a href="viewsub.jsp">View subjects</a></li>
<li><a href="addsub.jsp">add subject</a></li><li><a href="delsub.jsp">Remove subject</a></li></ul></li>
</div></div>
<div class="bd"><div id="page"><div id="main"><div class="content">
                <h1>""ADMIN""</h1><center><br><h2>Select Department to delete</h2>
<br>
<center>
<form method=post action="deptdelete2.jsp" name="frm" onSubmit="return check()">
<FONT  face="arial" size="4" COLOR="#330099">Select Department&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
<select size=1 name=depart>
<option value="-1">< - - -Select- - -></option>
<br><%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
	Statement stmt = con.createStatement();
ResultSet rs=stmt.executeQuery("select deptname from dept");
while(rs.next())
{
String dpt=rs.getString(1);
%>
<option><%=dpt%></option>
<%
} 	//rs.close();
	//st.close();
}
catch(Exception e)
{	
	e.printStackTrace();   
}%></select><br><br><center>&nbsp;&nbsp;
<input name=submit type="submit" onclick="return validateR();">
</form>
</div></div><div class="clear" style="height:500px"></body></html>