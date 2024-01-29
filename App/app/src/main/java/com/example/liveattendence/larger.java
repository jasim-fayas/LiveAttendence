package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class larger extends AppCompatActivity {

    Button b1,b2;

    EditText no1,no2,no3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_larger);

        b1=findViewById(R.id.b1);
        b2=findViewById(R.id.b2);
        no1=findViewById(R.id.no1);
        no2=findViewById(R.id.no2);
        no3=findViewById(R.id.no3);

        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a = Integer.parseInt(String.valueOf(no1.getText()));
                int b = Integer.parseInt(String.valueOf(no2.getText()));
                if(a>b)
                {
                    no3.setText(String.valueOf(a));
                }else{
                    no3.setText(String.valueOf(a));
                }
            }


        });
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int a = Integer.parseInt(String.valueOf(no1.getText()));
                int b = Integer.parseInt(String.valueOf(no2.getText()));
                if(a>b)
                {
                    no3.setText(String.valueOf(b));
                }else{
                    no3.setText(String.valueOf(a));
                }
            }

        });

    }}
