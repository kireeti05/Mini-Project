<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@page contentType="application/vnd.ms-excel"%>
<%response.setHeader("Content-Disposition","attachment;filename=Report.xls");%>

<HEAD>

<Style>
	.row_title {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #999966 ;FONT-WEIGHT: bold; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	.row_odd {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #c8c8c8 ;FONT-WEIGHT: normal; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	.row_even {
		FONT-SIZE: 8pt; BACKGROUND-COLOR: #E8E8E8 ;FONT-WEIGHT: normal; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
	TABLE.notebook {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; WIDTH: 90%; BORDER-BOTTOM: 0px
	}
	Body.SC {
     scrollbar-arrow-color:#00000;
     scrollbar-base-color:#c8c8c8;
     scrollbar-face-color:#e8e8e8;
     scrollbar-darkshadow-color:#b8b8b8;
	 BACKGROUND-COLOR: #E8E8E8
	 FONT-WEIGHT: normal; FONT-SIZE: 10pt; FONT-FAMILY: Verdana,Arial,helvetica,sans-serif;
	}
</Style>

</HEAD>
<BODY class=SC>
<h2>List of Employees</h2>

<%

	Connection con;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			//con = DriverManager.getConnection("jdbc:odbc:pms","root","");
			Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?user=root&password=root");
			stmt =  con.createStatement();
			String Query = "Select * from employees order by `empno`";
			rs = stmt.executeQuery(Query);
			%>
						<table class=notepad width='60%' align=center>
							<tr class=row_title>
							<th class=row_title>EmpNo</th><th class=row_title>EmpName</th><th class=row_title>mailId</th><th class=row_title>Location</th><th class=row_title>ProjectCode</th><th class=row_title>Role</th><th class=row_title>Skill</th><th class=row_title>Visa</th><th class=row_title>PassportNo</th><th class=row_title>JoiningDate</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td><td><%=rs.getString(9)%></td><td><%=rs.getString(10)%></td>
					</tr>
					<%
				rCount++;
			}
			%></table><%if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
		con.close();}catch(Exception e){%><%=e%><%}
	
%>
</BODY>


