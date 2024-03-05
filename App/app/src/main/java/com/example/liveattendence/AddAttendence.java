package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.AsyncTask;
import android.os.Bundle;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AddAttendence extends AppCompatActivity {

    RecyclerView attendenceRycycler;
    String name[], id[];


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_attendence);

        attendenceRycycler = findViewById(R.id.attendencerecycler);

        AddAttendenceddetails s = new AddAttendenceddetails();
        s.execute();

    }

    public class AddAttendenceddetails extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("AddAttendenceddetails");
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

                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);

                    name[i] = jo.getString("name");
                    id[i] = jo.getString("id");

                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            AttendenceAdapter attendenceAdapter = new AttendenceAdapter(AddAttendence.this, name, id);

            attendenceRycycler.setAdapter(attendenceAdapter);
            attendenceRycycler.setLayoutManager(new LinearLayoutManager(AddAttendence.this));
        }


    }
}