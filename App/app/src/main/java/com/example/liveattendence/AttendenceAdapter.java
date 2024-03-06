package com.example.liveattendence;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.CheckBox;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class AttendenceAdapter extends RecyclerView.Adapter<AttendenceAdapter.MyViewHolder> {

    String name[], id[];
    Context context;

    ComplaintAdapter.OnItemClickListener itemClickListener;

    public AttendenceAdapter(Context ct, String nameData[], String idData[]) {
        context = ct;
        name = nameData;
        id = idData;

    }
    // Setter method for click listener
    public void setOnItemClickListener(ComplaintAdapter.OnItemClickListener listener) {
        itemClickListener = listener;
    }

    @NonNull
    @Override
    public AttendenceAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.attendence_design, parent, false);
        return new AttendenceAdapter.MyViewHolder(view);
    }
    @Override
    public int getItemCount() {
        return name.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        //        ImageView propic;
        TextView nameText;
        CheckBox hour1,hour2,hour3,hour4,hour5;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            nameText = itemView.findViewById(R.id.textViewStudentName);
            hour1 = itemView.findViewById(R.id.checkBoxHour1);
            hour2 = itemView.findViewById(R.id.checkBoxHour2);
            hour3 = itemView.findViewById(R.id.checkBoxHour3);
            hour4 = itemView.findViewById(R.id.checkBoxHour4);
            hour5 = itemView.findViewById(R.id.checkBoxHour5);

            // Set click listener for itemView
            itemView.setOnClickListener(this);
        }

        @Override
        public void onClick(View v) {
            if (itemClickListener != null) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION) {
                    itemClickListener.onItemClick(position);
                }
            }
        }
    }

    @Override
    public void onBindViewHolder(@NonNull AttendenceAdapter.MyViewHolder holder, int position) {
//        Picasso.get().load(pic[position]).into(holder.propic);
        holder.nameText.setText(name[position]);
    }

    // Interface for item click events
    public interface OnItemClickListener {
        void onItemClick(int position);
    }
}

