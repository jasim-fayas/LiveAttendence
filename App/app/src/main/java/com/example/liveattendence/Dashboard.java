package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

public class Dashboard extends AppCompatActivity {
   CardView cardmypro;
   CardView cardlogout,cardtimetable;
    CardView cardcomplaint,cardattendence,cardinternalmark;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);


        cardmypro = findViewById(R.id.card1);
        cardlogout = findViewById(R.id.card6);
        cardcomplaint = findViewById(R.id.card5);
        cardattendence = findViewById(R.id.card4);
        cardtimetable = findViewById(R.id.card3);
        cardinternalmark = findViewById(R.id.card2);

        cardmypro.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Dashboard.this, Profile.class);
                startActivity(i);
            }

        });

        cardlogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
               clearSession();
                Intent logout = new Intent(Dashboard.this, Login.class);
                startActivity(logout);
            }
        });
            cardcomplaint.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent complaint = new Intent(Dashboard.this, ViewComplaint.class);
                    startActivity(complaint);
                }
            });

            cardattendence.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent attendence = new Intent(Dashboard.this , Attendance_spinner.class);
                    startActivity(attendence);
                }
            });

            cardtimetable.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent timetable = new Intent(Dashboard.this, faculty_time_table.class);
                    startActivity(timetable);
                }
            });
        cardinternalmark.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent internal = new Intent(Dashboard.this, View_InternalMark.class);
                startActivity(internal);
            }
        });

    }

    private void clearSession() {
        SharedPreferences.Editor login = getSharedPreferences("login", MODE_PRIVATE).edit();
        login.clear();
        login.apply();
        SharedPreferences.Editor editor = getSharedPreferences("faculty", MODE_PRIVATE).edit();
        editor.clear();
        editor.apply();
    }
}