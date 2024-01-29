<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<option value="">--select--</option>
<%
    String did = request.getParameter("did");
    String sel="select * from tbl_course where department_id='"+did+"'";
    ResultSet rs=con.selectCommand(sel);
    
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("course_id")%>"><%=rs.getString("course_name")%></option>
        <%
    }
%>