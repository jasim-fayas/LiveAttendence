package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Attendance_spinner extends AppCompatActivity {

    Button find;
    Spinner cource, semester;
    ArrayAdapter<String> courceAdapter;
    ArrayAdapter<String> semesterAdapter;

    String Courceid[], CourceName[];
    String Semesterid[], SemesterName[];


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_attendance_spinner);
        find = findViewById(R.id.btnFind);
        cource = findViewById(R.id.cource);
        semester = findViewById(R.id.semester);

        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String id = sh.getString("did", "");




        CourceSpinner s = new CourceSpinner();
       s.execute(id);


        SemesterSpinner p = new SemesterSpinner();
        p.execute();



        find.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent attendance = new Intent(Attendance_spinner.this, AddAttendence.class);

                // Get the selected item positions from the spinners
                int coursePosition = cource.getSelectedItemPosition();
                int semesterPosition = semester.getSelectedItemPosition();

                // Get the corresponding IDs from your arrays
                String courseId = Courceid[coursePosition];
                String semesterId = Semesterid[semesterPosition];

                // Pass the IDs as extras to the next activity
                attendance.putExtra("COURSE_ID", courseId);
                attendance.putExtra("SEMESTER_ID", semesterId);

                // Start the next activity
                startActivity(attendance);
            }
        });


    }





    public class CourceSpinner extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("getcource");
            wb.addProperty("id", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute (String s){
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                Courceid = new String[j.length() + 1];
                CourceName = new String[j.length() + 1];
                CourceName[0] = "Select Course";
                Courceid[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    Courceid[i + 1] = jo.getString("cid");
                    CourceName[i + 1] = jo.getString("cname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            courceAdapter = new ArrayAdapter<String>(Attendance_spinner.this, android.R.layout.simple_spinner_item, CourceName);
            courceAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            cource.setAdapter(courceAdapter);

        }


    }

    public class SemesterSpinner extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("semester");

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute (String s){
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                Semesterid = new String[j.length() + 1];
                SemesterName = new String[j.length() + 1];
                SemesterName[0] = "Select semester";
                Semesterid[0] = "";
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    Semesterid[i + 1] = jo.getString("sid");
                    SemesterName[i + 1] = jo.getString("sname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            courceAdapter = new ArrayAdapter<String>(Attendance_spinner.this, android.R.layout.simple_spinner_item, CourceName);
            courceAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            cource.setAdapter(courceAdapter);

            semesterAdapter = new ArrayAdapter<String>(Attendance_spinner.this, android.R.layout.simple_spinner_item, SemesterName);
            semesterAdapter.setDropDownViewResource(android.R.layout.simple_spinner_item);
            semester.setAdapter(semesterAdapter);

        }


    }

}