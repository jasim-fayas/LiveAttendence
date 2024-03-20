package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.content.Intent;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import android.os.AsyncTask;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
public class Login extends AppCompatActivity {

TextView callsignup;
Button calldashboard;
    CheckBox rememberMeCheckbox;

    EditText email,password;
    String Email,Password,id,name,status,deptid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_login);

callsignup = findViewById(R.id.signupText);
        rememberMeCheckbox = findViewById(R.id.rememberMeCheckbox);
// Check if user is already logged in
        SharedPreferences sharedPreferences = getSharedPreferences("login", MODE_PRIVATE);
        boolean isLoggedIn = sharedPreferences.getBoolean("isLoggedIn", false);
        if (isLoggedIn) {
            // User is already logged in, navigate to dashboard
            startActivity(new Intent(Login.this, Dashboard.class));
            finish(); // Finish login activity to prevent going back to it on back press
        }

        callsignup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Login.this, SignUp.class);
                startActivity(intent);
            }
        });

        email = findViewById(R.id.username);
        password = findViewById(R.id.password);





        calldashboard = findViewById(R.id.loginButton);
        calldashboard.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String emailText = email.getText().toString();
                String passwordText = password.getText().toString();
                boolean rememberMeChecked = rememberMeCheckbox.isChecked();

                LoginDetails loginDetails = new LoginDetails();
                loginDetails.execute(emailText, passwordText);

                // Save login state if "Remember Me" checkbox is checked
                if (rememberMeChecked) {
                    SharedPreferences.Editor editor = getSharedPreferences("login", MODE_PRIVATE).edit();
                    editor.putBoolean("isLoggedIn", true);
                    editor.apply();
                }

            }
        });

            }

    @Override
    public void onBackPressed() {
        new AlertDialog.Builder(this)
                .setTitle("Exit App")
                .setMessage("Are you sure you want to exit?")
                .setPositiveButton("Yes", (dialog, which) -> finishAffinity()) // Close the app
                .setNegativeButton("No", null) // Do nothing
                .show();
    }
    public class LoginDetails extends AsyncTask<String, String, String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller();
            wb.setSoapObject("LoginDetails");
//          Log.d("TAG", strings[0]);
            wb.addProperty("email", strings[0]);
            wb.addProperty("password", strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            //Toast.makeText(Login.this, s, Toast.LENGTH_SHORT).show();
            Log.d("Error", s);
            Log.d("string","java.net.ConnectException: Failed to connect to /"+WebServiceCaller.ip+":8084");
            if (!s.equals("[]") && !s.equals("java.net.ConnectException: Failed to connect to /"+WebServiceCaller.ip+":8084")) {
                JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);
                    id = jo.getString("id");
                    name = jo.getString("name");
                    status = jo.getString("status");
                    deptid = jo.getString("deptid");

                   Toast.makeText(Login.this, "success", Toast.LENGTH_SHORT).show();


                    SharedPreferences.Editor sh = getSharedPreferences("faculty", MODE_PRIVATE).edit();
                    sh.putString("id", id);
                    sh.putString("name", name);
                    sh.putString("did" , deptid);
                    sh.apply();

                } catch (JSONException e) {
                    e.printStackTrace();
                }

                Intent i=new Intent(Login.this,Dashboard.class);
                startActivity(i);


            } else {
                Toast.makeText(Login.this, "failed", Toast.LENGTH_SHORT).show();

            }
        }


    }
}

