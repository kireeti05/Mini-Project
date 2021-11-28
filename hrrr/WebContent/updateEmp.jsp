<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@ include file ="conn.jsp"%>
<HEAD>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
	<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<script LANGUAGE="Javascript" SRC="">
		function validate()
		{
			var frm = document.AddEmp;
		    if(ChkNumField(frm.EmpNo,'Employee Number')==false) return false;
			if(ChkMandatoryField(frm.EmpName,'Employee Name')==false) return false;
			if(ChkNameField(frm.EmpName,'Employee Name')==false) return false;
			if(ChkMandatoryField(frm.mailId,'Email Id')==false) return false;
			if(ChkEmailField(frm.mailId,'Email Id')==false) return false;
			if(ChkMandatoryField(frm.Location,'Location')==false) return false;
			if(ChkNameField(frm.Location,'Location')==false) return false;
			if(ChkMandatoryField(frm.Role,'Role')==false) return false;
			if(ChkNameField(frm.Role,'Role')==false) return false;
			if(ChkMandatoryField(frm.Skill,'Skills')==false) return false;
			if(ChkNameField(frm.Skill,'Skills')==false) return false;
			if(ChkMandatoryField(frm.JoiningDate,'JoiningDate')==false) return false;
		}
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
	   function ChkNameField(F,T){
			var val = F.value;
			var Npattern = /^([a-zA-Z\_\. ]{1,25})$/;

			if(Npattern.test(val)) 
			return true
				{alert("Please enter valid name for "+T);
			 	return false;}
		}
		function ChkEmailField(F,T){
				 		
	  			var val=F.value;
				var pattern = /^[a-zA-Z0-9\_\.]+\@[a-zA-Z\.]+\.([a-z]{2,4})$/;
				if(!(pattern.test(val))) {
				alert("Please enter valid Email ID");
				return false;
			}
			else 
				return true;
		}
	</script>
</HEAD>
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
	jeditempno=Integer.parseInt(request.getParameter("editeno").trim());
System.out.println(jeditempno);
Statement st=con.createStatement();
	 rs=st.executeQuery("select * from employees where Empno="+jeditempno);
System.out.println(rs);
if(rs.next())
	{	
//	System.out.println("test edit  1:"+rs.getInt(1));
System.out.println("test edit  1:");
		if(rs.getInt(1)==jeditempno)
		{   
			jempe=jeditempno;
%>
	<TABLE align=center>
	<TR class=row_odd>
		<TD>Employee Number <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="EmpNo" value="<%=jempe%>"></TD>
	</TR>
	<TR>
		<TD>Name <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="EmpName"value='<%=rs.getString(2)%>'></TD>
	</TR>
	<TR class=row_odd>
		<TD>Email id <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="mailId" value='<%=rs.getString(3)%>'></TD>
	</TR>
	<TR>
		<TD>Current Location <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Location"value='<%=rs.getString(4)%>'></TD>
	</TR>
	<TR class=row_odd>
		<TD>Project Code</TD>
		<TD><INPUT TYPE="text" NAME="ProjectCode"value='<%=rs.getString(5)%>'></TD>
	</TR>
	<TR>
		<TD>Role <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Role"value='<%=rs.getString(6)%>'></TD>
	</TR>
	<TR class=row_odd>
		<TD>Skills <FONT COLOR="red">*</FONT></TD>
		<TD><INPUT TYPE="text" NAME="Skill"value='<%=rs.getString(7)%>'></TD>
	</TR>
	<TR>
		<TD>Visa</TD>
		<TD><INPUT TYPE="text" NAME="Visa" value='<%=rs.getString(8)%>' ></TD>
	</TR>
	<TR class=row_odd>
		<TD>Passport number</TD>
		<TD><INPUT TYPE="text" NAME="PassportNo" value='<%=rs.getString(9)%>'></TD>
	</TR>
	
	
	<TR class=row_odd>
		<TH><INPUT TYPE="submit" class="button" value="Update"></TH>
			</TR>

</TABLE>
</FORM>
</BODY>

<%

}
  }
   }
  %>
