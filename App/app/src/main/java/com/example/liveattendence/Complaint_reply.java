package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Complaint_reply extends AppCompatActivity {

    TextView title,content,name,id;
    EditText reply;
    Button sent;

    String Reply;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_complaint_reply);

   title = findViewById(R.id.titleViewreply);
    reply = findViewById(R.id.editReply);
    sent = findViewById(R.id.buttonsent);
    name = findViewById(R.id.nameViewreply);
    content = findViewById(R.id.detailsViewreply);


        Intent intent = getIntent();
        String Id = intent.getStringExtra("id");
        String Title = intent.getStringExtra("title");
        String Content = intent.getStringExtra("content");
        String Name = intent.getStringExtra("studentname");
       Toast.makeText(Complaint_reply.this, Content, Toast.LENGTH_SHORT).show();

        name.setText(Name);
        title.setText(Title);
       content.setText(Content);
        sent.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Reply=reply.getText().toString();
                FeedbackReply l = new FeedbackReply();
                l.execute(Id,Reply);
//                Toast.makeText(Complaint_reply.this, Reply , Toast.LENGTH_SHORT).show();

            }
        });
    }
public class FeedbackReply extends  AsyncTask<String, String, String> {

    @Override
    protected String doInBackground(String... strings) {
        WebServiceCaller wb = new WebServiceCaller();
        wb.setSoapObject("FeedbackReply");
//          Log.d("TAG", strings[0]);
        wb.addProperty("id", strings[0]);
        wb.addProperty("feedbackreply", strings[1]);
        wb.callWebService();
        return wb.getResponse();
    }


    @Override
    protected void onPostExecute(String s) {
        super.onPostExecute(s);
        //Toast.makeText(Login.this, s, Toast.LENGTH_SHORT).show();
        if (!s.equals("[]")) {

            Toast.makeText(Complaint_reply.this, s , Toast.LENGTH_SHORT).show();

            Intent i=new Intent(Complaint_reply.this,ViewComplaint.class);
            startActivity(i);


            }
            }

//            Intent i=new Intent(Login.this,Dashboard.class);
//            startActivity(i);



//
        }
    }





