<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
</head>

<body>
<div id="tab" align="center">
<h1 align="center">Assigned Subjects</h1>
<form id="form1" name="form1" method="post" action="">
<%
    String fid = session.getAttribute("facultyid").toString();

String selqry="select * from tbl_assign a inner join tbl_semester s on s.semester_id=a.semester_id inner join tbl_subject su on su.subject_id=a.subject_id where faculty_id='"+fid+"'";
ResultSet rs=con.selectCommand(selqry);
 
  
  %>
  <table border="1">
    <tr>
      <td>Sl.No</td>
      <td>Semester</td>
      <td>Subject</td>
      <td>Action</td>
    </tr>
    <%
	while(rs.next()){
	
		int i=0;
		i++;
	%>
    <tr>
      <td><%=i%></td>
      <td><%=rs.getString("semester_name")%></td>
      <td><%=rs.getString("subject_name")%></td>
      <td><a href="InternalMark.jsp?sid=<%=rs.getString("subject_id")%>">InternalMark</a></td>
    </tr>
   <%
	}
	%>
  </table>
    <%
	
	%>
</form>
</div>
</body>
</html>
