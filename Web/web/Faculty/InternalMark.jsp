<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            input[type=number]::-webkit-inner-spin-button, 
            input[type=number]::-webkit-outer-spin-button { 
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                margin: 0; 
            }
        </style>
    </head>
    <%
        String semester = "";
        String subject = "";
        String selQry = "select * from tbl_subject sub inner join tbl_semester sem on sem.semester_id=sub.semester_id inner join tbl_student stu on stu.semester_id=sem.semester_id where sub.subject_id='" + request.getParameter("sid") + "'";
        ResultSet result1 = con.selectCommand(selQry);
        ResultSet result2 = con.selectCommand(selQry);
        if (result1.next()) {
            semester = result1.getString("semester_name");
            subject = result1.getString("subject_name");
        }
    %>
    <body>
        <div id="tab" align="center">
            <h1 align="center">Internal Marks</h1>
            <form>
                <table border="1">
                    <tr> 
                        <td>Semester</td>
                        <td colspan="2"><%=semester%></td>
                    </tr>
                    <tr> 
                        <td>Subject</td>
                        <td colspan="2"><%=subject%></td>
                    </tr>
                    <tr> 
                        <td>SL NO</td>
                        <td>Student</td>
                        <td>Mark</td>
                    </tr>
                    <%
                        int i = 0;
                        while (result2.next()) {
                            String mark = "0";
                            String selQry1 = "SELECT * FROM tbl_internalmark where student_id='" + result2.getString("student_id") + "' and subject_id='" + result2.getString("subject_id") + "'";
                            ResultSet row1 = con.selectCommand(selQry1);
                            if (row1.next()) {
                                mark = row1.getString("internalmark_mark");
                            }
                            i++;
                    %>
                    <tr> 
                        <td><%=i%></td>
                        <td><%=result2.getString("student_name")%></td>
                        <td><input type="number" name="txt_mark" id="txt_mark" value="<%=mark%>" placeholder="Enter Mark" onkeyup="updateMark(this.value,<%=result2.getString("subject_id")%>,<%=result2.getString("student_id")%>)" min="0" /></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </form>
        </div>
    </body>
    <script src="../Assets/JQ/jQuery.js"></script>
    <script>
                            function updateMark(mark, sub, stud)
                            {
                                $.ajax({
                                    url: "../Assets/AjaxPages/AjaxMark.jsp?mark=" + mark + "&sub=" + sub + "&stud=" + stud,
                                    success: function(html) {
                                        if (html.trim() != "")
                                        {
                                            alert(html.trim())
                                        }
                                    }
                                });
                            }
    </script>
</html>
