package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AddinternalMark extends AppCompatActivity {

    RecyclerView studRecycler;

    String studentname[],studentid[],SUBJECT[],Name;
    TextView did;
    Button submit;

String subId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_addinternal_mark);

        did = findViewById(R.id.didname);
        studRecycler = findViewById(R.id.studrecyclerview);
        submit = findViewById(R.id.btnaddmark);


        Intent intent = getIntent();
        String SUBJECTname = intent.getStringExtra("name");
        String sname = intent.getStringExtra("semname");
        subId = intent.getStringExtra("subid");

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

                StudListAdapter studlistadapter = new StudListAdapter(AddinternalMark.this, studentname);
                studRecycler.setAdapter(studlistadapter);
                studRecycler.setLayoutManager(new LinearLayoutManager(AddinternalMark.this));
                submit.setOnClickListener(v -> {
                    StudListAdapter adapter = (StudListAdapter) studRecycler.getAdapter();
                    if (adapter != null) {
                        JSONArray studentsData = new JSONArray();
                        for (int i = 0; i < adapter.getItemCount(); i++) {
                            RecyclerView.ViewHolder viewHolder = studRecycler.findViewHolderForAdapterPosition(i);
                            if (viewHolder instanceof StudListAdapter.MyViewHolder) {
                                StudListAdapter.MyViewHolder myViewHolder = (StudListAdapter.MyViewHolder) viewHolder;
                                EditText markEditText = myViewHolder.itemView.findViewById(R.id.markbox);
                                String markValue = markEditText.getText().toString().trim();
                                if (!markValue.isEmpty()) {
                                    JSONObject studentData = new JSONObject();
                                    try {
                                        studentData.put("studentId", studentid[i]);
                                        studentData.put("subjectId", subId);
                                        studentData.put("markValue", markValue);
                                    } catch (JSONException e) {
                                        e.printStackTrace();
                                    }
                                    studentsData.put(studentData);
                                } else {
                                    Toast.makeText(AddinternalMark.this, "Mark cannot be empty", Toast.LENGTH_SHORT).show();
                                }
                            }
                        }
                        uploadData(studentsData);
                    } else {
                        Toast.makeText(AddinternalMark.this, "Adapter is null", Toast.LENGTH_SHORT).show();
                    }
                });



            }
        }

    @SuppressLint("StaticFieldLeak")
    private void uploadData(JSONArray studentsData) {
        new AsyncTask<Void, Void, String>() {
            @Override
            protected String doInBackground(Void... voids) {
                // Make the web service call with studentsData
                WebServiceCaller wb = new WebServiceCaller();
                wb.setSoapObject("UploadInternalMark");
                wb.addProperty("studentsData", studentsData.toString());
                wb.callWebService();
                return wb.getResponse();
            }

            @Override
            protected void onPostExecute(String response) {
                super.onPostExecute(response);
                // Handle the response from the web service
                Log.d("ButtonClick", response);
                // You might want to display the response to the user or handle it in some other way
                // Toast.makeText(AddinternalMark.this, response, Toast.LENGTH_SHORT).show();
            }
        }.execute();
    }


}

