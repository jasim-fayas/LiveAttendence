package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

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

public class EditProfile extends AppCompatActivity {

    EditText nam, email, password,contact;

    String Name, Email, Password, Contact,  NameE, EmailE, PasswordE, ContactE;

    Button save;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);


        nam = findViewById(R.id.editName);
        email = findViewById(R.id.editEmail);
        password = findViewById(R.id.editPassword);
        contact = findViewById(R.id.editContact1);
        save = findViewById(R.id.saveButton);

        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        String id = sh.getString("id", "");
        Log.d("err", id);

        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                NameE = nam.getText().toString();
                EmailE = email.getText().toString();

                ContactE =  contact.getText().toString();
                PasswordE = password.getText().toString();
                FacultyUpdate fu = new FacultyUpdate();
                fu.execute(id,NameE,EmailE,ContactE,PasswordE);
            }
        });



        GetData s = new GetData();
        s.execute(id);
    }

    public class FacultyUpdate extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("FacultyUpdate");
            wb.addProperty("id", strings[0]);
            wb.addProperty("name", strings[1]);
            wb.addProperty("email", strings[2]);
            wb.addProperty("contact", strings[3]);
            wb.addProperty("password", strings[4]);


            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            Toast.makeText(EditProfile.this, s, Toast.LENGTH_SHORT).show();
            Intent gotoprofile = new Intent(EditProfile.this , Profile.class);
            startActivity(gotoprofile);

        }


    }

    public class GetData extends AsyncTask<String, String, String> {

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
                 Toast.makeText(EditProfile.this, s, Toast.LENGTH_LONG).show();

                if (!s.equals("[]")) {
                    JSONArray f = null;
                    try {
                        f = new JSONArray(s);
                        JSONObject fo = f.getJSONObject(0);
                        //  Toast.makeText(Profile.this, s , Toast.LENGTH_SHORT).show();

                        Password = fo.getString("pass");
                        Contact = fo.getString("contact");
                        Name = fo.getString("name");
                        Email = fo.getString("email");




                        nam.setText(Name);
                        password.setText(Password);
                        contact.setText(Contact);
                        email.setText(Email);

                    } catch (JSONException e) {
                        e.printStackTrace();
                    }


                }
            }


        }

    }