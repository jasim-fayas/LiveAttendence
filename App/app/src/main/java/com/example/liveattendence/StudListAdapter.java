package com.example.liveattendence;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

public class StudListAdapter extends RecyclerView.Adapter<StudListAdapter.MyViewHolder> {

    String Name[],Id[],subname;

    Context context;

    public StudListAdapter(Context ct, String[] studentname,String[] studentid,String SUBJECTname) {
        context = ct;
        Name = studentname;
        Id = studentid;
        subname = SUBJECTname;
    }

    @NonNull
    @Override
    public StudListAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.studentinternalmarl_design, parent, false);
        return new StudListAdapter.MyViewHolder(view);
    }
    @Override
    public int getItemCount() {
        return Name.length;
    }
    public class MyViewHolder extends RecyclerView.ViewHolder {

        //        ImageView propic;
        TextView studentnametext,subjectName;
        EditText mark;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            studentnametext = itemView.findViewById(R.id.studname);
            subjectName = itemView.findViewById(R.id.studSubject);
            mark = itemView.findViewById(R.id.markbox);

            // Set click listener for itemView

        }
}
    public void onBindViewHolder(@NonNull StudListAdapter.MyViewHolder holder, int position) {
//        Picasso.get().load(pic[position]).into(holder.propic);
        holder.studentnametext.setText(Name[position]);
        holder.subjectName.setText(subname);

    }

}
