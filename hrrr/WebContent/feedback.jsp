<%@ page import="java.sql.*"%>
<%@page session="true"%>

<%!	Connection con;
	PreparedStatement ps=null;
%>
<%
String st1=request.getParameter("name");
System.out.println(st1);
String st2=request.getParameter("S1");
System.out.println(st2);
%>  
<% try
	
{
        Class.forName("com.mysql.jdbc.Driver");
	System.out.println("driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?user=root&password=root");
 	
	System.out.println("con");
        
	ps=con.prepareStatement("insert into reply values(?,?)");
	System.out.println("con2");	
	ps.setString(1,st1);
	ps.setString(2,st2);
	int i=ps.executeUpdate();
	
		if (i>0)
		{      %>       

		<TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>&nbsp;</TD></TR>
        <TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>
            <p align="center"><b>Ur Message was sent to ......<%=st1%>
			<a href="Home.html">BACK</a></b>
          </TD></TR>
        <TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>&nbsp;
          </TD></TR>
        <TR>
          <TD vAlign=top width=771 
    bgColor=#ffffff>
            <p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </p>
          </TD></TR>
                          			
	
		<%}
		else
		{
			out.println("Sorry !...");
			
		}




}	
catch(Exception e)
{
 System.out.println("error"+e);
}
finally
{
	ps.close();
con.close();	
}

%>