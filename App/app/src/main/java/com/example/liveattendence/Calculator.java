package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class Calculator extends AppCompatActivity {

    Button adda,addi,addu,adde,next;
    EditText no1,no2,result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calculator);

        next=findViewById(R.id.b5);
        adde=findViewById(R.id.div);
        addi=findViewById(R.id.mul);
        addu=findViewById(R.id.sub);
        adda=findViewById(R.id.add);
        no1=findViewById(R.id.no1);
        no2=findViewById(R.id.no2);
        result=findViewById(R.id.result);


adda.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        int a = Integer.parseInt(String.valueOf(no1.getText()));
        int b = Integer.parseInt(String.valueOf(no2.getText()));
        int c = a+b;
        result.setText(String.valueOf(c));
    }
});

addu.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
int a = Integer.parseInt(String.valueOf(no1.getText()));
        int b = Integer.parseInt(String.valueOf(no2.getText()));
        int c = a-b;
        result.setText(String.valueOf(c));
    }
});

addi.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        int a = Integer.parseInt(String.valueOf(no1.getText()));
        int b = Integer.parseInt(String.valueOf(no2.getText()));
        int c = a*b;
        result.setText(String.valueOf(c));
    }
});

adde.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        int a = Integer.parseInt(String.valueOf(no1.getText()));
        int b = Integer.parseInt(String.valueOf(no2.getText()));
        int c = a/b;
        result.setText(String.valueOf(c));
    }
});

next.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
         Intent i = new Intent(Calculator.this,larger.class);
         startActivity(i);
    }
});
    }
}