package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AddinternalMark extends AppCompatActivity {

    RecyclerView studRecycler;

    String studentname[],studentid[],SUBJECT[];





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_addinternal_mark);


        studRecycler = findViewById(R.id.studrecyclerview);


        Intent intent = getIntent();
        String SUBJECTname = intent.getStringExtra("name");
        String sname = intent.getStringExtra("semname");
        String subId = intent.getStringExtra("subid");

        Toast.makeText(AddinternalMark.this, subId, Toast.LENGTH_LONG).show();

        getstudwithsu s = new getstudwithsu(SUBJECTname);
        s.execute(subId);

    }

    public class getstudwithsu extends AsyncTask<String, String, String> {
        private String subjectName; // New variable to store SUBJECTname

        // Constructor to receive SUBJECTname
        public getstudwithsu(String subjectName) {
            this.subjectName = subjectName;
        }
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("getstudwithsubjects");
            wb.addProperty("subId", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Toast.makeText(AddinternalMark.this, s, Toast.LENGTH_LONG).show();
            JSONArray j = null;
            try {
                j = new JSONArray(s);

                studentname = new String[j.length()];
                studentid = new String[j.length()];


                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);

                    studentname[i] = jo.getString("stuname");
                    studentid[i] = jo.getString("stuid");


                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

        StudListAdapter studlistadapter = new StudListAdapter(AddinternalMark.this,studentname,studentid,subjectName);
            studRecycler.setAdapter(studlistadapter);
            studRecycler.setLayoutManager(new LinearLayoutManager(AddinternalMark.this));




        }}
}