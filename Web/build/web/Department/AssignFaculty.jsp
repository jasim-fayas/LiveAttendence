<%-- 
    Document   : AssignFaculty
    Created on : 25 Jan, 2024, 11:11:51 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Faculty</title>
    </head>
    <body>
        <h1 align="center">Assign Faculty</h1>
 
        
        
        
        
        
        
        
        
        
      
  <%
      String did = session.getAttribute("departmentid").toString();
      String fid=request.getParameter("fid");
  String faculty = " select * from tbl_faculty p inner join tbl_department q on p.department_id=q.department_id inner join tbl_department_type r on q.department_type_id=r.department_type_id where faculty_id='"+ fid +"' ";
  ResultSet rs = con.selectCommand(faculty);
  rs.next();
  %>
  
         <%
       if(request.getParameter("btn_submit")!= null){
           
           String semester = request.getParameter("sel_semester");
            String name = rs.getString("faculty_id");     
             String subject = request.getParameter("sel_subject");    
             
             String insert = " insert into tbl_assign(faculty_id,semester_id,subject_id) values ('"+name+"','"+semester+"','"+subject+"')";
        //  out.print(insert);
             con.executeCommand(insert);
       } 
  
  
  
  
  %>
  <form method="post">
      <table border="2" align="center">
          <tr>
              <td colspan="2" align="center">
                        <img src="../Assets/Files/Teacher/<%=rs.getString("faculty_photo")%>" width="150px">
              </td>
          </tr>
          <tr>
              <td>
                  Faculty Name
              </td>
           
              <td>
                  
                  <%=rs.getString("faculty_name")%>
                  
              </td>
          </tr>
          <tr>
              <td>
                  Faculty Department
              </td>
              <td>
                  
                        <%=rs.getString("department_type_name")%>  
                  
              </td>
          </tr>
          <tr>
              <td>
                  Assigning Semester
              </td>
            
              <td>
                  <select name="sel_semester" id="sel_semester">
                      <option>----SELECT----</option>
                     <%
              String semester = " select * from tbl_semester ";
              ResultSet rss = con.selectCommand(semester);
              while(rss.next())
              {
              
              %>   
              <option value="<%=rss.getString("semester_id")%>"><%=rss.getString("semester_name")%></option>
                      <%
              }
                      %>
                  </select>
                  
                  
              </td>
          </tr>
          <tr>
              <td>
              Assigning Subject
              </td>
              <td>
                  
                    <select name="sel_subject" id="sel_subject">
                      <option>----SELECT----</option>
                     <%
              String subject = " select * from tbl_subject where department_id='"+did+"' ";
              ResultSet rssp = con.selectCommand(subject);
              while(rssp.next())
              {
              
              %>   
              <option value="<%=rssp.getString("subject_id")%>"><%=rssp.getString("subject_name")%></option>
                       <%
              }
                      %>
                  </select>
                  
              </td>
          </tr>
          <tr>
              <td colspan="2" align="center">
                  <input type="submit" name="btn_submit" value="Assign">
              </td>
          </tr>
      </table>
          
  </form>
</body>

</body>
</html>
