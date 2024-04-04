<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<option value="">--select--</option>
<%

    String sel="select * from tbl_semester where course_id= '"+request.getParameter("sid")+"'";
    //out.print(sel);
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("semester_id")%>"><%=rs.getString("semester_count")%></option>
        <%
    }
%>