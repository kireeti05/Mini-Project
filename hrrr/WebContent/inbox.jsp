<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft Front Page 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Inbox</title>
</head>
<body >
<%!

	Connection con= null;
	
	%>
<%
String Userid=(String)session.getAttribute("userr");
System.out.println("USERID:"+Userid); 	
try
{			System.out.println("conn");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("conn1");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?user=root&password=root");
			System.out.println("conn2"+con);
Statement stmt=con.createStatement();
	ResultSet rs= stmt.executeQuery("select * from reply where username='"+Userid+"'");
   
System.out.println("update");
%>
<p align=left><FONT color=deepskyblue size=3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
Wel</FONT><FONT size=3>come To Ur <FONT color=navy>I</FONT></FONT>
<FONT size=2>nbox</FONT></p>
<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<TABLE border=4 cellPadding=3 cellSpacing=3 width="75%">
  <TR><TD>
      <P align=center><FONT color=cornflowerblue size=5>Message &nbsp;</FONT></P></TD></TR><%while(rs.next())
	{%>
  <TR><TD><P align=center><%out.println(rs.getString(2));%><%
	}
%> </P></TABLE>
<a href="Home.html">BACK</a>
	



<!--<br><br><br><br>
<jsp:include page="MultiLevelmenu.htm"/>
<Font size=+1>There is no mails for you...<br>
<a href="Home.html">BACK</a>-->
<jsp:include page="Home.html"/> 
</font>
<%

}
catch(SQLException e)
{
e.printStackTrace();
}
%>
&nbsp;&nbsp;</p><P> </P><P> </P>

</body></html>