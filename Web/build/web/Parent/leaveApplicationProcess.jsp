<%-- 
    Document   : leaveApplicationProcess
    Created on : 7 Mar, 2024, 12:15:01 AM
    Author     : jasim fayas
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">View Leave Application</h1>
        <form method="post">
            <%
            if(request.getParameter("lid")!= null){
                
                String sid = request.getParameter("sid");
                
               String status = "1";
               
               String upd = " update tbl_leave set parent_status='"+status+"' where student_id='"+sid+"' ";
              if (con.executeCommand(upd)){
                  
               %>
             <script>
                            alert("Approved")
                            
                        </script>
                        <%
                    }else{
                        
                        %>
                      <script>
                            alert("failed")
                            
                        </script>    
                        <%
                    }
                }


            %>
            
            
            
            
              <%
            if(request.getParameter("rid")!= null){
                
                String siid = request.getParameter("siid");
                
               String status1 = "2";
               
               String upd = " update tbl_leave set parent_status='"+status1+"' where student_id='"+siid+"' ";
              if (con.executeCommand(upd)){
                  
               %>
             <script>
                            alert("Rejected")
                            
                        </script>
                        <%
                    }else{
                        
                        %>
                      <script>
                            alert("failed")
                            
                        </script>    
                        <%
                    }
                }


            %>
            
            
            
            <table border="2" align="center">
           
                <tr>
                    <td>
                        Leave Title
                    </td>
                    <td>
                        Leave Content
                    </td>
                    <td>
                        Leave Date
                    </td>
                    <td>
                        Action
                    </td>
                </tr>
                     <%
                String id = request.getParameter("did");
                String pid = session.getAttribute("parentid").toString();
                String qry = " select * from tbl_leave where student_id='"+id+"' ";
                
                ResultSet rs = con.selectCommand(qry);
               while( rs.next()){
                
                
                
                
                %>
                <tr>
                    <td>
                       <%=rs.getString("leave_title")%> 
                    </td>
                    <td>
                         <%=rs.getString("leave_content")%> 
                    </td>
                    <td>
                           <%=rs.getString("leave_date")%> 
                    </td>
                    <td>
                       <a href="leaveApplicationProcess.jsp?lid=<%=rs.getString("leave_id")%>&sid=<%=rs.getString("student_id")%>">Approve</a>
  <a href="leaveApplicationProcess.jsp?rid=<%=rs.getString("leave_id")%>&siid=<%=rs.getString("student_id")%>">Reject</a>
                    </td>
                </tr>
                <%
               }
                %>
            </table>
        </form>
    </body>
</html>
