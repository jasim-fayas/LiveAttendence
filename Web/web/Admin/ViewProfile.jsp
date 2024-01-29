<%-- 
    Document   : ViewProfile
    Created on : 25 Jan, 2024, 5:55:46 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Profile</title>
    </head>
    <body>
        <h1> View Profile</h1>
        
               <%
        String SelQry ="select * from tbl_admin where admin_id='"+session.getAttribute("adminid")+"'";
        ResultSet rss = con.selectCommand(SelQry);
        rss.next();
        
        
        
        %>
       
          <form method="post">
            <table border="2">
              
                
                <tr>
                    <td>
                        Name
                    </td>
                    <td>
                        <%=rss.getString("admin_name")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    <td>
                        
                       <%=rss.getString("admin_email")%> 
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
