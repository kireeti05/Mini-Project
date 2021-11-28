<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@ include file ="conn.jsp"%>


<jsp:include page="MultiLevelmenu.htm"/><br><br><br>
<BODY class=SC>
<%
	Integer IAuth =(Integer)session.getAttribute("auth");
	int auth= IAuth.intValue();
	System.out.println("===Authentication=="+auth);
if(auth!=1){
	%><H3 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">You are not authorized to access this page</H3><%
}
else{
%>	
<h2 align=center>Edit Employee Details</h2>
<FORM Name="AddEmp" ACTION="insertEmp.jsp" onsubmit="return validate()">
<%! ResultSet rs=null;%>

<%! int jeditempno;%>
<%! int jempe;%>
<% System.out.println("welcome");
int empno=Integer.parseInt(request.getParameter("EmpNo"));
String ename=request.getParameter("EmpName");
String mailid=request.getParameter("mailId");
String location=request.getParameter("Location");
String projectcode=request.getParameter("ProjectCode");
String  role=request.getParameter("Role");
String skill=request.getParameter("Skill");
String visa=request.getParameter("Visa");
String  passportno=request.getParameter("PassportNo");
try{

Class.forName("com.mysql.jdbc.Driver");
			System.out.println("conn1");
			Connection con1= DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?user=root&password=root");
			System.out.println("conn2"+con1);
	PreparedStatement pstmt=con1.prepareStatement("update employees set empname=?,mailid=?,location=?,projectcode=?,role=?,skill=?,visa=?,passportno=? where empno=?");
pstmt.setString(1,ename);
pstmt.setString(2,mailid);
pstmt.setString(3,location);
pstmt.setString(4,projectcode);
pstmt.setString(5,role);
pstmt.setString(6,skill);
pstmt.setString(7,visa);
pstmt.setString(8,passportno);
pstmt.setInt(9,empno);
int j=pstmt.executeUpdate();
if(j>0)
{
%>
<BR><BR><BR><BR>
<br>
<font size=2 color='green'><b>Employee Details Updated Sucessfully..<b><br>

<a href="Home.html">BACK</a></font>	



<%

}else{
%>
<BR><BR><BR><BR>
<font size=+3 color='red'><i>Employee Details Updation Failed</i></font>	

<%

  }
   }catch(Exception e)
{
e.printStackTrace();
} 
} %>
</BODY>
</html>
