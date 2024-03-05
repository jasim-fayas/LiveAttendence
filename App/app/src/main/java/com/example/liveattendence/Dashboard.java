package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class Dashboard extends AppCompatActivity {
   CardView cardmypro;
   CardView cardlogout,cardtimetable;
    CardView cardcomplaint,cardattendence;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);
        cardmypro = findViewById(R.id.card1);
        cardlogout = findViewById(R.id.card6);
        cardcomplaint = findViewById(R.id.card5);
        cardattendence = findViewById(R.id.card4);
        cardtimetable = findViewById(R.id.card3);
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
                    Intent attendence = new Intent(Dashboard.this , AddAttendence.class);
                    startActivity(attendence);
                }
            });

            cardtimetable.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent timetable = new Intent(Dashboard.this, timetable.class);
                    startActivity(timetable);
                }
            });
    }
}