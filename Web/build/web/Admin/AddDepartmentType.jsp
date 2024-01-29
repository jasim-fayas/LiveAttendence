<%-- 
    Document   : AddDepartmentType
    Created on : 25 Jan, 2024, 6:15:33 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Department Type</title>
    </head>
    <body>
        <h1 align="center">Add Department Type</h1>
        
          <%
        if(request.getParameter("btn_submit")!=null)
        {
            String name=request.getParameter("department_type");
            String insQry="insert into tbl_department_type(department_type_name)values('"+name+"')";
            con.executeCommand(insQry);
        }
        if (request.getParameter("id")!=null)
        {
         String id=request.getParameter("id");
         String delete="delete from tbl_department_type where department_type_id='"+id+"'";
         con.executeCommand(delete);
        }
        
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        Department Type
                    </td>
                    <td>
                        <input type="text" name="department_type">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Submit">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
<!--            display-->
<table border="2">
    <tr>
        <td>S.NO</td>
        <td>Department Type</td>
        <td>Action</td>
    </tr>
    <%
     String select="select * from tbl_department_type";
     ResultSet rs=con.selectCommand(select);
     int i=0;
     while(rs.next())
     {
         i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("department_type_name")%></td>
        <td><a href="AddDepartmentType.jsp?id=<%=rs.getString("department_type_id")%>">Delete</a></td>
    </tr>
    <%
     }
    %>
</table>
        </form>
    </body>
</html>
