package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Profile extends AppCompatActivity {

    TextView nam, email, phone, password,mainnam, uname, subject;
    ImageView profile;

    String Name, Email, Phone, Password, Department, Subject;

    Button edit,home;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        nam = findViewById(R.id.profileName);
        email = findViewById(R.id.profileEmail);
        phone = findViewById(R.id.profileContact);
        password = findViewById(R.id.profilePassword);
        mainnam = findViewById(R.id.titleName);
        uname = findViewById(R.id.titleUsername);
        edit = findViewById(R.id.editButton);
        home = findViewById(R.id.calllhomepage);
//        department = findViewById(R.id.departmentname);
//        subject = findViewById(R.id.subjectsname);

        edit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent editbutton = new Intent(Profile.this, EditProfile.class);
                startActivity(editbutton);
            }
        });

        home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent homebutton = new Intent(Profile.this , Dashboard.class);
                startActivity(homebutton);
            }
        });







        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String id = sh.getString("id", "");
        Log.d("err",id);
        Mypro s = new Mypro();
        s.execute(id);


    }

    public class Mypro extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("Mypro");


            wb.addProperty("id", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

            @Override
            protected void onPostExecute (String s){
                super.onPostExecute(s);
              //  Toast.makeText(Profile.this, s, Toast.LENGTH_SHORT).show();

                if (!s.equals("[]")) {
                    JSONArray f = null;
                    try {
                        f = new JSONArray(s);
                        JSONObject fo = f.getJSONObject(0);
                      //  Toast.makeText(Profile.this, s , Toast.LENGTH_SHORT).show();


                         Name = fo.getString("name");
                         Email = fo.getString("email");
                         Phone = fo.getString("contact");
                         Password = fo.getString("pass");


                        nam.setText(Name);
                        email.setText(Email);
                        phone.setText(Phone);
                        password.setText(Password);
                        mainnam.setText(Name);
                        uname.setText(Email);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }


                }
            }


        }

    }
