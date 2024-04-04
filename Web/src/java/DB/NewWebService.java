package DB;

import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebService(serviceName = "NewWebService")
public class NewWebService {

    ConnectionClass con = new ConnectionClass();

    @WebMethod(operationName = "LoginDetails")
    public String LoginDetails(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {

        String sel = "select * from tbl_faculty where faculty_email='" + email + "' and faculty_password='" + password + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();

        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("id", rs.getString("faculty_id"));
                jo.put("name", rs.getString("faculty_name"));
                jo.put("status", rs.getString("faculty_status"));
                jo.put("deptid", rs.getString("department_id"));

                j.put(jo);
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Mypro")
    public String Mypro(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:

        String fal = "select * from tbl_faculty where faculty_id='" + id + "' ";
        ResultSet fc = con.selectCommand(fal);
        JSONArray f = new JSONArray();

        try {
            if (fc.next()) {
                JSONObject fo = new JSONObject();
                fo.put("name", fc.getString("faculty_name"));
                fo.put("email", fc.getString("faculty_email"));
                fo.put("contact", fc.getString("faculty_contact"));
                fo.put("pass", fc.getString("faculty_password"));
//                fo.put("sname", fc.getString("subject_name"));
//                fo.put("dname", fc.getString("department_type_name"));
                f.put(fo);

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(f.toString());
        return f.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "FacultyUpdate")
    public String FacultyUpdate(@WebParam(name = "id") String id, @WebParam(name = "name") String name, @WebParam(name = "email") String email, @WebParam(name = "contact") String contact, @WebParam(name = "password") String password) {
        //TODO write your implementation code here:

        String falcultyUpd = " update tbl_faculty set faculty_name='" + name + "',faculty_email='" + email + "',faculty_contact='" + contact + "',faculty_password='" + password + "' where faculty_id='" + id + "' ";
        con.executeCommand(falcultyUpd);
        return "Updated";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "FeedbackReply")
    public String FeedbackReply(@WebParam(name = "id") String id, @WebParam(name = "feedbackreply") String feedbackreply) {
        //TODO write your implementation code here:
        String verdict = "failed";
//        String status = "1";
        String feedback = " insert into tbl_feedback_reply (feedback_id,feedback_reply) values ('" + id + "','" + feedbackreply + "')";
        out.print(feedback);

        if (con.executeCommand(feedback)) {

            String feed = " update tbl_feedback set feedback_status='" + 1 + "' where feedback_id='" + id + "'";
            out.print(feed);
            con.executeCommand(feed);

            verdict = "Inserted";
        }

        return verdict;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "AddAttendenceddetails")
    public String AddAttendenceddetails() {
        //TODO write your implementation code here:

        String attendence = " select * from tbl_student ORDER BY student_name ASC ";

        ResultSet at = con.selectCommand(attendence);
        JSONArray a = new JSONArray();

        try {
            while (at.next()) {
                JSONObject ao = new JSONObject();
                ao.put("name", at.getString("student_name"));
                ao.put("id", at.getString("student_id"));
//                fo.put("sname", fc.getString("subject_name"));
//                fo.put("dname", fc.getString("department_type_name"));
                a.put(ao);

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(a.toString());
        return a.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ComplaintDetails")
    public String ComplaintDetails(@WebParam(name = "fid") String fid, @WebParam(name = "deptid") String deptid) {
        //TODO write your implementation code here:

        String id = "0";
        String complaintdetails = " select * from tbl_feedback p inner join tbl_student q on p.student_id=q.student_id inner join tbl_department r on q.department_id=r.department_id where feedback_status='" + id + "' and r.department_id='" + deptid + "' ORDER BY feedback_id DESC";
        ResultSet cd = con.selectCommand(complaintdetails);
        JSONArray c = new JSONArray();

        try {
            while (cd.next()) {
                String stuName = "Anonymous";
                if (cd.getInt("feedback_a_status") != 1) {
                    String getUser = " select * from tbl_student where student_id='" + cd.getString("student_id") + "'";
                    ResultSet user = con.selectCommand(getUser);
                    if (user.next()) {
                        stuName = user.getString("student_name");
                    }
                }
                JSONObject co = new JSONObject();
                co.put("title", cd.getString("feedback_title"));
                co.put("details", cd.getString("feedback_content"));
                co.put("name", stuName);
                co.put("id", cd.getString("feedback_id"));
                c.put(co);

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        //  System.out.print(f.toString());
        return c.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "timetabledetails")
    public String timetabledetails(@WebParam(name = "id") String id, @WebParam(name = "deptid") String deptid) {
        //TODO write your implementation code here:

        String timetableqry = "select * from tbl_timetable p inner join tbl_subject q on p.subject_id=q.subject_id inner join tbl_course r on q.course_id=r.course_id inner join tbl_assign s on p.subject_id=s.subject_id where s.faculty_id='" + id + "'  ";
        ResultSet time = con.selectCommand(timetableqry);
        JSONArray t = new JSONArray();
        JSONObject to = new JSONObject();
        try {
            while (time.next()) {

                to.put(time.getString("timetable_hour") + time.getString("timetable_day"), time.getString("subject_name"));
                to.put(time.getString("timetable_day") + time.getString("timetable_hour"), time.getString("course_name"));

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(t.toString());
        t.put(to);
        return t.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "student")
    public String student(@WebParam(name = "did") String did, @WebParam(name = "cid") String cid, @WebParam(name = "sid") String sid) {
        //TODO write your implementation code here:
        String studentqy = " select * from tbl_student p inner join tbl_course q on p.course_id=q.course_id inner join tbl_semester r on p.semester_id=r.semester_id where p.course_id='" + cid + "' and p.semester_id='" + sid + "'  ORDER BY student_name ASC";
        System.out.println(studentqy);
        ResultSet at = con.selectCommand(studentqy);
        JSONArray a = new JSONArray();

        try {
            while (at.next()) {
                JSONObject ao = new JSONObject();
                ao.put("name", at.getString("student_name"));
                ao.put("id", at.getString("student_id"));

                for (int i = 1; i <= 5; i++) {
                    String check = "false";
                    String selQry = "select * from tbl_attendance where attendance_date=curdate() and student_id='" + at.getString("student_id") + "' and attendance_hour='" + i + "'";
                    ResultSet rs = con.selectCommand(selQry);
                    if (rs.next()) {
                        check = "true";
                    }
                    ao.put("hour" + i, check);
                }
                a.put(ao);

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(a.toString());
        return a.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getcource")
    public String getcource(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:

        String sel = "select * from tbl_course where department_id='" + id + "' ";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("cid", rs.getString("course_id"));
                        jo.put("cname", rs.getString("course_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "semester")
    public String semester() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_semester  ";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("sid", rs.getString("semester_id"));
                        jo.put("sname", rs.getString("semester_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "AddAttendance")
    public String AddAttendance(@WebParam(name = "sid") String sid, @WebParam(name = "fid") String fid, @WebParam(name = "hour") String hour) {
        //TODO write your implementation code here:
        String dilt = "Attendance Added";
        String sel = " select * from tbl_attendance where student_id='" + sid + "'  and attendance_hour='" + hour + "' ";
        ResultSet st = con.selectCommand(sel);
        try {
            if (st.next()) {
                String delqry = " delete from tbl_attendance where student_id='" + sid + "' and attendance_hour='" + hour + "'  ";
                con.executeCommand(delqry);
                dilt = "Deleted";
            } else {
                String attendanceinsqry = " insert into tbl_attendance (student_id,faculty_id,attendance_hour,attendance_date) VALUES ('" + sid + "','" + fid + "','" + hour + "',curdate()) ";
                con.executeCommand(attendanceinsqry);
                System.out.println(attendanceinsqry);

            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return dilt;

    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "subjectsandsemester")
    public String subjectsandsemester(@WebParam(name = "fid") String fid) {
        //TODO write your implementation code here:
        String subs = " select * from tbl_assign p inner join tbl_subject q on p.subject_id=q.subject_id inner join tbl_semester r on p.semester_id=r.semester_id  inner join tbl_department tt on q.department_id=tt.department_id inner join tbl_department_type ttr on tt.department_type_id=ttr.department_type_id where faculty_id='" + fid + "' ";
        System.out.println(subs);
        ResultSet ss = con.selectCommand(subs);

        JSONArray a = new JSONArray();

        try {
            while (ss.next()) {
                JSONObject ao = new JSONObject();
                ao.put("sname", ss.getString("subject_name"));
                ao.put("sid", ss.getString("subject_id"));
                ao.put("semname", ss.getString("semester_name"));
                ao.put("semid", ss.getString("semester_id"));
                ao.put("dpname", ss.getString("department_type_name"));
//                fo.put("sname", fc.getString("subject_name"));
//                fo.put("dname", fc.getString("department_type_name"));
                a.put(ao);

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(a.toString());
        return a.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getstudwithsubjects")
    public String getstudwithsubjects(@WebParam(name = "subId") String subId) {
        //TODO write your implementation code here:
        String selQry = "select * from tbl_student p inner join tbl_course r on p.course_id=r.course_id inner join tbl_subject q on r.course_id=q.course_id inner join tbl_semester pq on p.semester_id=pq.semester_id where q.subject_id='" + subId + "'";
        System.out.println(selQry);
        ResultSet ss = con.selectCommand(selQry);

        JSONArray a = new JSONArray();

        try {
            while (ss.next()) {
                JSONObject ao = new JSONObject();
                ao.put("stuname", ss.getString("student_name"));
                ao.put("stuid", ss.getString("student_id"));

//                fo.put("sname", fc.getString("subject_name"));
//                fo.put("dname", fc.getString("department_type_name"));
                a.put(ao);

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(a.toString());
        return a.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "dpname")
    public String dpname(@WebParam(name = "fid") String fid) {
        //TODO write your implementation code here:
        String qry = " select * from tbl_faculty p inner join tbl_department q on p.department_id=q.department_id inner join tbl_department_type r on q.department_type_id=r.department_type_id where p.faculty_id='" + fid + "' ";

        System.out.println(qry);
        ResultSet ss = con.selectCommand(qry);

        JSONArray a = new JSONArray();

        try {
            while (ss.next()) {
                JSONObject ao = new JSONObject();
                ao.put("dnamed", ss.getString("department_type_name"));

                a.put(ao);

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(a.toString());
        return a.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "UploadInternalMark")
    public String UploadInternalMark(@WebParam(name = "studentsData") String studentsData) {
        // Parse the JSON string representing the array of student data
        JSONArray studentsArray;
        try {
            studentsArray = new JSONArray(studentsData);
        } catch (JSONException e) {
            e.printStackTrace();
            return "Error parsing JSON data";
        }

        // Process each student's information
        
        for (int i = 0; i < studentsArray.length(); i++) {
            try {
                JSONObject studentObject = studentsArray.getJSONObject(i);
                String studentId = studentObject.getString("studentId");
                String subjectId = studentObject.getString("subjectId");
                String markValue = studentObject.getString("markValue");
                String insQry ="INSERT INTO `tbl_internalmark`(`internalmark_date`, `internalmark_mark`, `subject_id`, `student_id`) VALUES "
                        + "(curdate(),'"+studentId+"','"+subjectId+"','"+markValue+"')";
                con.executeCommand(insQry);
                System.out.println("Student ID: " + studentId);
                System.out.println("Subject ID: " + subjectId);
                System.out.println("Mark Value: " + markValue);
            } catch (JSONException e) {
                e.printStackTrace();
                // Handle JSON parsing error
                return "Error processing student data";
            }
        }
        

        // Return a success message or any relevant response
        return "Internal marks uploaded successfully";
    }

}
