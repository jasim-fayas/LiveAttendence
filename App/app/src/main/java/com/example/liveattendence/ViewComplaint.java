package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ViewComplaint extends AppCompatActivity {

    RecyclerView recyclerView;
    String name[],details[],title[],id[];



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_complaint);

        recyclerView=findViewById(R.id.recyclerview);

        // Retrieve SharedPreferences object
        SharedPreferences sharedPreferences = getSharedPreferences("faculty", MODE_PRIVATE);

// Retrieve values using keys
        String fid = sharedPreferences.getString("id", "");
//        String name = sharedPreferences.getString("name", "");
        String deptid = sharedPreferences.getString("did", "");

// Use the retrieved values



        ViewComplaint.ComplaintDetails s = new ViewComplaint.ComplaintDetails();
        s.execute(fid,deptid);

    }
    public class ComplaintDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("ComplaintDetails");
            wb.addProperty("fid", strings[0]);
            wb.addProperty("deptid", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute (String s){
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                title = new String[j.length()];
                details = new String[j.length()];
                name = new String[j.length()];
                id = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    title[i] = jo.getString("title");
                    details[i] = jo.getString("details");
                    name[i] = jo.getString("name");
                    id[i] = jo.getString("id");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            ComplaintAdapter complaintAdapter = new ComplaintAdapter(ViewComplaint.this,title,details,name);
            complaintAdapter.setOnItemClickListener(new ComplaintAdapter.OnItemClickListener() {
                @Override
                public void onItemClick(int position) {
                    Intent i = new Intent(ViewComplaint.this, Complaint_reply.class);
                 i.putExtra("id",id[position]);
                 i.putExtra("title", title[position]);
                 i.putExtra("content", details[position]);
                 i.putExtra("studentname", name[position]);

                    startActivity(i);
                }
            });

            recyclerView.setAdapter(complaintAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(ViewComplaint.this));
        }



    }

    }