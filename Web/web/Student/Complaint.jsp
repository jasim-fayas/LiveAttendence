<%-- 
    Document   : Complaint
    Created on : 17 Feb, 2024, 8:34:56 PM
    Author     : jasim fayas
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Complaint</title>
    </head>
    <body>
        <h1 align="center">Complaint</h1>
        <form method="post">

            <%
                String id = session.getAttribute("studentid").toString();
                if (request.getParameter("btn_submit") != null) {
                    String title = request.getParameter("txt_title");
                    String content = request.getParameter("txt_content");

                    String insert = " insert into tbl_feedback (student_id,feedback_title,feedback_content,feedback_date) values ('" + id + "','" + title + "','" + content + "',curdate()) ";
//                   out.print(insert);
                    if(con.executeCommand(insert)){
                        
                        %>
                        <script>
                            alert("Inserted")
                            
                        </script>
                        <%
                    }else{
                        
                        %>
                      <script>
                            alert("Insertion failed")
                            
                        </script>    
                        <%
                    }
                }


            %>

            <table border="2" align="center">
                <tr>
                    <td>
                        Complaint Title
                    </td>
                    <td>
                        <input type="text" name="txt_title">
                    </td>
                </tr>
                <tr>
                    <td>
                        Complaint Content
                    </td>
                    <td>
                        <textarea name="txt_content"></textarea>
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" >
                        <input type="submit" name="btn_submit" value="Submit" >
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
