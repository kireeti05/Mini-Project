<%--sample2.jsp--%>

<%@page import="java.sql.*" %>


<%! 
    Connection con;
    Statement stmt;
    PreparedStatement pstmt;
    ResultSet rs;
%>


<%!

   public void jspInit()
   {
     
    try
    {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      con=DriverManager.getConnection("jdbc:odbc:mydsn","suji","suji");
      stmt=con.createStatement();
      pstmt=con.prepareStatement("insert into temp values(?,?,?)");
    }
    catch(Exception e){}
  }

  public void jspDestroy()
  {

    try
    {
      pstmt.close();
      stmt.close();
      rs.close();
    }
    catch(Exception e){}
  }

%>


<pre>
<center>
  <form action="Sample3.jsp" method="post">
  Name   <input type="text" name="name"><br>
  Email  <input type="text" name="email"><br>
  Mobile <input type="text" name="mobile"><br>
 <input type="submit" name="submit" value="submit">
 <input type="reset" name="reset" value="reset">
 </form>
 </center>

</pre>


<%  rs=stmt.executeQuery("select * from temp");
    ResultSetMetaData meta=rs.getMetaData();
    int colCount=meta.getColumnCount();
%>

<table border="10" align="center">

  <tr>
     <% 
        for(int i=1;i<=colCount;i++)
        {
     %>
      
    <th> <%=meta.getColumnName(i)%></th>

     <%
        }
     %>

  </tr>



   <% 
       while(rs.next())
       {
   %>
    
  <tr>
   
  <%
      for(int i=1;i<=colCount;i++)
      {
  %>   
     <td><%=rs.getString(i)%></td>
  <%
      }

  %>
  </tr>
    
  <%
     }
  %>
</table>

            



  
