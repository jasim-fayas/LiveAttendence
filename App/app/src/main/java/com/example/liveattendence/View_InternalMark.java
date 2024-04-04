package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.ArrayAdapter;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.jar.Attributes;

public class View_InternalMark extends AppCompatActivity {

    RecyclerView internalmarkrecycler;
    String subjectname[], subjectid[], semestername[], semesterid[],dpnames[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_internal_mark);

        internalmarkrecycler = findViewById(R.id.internalRecyclerView);


        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String fid = sh.getString("id", "");
        String id = sh.getString("did", "");

        subjectsview s = new subjectsview();
        s.execute(fid);


    }


    public class subjectsview extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("subjectsandsemester");
            wb.addProperty("fid", strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                subjectname = new String[j.length()];
                subjectid = new String[j.length()];
                semestername = new String[j.length()];
                semesterid = new String[j.length()];
                dpnames = new String[j.length()];

                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);

                    subjectname[i] = jo.getString("sname");
                    subjectid[i] = jo.getString("sid");
                    semestername[i] = jo.getString("semname");
                    semesterid[i] = jo.getString("semid");
                    dpnames[i]=jo.getString("dpname");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            InternalMarkAdapter internalMarkAdapter = new InternalMarkAdapter(View_InternalMark.this, subjectname, subjectid, semestername, semesterid,dpnames);
            InternalMarkAdapter.setOnItemClickListener(new InternalMarkAdapter.OnItemClickListener() {
                @Override
                public void onItemClick(int position) {
                    Intent i = new Intent(View_InternalMark.this, AddinternalMark.class);
                    i.putExtra("name",subjectname[position]);
                    i.putExtra("semname", semestername[position]);
                    i.putExtra("subid", subjectid[position]);


                    startActivity(i);
                }
            });


            internalmarkrecycler.setAdapter(internalMarkAdapter);
            internalmarkrecycler.setLayoutManager(new LinearLayoutManager(View_InternalMark.this));

        }


    }


            }
