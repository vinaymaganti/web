<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.*" %> 
<%@ page session="true" %>
<jsp:useBean id="clock" class="java.util.Date" /> 


<%  	String userid = session.getAttribute("userid")+"";
	session.setAttribute("userid", userid);
   %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>Web site</title>
<link id="theme" rel="stylesheet" type="text/css" href="style.css" title="theme" />
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
<ul><li><a href="viewfac.jsp">View Faculty</a></li><li><a href="facupload.jsp">Upload New list</a></li>
<li><a href="facdelete.jsp">Remove Faculty</a></li><li><a href="facreset.jsp">Reset passwword</a></li></ul></li>

<li><a href="" class="toplvl">Department</a>
<ul><li><a href="viewdept.jsp">View Department</a></li><li><a href="adddept.jsp">Add department</a></li>
<li><a href="deptdelete.jsp">Delete Department</a></li><li><a href="viewsub.jsp">View subjects</a></li>
<li><a href="addsub.jsp">add subject</a></li><li><a href="delsub.jsp">Remove subject</a></li></ul></li>
                    
</div></div>


<div class="bd"><div id="page"><div id="main"><div class="content"><h1>Welcome <%=userid%></h1><center><font color="red" size="5">
          <table border="1"><tr><td>Faculty id</td><td>Deptid</td><td>Number of events</td></tr><%      try
{
    int count;
    Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
//	DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
//	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ktc","ktc");
PreparedStatement pst=null;
pst=con.prepareStatement("select unique(userid),deptid from event");
ResultSet rs=pst.executeQuery();
while(rs.next())
       {
String facid=rs.getString(1);
String deptid=rs.getString(2);
PreparedStatement pstmt=null;
pstmt=con.prepareStatement("select count(eventid)from event where userid=?");
pstmt.setString(1,facid);
ResultSet rs1=pstmt.executeQuery();
if(rs1.next())
       {

count=rs1.getInt(1);
out.print("<tr><td>"+facid+"</td><td>"+deptid+"</td><td>"+count+"</td></tr>");
}
}
}
catch(Exception e)
{

}                      


%></table>
</div></div><div class="clear" style="height:500px"></body></html>
