package com.example.liveattendence;
import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class StudListAdapter extends RecyclerView.Adapter<StudListAdapter.MyViewHolder> {

    private ArrayList<String> editTextValues;
    private ArrayList<Integer> editTextPositions;
    String Name[];

    private Context context;

    public StudListAdapter(Context ct, String name[]) {
        context = ct;
        Name=name;

        editTextValues = new ArrayList<>();
        editTextPositions = new ArrayList<>();
        for (int i = 0; i < Name.length; i++) {
            editTextValues.add("");
            editTextPositions.add(i);
        }
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.studentinternalmarl_design, parent, false);
        return new MyViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        holder.TextName.setText(Name[position]);
        // Set the EditText value from the list if available
        if (position < editTextValues.size()) {
            holder.editMark.setText(editTextValues.get(position));
        } else {
            holder.editMark.setText("");
        }

        holder.editMark.setOnFocusChangeListener((view, hasFocus) -> {
            if (!hasFocus) {
                String value = holder.editMark.getText().toString();
                int editTextPosition = holder.getAdapterPosition();
                updateEditTextValue(editTextPosition, value);
            }
        });
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }


    public void updateEditTextValue(int position, String value) {
        if (position < editTextValues.size()) {
            editTextValues.set(position, value);
        } else {
            editTextValues.add(value);
        }
    }

    public ArrayList<String> getEditTextValues() {
        // Filter out empty values from editTextValues list
        ArrayList<String> filteredValues = new ArrayList<>();
        for (String value : editTextValues) {
            if (!value.isEmpty()) {
                filteredValues.add(value);
            }
        }
        return filteredValues;
    }


    public ArrayList<Integer> getEditTextPositions() {
        return editTextPositions;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView TextName;
        EditText editMark;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            TextName = itemView.findViewById(R.id.studname);
            editMark = itemView.findViewById(R.id.markbox);
        }
    }
}