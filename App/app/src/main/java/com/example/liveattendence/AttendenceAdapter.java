package com.example.liveattendence;





import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;


public class AttendenceAdapter extends RecyclerView.Adapter<AttendenceAdapter.MyViewHolder> {

    String Name[],Hour1[],Hour2[],Hour3[],Hour4[],Hour5[];

    Context context;
    private OnItemClickListener hour1ClickListener,hour2ClickListener,hour3ClickListener,hour4ClickListener,hour5ClickListener;

    // Setters for the listeners
    public void setHour1ClickListener(AttendenceAdapter.OnItemClickListener listener) {
        hour1ClickListener = listener;
    }
    public void setHour2ClickListener(AttendenceAdapter.OnItemClickListener listener){
        hour2ClickListener = listener;
    }
    public void setHour3ClickListener(AttendenceAdapter.OnItemClickListener listener){
        hour3ClickListener = listener;
    }
    public void setHour4ClickListener(AttendenceAdapter.OnItemClickListener listener){
        hour4ClickListener = listener;
    }
    public void setHour5ClickListener(AttendenceAdapter.OnItemClickListener listener){
        hour5ClickListener = listener;
    }
    public AttendenceAdapter(Context ct, String[] name,String[] hour1,String[] hour2,String[] hour3,String[] hour4,String[] hour5) {
        context = ct;
        Name = name;
        Hour1 = hour1;
        Hour2 = hour2;
        Hour3 = hour3;
        Hour4 = hour4;
        Hour5 = hour5;
    }



    @NonNull
    @Override
    public AttendenceAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.attendence_design, parent, false);
        return new AttendenceAdapter.MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull AttendenceAdapter.MyViewHolder holder, int position) {

        holder.nameText.setText(Name[position]);


        holder.hour1.setChecked(Hour1[position].equals("true"));
        holder.hour2.setChecked(Hour2[position].equals("true"));
        holder.hour3.setChecked(Hour3[position].equals("true"));
        holder.hour4.setChecked(Hour4[position].equals("true"));
        holder.hour5.setChecked(Hour5[position].equals("true"));


        holder.hour1.setOnClickListener(v -> {
            if (hour1ClickListener != null) {
                hour1ClickListener.onHour1Click(position);
            }
        });
        holder.hour2.setOnClickListener(v -> {
            if (hour2ClickListener != null){
                hour2ClickListener.onHour2Click(position);
            }
        });
        holder.hour3.setOnClickListener(v -> {
            if (hour3ClickListener != null){
                hour3ClickListener.onHour3Click(position);
            }
        });
        holder.hour4.setOnClickListener(v -> {
            if (hour4ClickListener != null){
                hour4ClickListener.onHour4Click(position);
            }
        });
        holder.hour5.setOnClickListener(v -> {
            if (hour5ClickListener != null){
                hour5ClickListener.onHour5Click(position);
            }
        });
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

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
            hour1.setOnClickListener(this);
            hour2.setOnClickListener(this);
            hour3.setOnClickListener(this);
            hour4.setOnClickListener(this);
            hour5.setOnClickListener(this);
        }

        public void onClick(View v) {
            if (v == hour1) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION && hour1ClickListener != null) {
                    hour1ClickListener.onHour1Click(position);
                }
            } else if (v == hour2) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION && hour2ClickListener != null){
                    hour2ClickListener.onHour2Click(position);
                }

            } else if (v == hour3) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION && hour3ClickListener != null){
                    hour3ClickListener.onHour3Click(position);
                }

            } else if (v == hour4) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION && hour4ClickListener != null){
                    hour4ClickListener.onHour4Click(position);
                }

            } else if (v == hour5) {
                int position = getAdapterPosition();
                if (position != RecyclerView.NO_POSITION && hour5ClickListener != null){
                    hour5ClickListener.onHour5Click(position);
                }

            }
        }
    }

    // Interface for item click events
    public interface OnItemClickListener {
        void onHour1Click(int position);
        void onHour2Click(int position);
        void onHour3Click(int position);
        void onHour4Click(int position);
        void onHour5Click(int position);
    }


}
