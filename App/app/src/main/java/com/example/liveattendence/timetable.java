package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class timetable extends AppCompatActivity {

    TextView mondayhour1, mondayhour2, mondayhour3, mondayhour4, mondayhour5;

    TextView mondayclass1, mondayclass2, mondayclass3, mondayclass4, mondayclass5;

    TextView tuesdayhour1, tuesdayhour2, tuesdayhour3, tuesdayhour4, tuesdayhour5;

    TextView tuesdayclass1, tuesdayclass2, tuesdayclass3, tuesdayclass4, tuesdayclass5;
    TextView wednesdayhour1, wednesdayhour2, wednesdayhour3, wednesdayhour4, wednesdayhour5;
    TextView thuresdayhour1, thuresdayhour2, thuresdayhour3, thuresdayhour4, thuresdayhour5;
    TextView fridayhour1, fridayhour2, fridayhour3, fridayhour4, fridayhour5;

    String Day, Hour, Sname, Cname, Department, Subject;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_timetable);


        mondayhour1 = findViewById(R.id.textViewHour1Details);
        mondayhour2 = findViewById(R.id.textViewHour2Details);
        mondayhour3 = findViewById(R.id.textViewHour3Details);
        mondayhour4 = findViewById(R.id.textViewHour4Details);
        mondayhour5 = findViewById(R.id.textViewHour5Details);

        mondayclass1 = findViewById(R.id.textViewHour1class);
        mondayclass2 = findViewById(R.id.textViewHour2class);
        mondayclass3 = findViewById(R.id.textViewHour3class);
        mondayclass4 = findViewById(R.id.textViewHour4class);
        mondayclass5 = findViewById(R.id.textViewHour5class);

        tuesdayhour1 = findViewById(R.id.textViewHour1tuesday);
        tuesdayhour2 = findViewById(R.id.textViewHour2tuesday);
        tuesdayhour3 = findViewById(R.id.textViewHour3tuesday);
        tuesdayhour4 = findViewById(R.id.textViewHour4tuesday);
        tuesdayhour5 = findViewById(R.id.textViewHour5tuesday);


        SharedPreferences sharedPreferences = getSharedPreferences("faculty", MODE_PRIVATE);
        String id = sharedPreferences.getString("id", "");
        String deptid = sharedPreferences.getString("did", "");

        timetabledetails s = new timetabledetails();
        s.execute(id, deptid);
    }

    public class timetabledetails extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("timetabledetails");
            wb.addProperty("id", strings[0]);
            wb.addProperty("deptid", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            if (!s.equals("[]")) {
                JSONArray f = null;
                try {
                    f = new JSONArray(s);
                    JSONObject fo = f.getJSONObject(0);


//                    mondayhour1.setText(fo.getString("1Monday"));
//                    mondayclass1.setText(fo.getString("Monday1"));


                    mondayhour2.setText(fo.getString("2Monday"));
                    mondayclass2.setText(fo.getString("Monday2"));

//                    mondayhour3.setText(fo.getString("3Monday"));
//                    mondayclass3.setText(fo.getString("Monday3"));
//
//                    mondayhour4.setText(fo.getString("4Monday"));
//                    mondayclass4.setText(fo.getString("Monday4"));

                    mondayhour5.setText(fo.getString("5Monday"));
                    mondayclass5.setText(fo.getString("Monday5"));



                } catch (JSONException e) {
                    throw new RuntimeException(e);
                }

            }
        }


    }
}
