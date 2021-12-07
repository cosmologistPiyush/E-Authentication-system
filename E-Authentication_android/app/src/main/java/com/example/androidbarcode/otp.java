package com.example.androidbarcode;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.util.Random;
public class otp extends AppCompatActivity {

    Button b1;
    TextView t1;
    TextView t2;
    TextView t3;
    TextView t4;
    Button button;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_otp);
        b1=(Button)findViewById(R.id.b1);
        t1=(TextView)findViewById(R.id.t1);
        t2=(TextView)findViewById(R.id.t2);
        t3=(TextView)findViewById(R.id.t3);
        t4=(TextView)findViewById(R.id.t4);
        button=(Button) findViewById(R.id.b11);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Random r = new Random();

                t1.setText(String.valueOf(String.valueOf(r.nextInt(9)+1)));
                Random r1 = new Random();

                t2.setText(String.valueOf(String.valueOf(r1.nextInt(9)+1)));
                Random r2 = new Random();

                t3.setText(String.valueOf(String.valueOf(r2.nextInt(9)+1)));
                Random r3 = new Random();

                t4.setText(String.valueOf(String.valueOf(r3.nextInt(9)+1)));
            }
        });
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openMainActivity();
            }
        });
    }
    public void openMainActivity(){
        Intent intent= new Intent(this, MainActivity.class);
        startActivity(intent);
    }
}