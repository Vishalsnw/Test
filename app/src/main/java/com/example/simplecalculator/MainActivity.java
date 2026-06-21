package com.example.simplecalculator;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    EditText editText1, editText2;
    Button buttonAdd, buttonSubtract, buttonMultiply, buttonDivide;
    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editText1 = findViewById(R.id.editText1);
        editText2 = findViewById(R.id.editText2);
        buttonAdd = findViewById(R.id.button_add);
        buttonSubtract = findViewById(R.id.button_subtract);
        buttonMultiply = findViewById(R.id.button_multiply);
        buttonDivide = findViewById(R.id.button_divide);
        textView = findViewById(R.id.textView);

        buttonAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String num1 = editText1.getText().toString();
                String num2 = editText2.getText().toString();
                if (num1.isEmpty() || num2.isEmpty()) {
                    textView.setText("Please enter both numbers");
                    return;
                }
                double result = Double.parseDouble(num1) + Double.parseDouble(num2);
                textView.setText(String.valueOf(result));
            }
        });

        buttonSubtract.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String num1 = editText1.getText().toString();
                String num2 = editText2.getText().toString();
                if (num1.isEmpty() || num2.isEmpty()) {
                    textView.setText("Please enter both numbers");
                    return;
                }
                double result = Double.parseDouble(num1) - Double.parseDouble(num2);
                textView.setText(String.valueOf(result));
            }
        });

        buttonMultiply.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String num1 = editText1.getText().toString();
                String num2 = editText2.getText().toString();
                if (num1.isEmpty() || num2.isEmpty()) {
                    textView.setText("Please enter both numbers");
                    return;
                }
                double result = Double.parseDouble(num1) * Double.parseDouble(num2);
                textView.setText(String.valueOf(result));
            }
        });

        buttonDivide.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String num1 = editText1.getText().toString();
                String num2 = editText2.getText().toString();
                if (num1.isEmpty() || num2.isEmpty()) {
                    textView.setText("Please enter both numbers");
                    return;
                }
                double n2 = Double.parseDouble(num2);
                if (n2 == 0) {
                    textView.setText("Cannot divide by zero");
                    return;
                }
                double result = Double.parseDouble(num1) / n2;
                textView.setText(String.valueOf(result));
            }
        });
    }
}
