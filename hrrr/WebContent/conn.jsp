
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
	<%

	Connection con= null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			System.out.println("conn");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("conn1");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?user=root&password=root");
			System.out.println("conn2");
}
catch(Exception e) {}
			%>
