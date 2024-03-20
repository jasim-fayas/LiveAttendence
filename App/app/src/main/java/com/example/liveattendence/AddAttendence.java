package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AddAttendence extends AppCompatActivity implements AttendenceAdapter.OnItemClickListener{

    RecyclerView attendenceRycycler;
    String name[], id[],hour1[],hour2[],hour3[],hour4[],hour5[];

    String  h1="1";
    String h2="2";




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_attendence);

        attendenceRycycler = findViewById(R.id.attendencerecycler);



        Intent intent = getIntent();
        String cid = intent.getStringExtra("COURSE_ID");
        String sid = intent.getStringExtra("SEMESTER_ID");

        Toast.makeText(AddAttendence.this, cid, Toast.LENGTH_SHORT).show();

        AddAttendenceddetails s = new AddAttendenceddetails();
        s.execute(cid,sid);

    }
    public class insertAttendece extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("AddAttendance");
            wb.addProperty("sid", strings[0]);
            wb.addProperty("fid", strings[1]);
            wb.addProperty("hour", strings[2]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(AddAttendence.this, s, Toast.LENGTH_LONG).show();



        }


    }


    public class AddAttendenceddetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("student");
            wb.addProperty("cid", strings[0]);
            wb.addProperty("sid", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);

                name = new String[j.length()];
                id = new String[j.length()];
                hour1 = new String[j.length()];
                hour2 = new String[j.length()];
                hour3 = new String[j.length()];
                hour4 = new String[j.length()];
                hour5 = new String[j.length()];

                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);

                    name[i] = jo.getString("name");
                    id[i] = jo.getString("id");
                    hour1[i] = jo.getString("hour1");
                    hour2[i] = jo.getString("hour2");
                    hour3[i] = jo.getString("hour3");
                    hour4[i] = jo.getString("hour4");
                    hour5[i] = jo.getString("hour5");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            AttendenceAdapter attendenceAdapter = new AttendenceAdapter(AddAttendence.this, name,hour1,hour2,hour3,hour4,hour5);
            attendenceAdapter.setHour1ClickListener((AttendenceAdapter.OnItemClickListener) AddAttendence.this);
            attendenceAdapter.setHour2ClickListener((AttendenceAdapter.OnItemClickListener) AddAttendence.this);
            attendenceAdapter.setHour3ClickListener((AttendenceAdapter.OnItemClickListener) AddAttendence.this);
            attendenceAdapter.setHour4ClickListener((AttendenceAdapter.OnItemClickListener) AddAttendence.this);
            attendenceAdapter.setHour5ClickListener((AttendenceAdapter.OnItemClickListener) AddAttendence.this);
            attendenceRycycler.setAdapter(attendenceAdapter);
            attendenceRycycler.setLayoutManager(new LinearLayoutManager(AddAttendence.this));
        }


    }
    @Override
    public void onHour1Click(int position) {
        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String fid = sh.getString("did", "");

        insertAttendece ins = new insertAttendece();
        ins.execute(id[position],fid,"1");
    }
    @Override
    public void onHour2Click(int position){
        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String fid = sh.getString("did", "");

        insertAttendece ins = new insertAttendece();
        ins.execute(id[position],fid,"2");
    }
    @Override
    public void onHour3Click(int position){
        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String fid = sh.getString("did", "");

        insertAttendece ins = new insertAttendece();
        ins.execute(id[position],fid,"3");
    }
    @Override
    public void onHour4Click(int position){
        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String fid = sh.getString("did", "");

        insertAttendece ins = new insertAttendece();
        ins.execute(id[position],fid,"4");
    }
    @Override
    public void onHour5Click(int position){
        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String fid = sh.getString("did", "");

        insertAttendece ins = new insertAttendece();
        ins.execute(id[position],fid,"5");
    }
}