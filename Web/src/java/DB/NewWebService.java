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
        String feedback = " insert into tbl_feedback_reply (feedback_id,feedback_reply) values ('"+id+"','"+feedbackreply+"')";
        out.print(feedback);
        
        if(con.executeCommand(feedback)){
            
            String feed = " update tbl_feedback set feedback_status='"+1+"' where feedback_id='"+ id  +"'";
            out.print(feed);
            con.executeCommand(feed);
            
            verdict = "Inserted";        }
        
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
        String complaintdetails = " select * from tbl_feedback p inner join tbl_student q on p.student_id=q.student_id inner join tbl_department r on q.department_id=r.department_id where feedback_status='"+id+"' and r.department_id='"+deptid+"' ORDER BY feedback_id DESC";
        ResultSet cd = con.selectCommand(complaintdetails);
        JSONArray c = new JSONArray();

        try {
            while (cd.next()) {
                String stuName = "Anonymous";
                if (cd.getInt("feedback_a_status") != 1) {
                    String getUser = " select * from tbl_student where student_id='"+cd.getString("student_id")+"'";
                    ResultSet user = con.selectCommand(getUser);
                    if(user.next())
                    {
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
        
        String timetableqry = "select * from tbl_timetable p inner join tbl_subject q on p.subject_id=q.subject_id inner join tbl_course r on q.course_id=r.course_id inner join tbl_assign s on p.subject_id=s.subject_id where s.faculty_id='"+id+"'  ";
       ResultSet time = con.selectCommand(timetableqry);
         JSONArray t = new JSONArray();
        JSONObject to = new JSONObject();
         try {
            while (time.next()) {
                
                to.put(time.getString("timetable_hour")+time.getString("timetable_day"), time.getString("subject_name"));
                to.put(time.getString("timetable_day")+time.getString("timetable_hour"), time.getString("course_name"));
               

            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.print(t.toString());
         t.put(to);
        return t.toString();
    }


}
