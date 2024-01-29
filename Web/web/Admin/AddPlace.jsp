<%-- 
    Document   : AddPlace
    Created on : 25 Jan, 2024, 10:21:35 PM
    Author     : jasim fayas
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Place</title>
    </head>
    <body>
     
     <h1>Add Place</h1>
        <%
         if(request.getParameter("save")!= null){
             String place=request.getParameter("place");
             String district=request.getParameter("district");
             String insert="insert into tbl_place (district_id,place_name)value('"+district+"','"+place+"')";
             con.executeCommand(insert);
         }
        %>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>
                        District
                    </td>
                    <td>
                        <select name="district">
                            <option value="">--select--</option>
                            <%
                         String select="select * from tbl_district";
                         ResultSet rs=con.selectCommand(select);
                         while(rs.next())
                         {
                        %>
                            <option value=<%=rs.getString("district_id")%>><%=rs.getString("district_name")%></option>
                         <%
                         }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        place
                    </td>
                    <td>
                        <input type="text" name="place">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="save" value="save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
                        <br><br>
                        <table border="2" align="center">
                            <tr>
                                <td>
                                    Sl number
                                </td>
                                <td>
                                    Place Name
                                </td>
                                <td>
                                    District Name
                                </td>
                              
                            </tr>
                            <tr>
                                <%
                                String selqry = " select * from tbl_place p inner join tbl_district q on p.district_id=q.district_id ";
                                ResultSet rsss= con.selectCommand(selqry);
                                int i = 0;
                                while (rsss.next()){
                                    
                               i++;
                                
                                %>
                                <td>
                                   <%=i%> 
                                </td>
                                <td>
                                   <%=rsss.getString("place_name")%>   
                                </td>
                                <td>
                                      <%=rsss.getString("district_name")%>   
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
        </form>
    </body>
</html>
