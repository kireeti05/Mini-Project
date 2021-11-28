<%@ page import="java.sql.*"%>
<%
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:mydsn","suji","suji");
   Statement stmt=con.createStatement();
   PreparedStatement pstmt=con.prepareStatement("insert into temp values(?,?,?)");
   pstmt.setString(1,request.getParameter("name"));
   pstmt.setString(1,request.getParameter("email"));
   pstmt.setString(1,request.getParameter("mobile"));
   pstmt.executeUpdate();
%>
<jsp:forward page="Sample2.jsp"/>