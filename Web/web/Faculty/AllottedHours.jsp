<%-- 
    Document   : AllottedHours
    Created on : 4 Mar, 2024, 11:06:53 AM
    Author     : jasim fayas
--%><%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Allotted Hours</title>
    </head>
    <body>
        <h1>Hello Faculty</h1>
       <%   ArrayList<String> days = new ArrayList<String>();
    days.add("Monday");
    days.add("Tuesday");
    days.add("Wednesday");
    days.add("Thursday");
    days.add("Friday"); %>
        <form method="post">
        <table border="2" align="center">
            <tr>
                <td>
                Select Day
               </td>
               <td>
                   <select name="selday">
                       <option>---SELECT---</option>
                        <% for (String day : days) { %>
                            <option><%= day %></option>
                        <% } %>
                       
                   </select>
               </td>
               <td>
                   <input type="submit" name="btn_submit" value="submit">
               </td>
            </tr>
        </table>
        </form>
        <%
        if(request.getParameter("btn_submit")!=null){
             String selectedDay = request.getParameter("selday");
            String selqry = " select * from tbl_timetable p inner join tbl_assign q on p.subject_id=q.subject_id where q.faculty_id='"+ session.getAttribute("facultyid") +"'  ";
          ResultSet rs = con.selectCommand(selqry);
          
          if(selectedDay.equals("Monday")){
              
              %>
              <table border="2">
                  <tr>
                      <td>
                          Allotted Hours are
                      </td>
                  </tr>
                  <%
                  while(rs.next()){
                  
                  %>
                  <tr>
                      <%=rs.getString("timetable_hour")%>
                  </tr>
                  <%
                  }
                  %>
              </table>
              
              <%
          }
        }
   
        %>
    </body>
</html>
