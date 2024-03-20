<%@page  import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%
    String Qry = "";
    int mark = Integer.parseInt(request.getParameter("mark"));
    String sub = request.getParameter("sub");
    String stud = request.getParameter("stud");

    String selQry = "SELECT * FROM tbl_internalmark where student_id='" + stud + "' and subject_id='" + sub + "'";
    ResultSet rs = con.selectCommand(selQry);
    if (rs.next()) {
        Qry = "UPDATE `tbl_internalmark` SET `internalmark_mark`='"+mark+"',`internalmark_date`=curdate() where student_id='"+stud+"' and subject_id='"+sub+"'";

    } else {
        Qry = "INSERT INTO `tbl_internalmark`(`internalmark_date`, `internalmark_mark`, `subject_id`, `student_id`) VALUES (curdate(),'" + mark + "','" + sub + "','" + stud + "')";
    }

    if (mark >= 0 && mark <= 20) {
        if (con.executeCommand(Qry)) {

        }
    } else {
        out.print("Mark Between 0 to 20");
    }


%>