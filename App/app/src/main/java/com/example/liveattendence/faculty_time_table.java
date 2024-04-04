package com.example.liveattendence;

import androidx.appcompat.app.AppCompatActivity;
import android.webkit.WebSettings;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class faculty_time_table extends AppCompatActivity {

    WebView webview;
    private String Url,Id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_faculty_time_table);

        SharedPreferences sh = getSharedPreferences("faculty", MODE_PRIVATE);
        Id = sh.getString("id", "");
        WebServiceCaller wb = new WebServiceCaller();


        Url = "http://"+wb.getIp()+":8084/LiveAttendence/AllottedHours.jsp?id="+Id;

        webview = findViewById(R.id.timetablewebview);

        WebSettings webSettings = webview.getSettings();
        webSettings.setSupportZoom(true);
        webSettings.setBuiltInZoomControls(true);
        webSettings.setDisplayZoomControls(false);

        // Set initial scale (zoom) here
        webview.setInitialScale(190); // Adjust the scale factor as needed

        webview.loadUrl(Url);

        webview.getSettings().setJavaScriptEnabled(true);
        webview.setWebViewClient(new WebViewClient()
        {
            public boolean shouldOverrideUrlLoading(WebView view , String url){

                view.loadUrl(url);
                return true;
            }
        });

    }

    @Override
    public void onBackPressed() {

        if(webview.canGoBack())
        {
            webview.goBack();
        }
        else
            super.onBackPressed();
    }
}