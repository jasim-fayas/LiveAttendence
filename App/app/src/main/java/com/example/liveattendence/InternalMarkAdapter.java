package com.example.liveattendence;

import androidx.recyclerview.widget.RecyclerView;


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

public class InternalMarkAdapter extends RecyclerView.Adapter<InternalMarkAdapter.MyViewHolder> {

    String sNamer[],semNamer[],snameid[],semNameid[],DEname[];
    Context context;

     static OnItemClickListener itemClickListener;

    public InternalMarkAdapter(Context ct, String[] subjectname,String[] subjectid,String[] semestername,String[] semesterid,String[] deptnames) {
        context = ct;
        sNamer = subjectname;
        snameid =subjectid;
        semNamer = semestername;
        semNameid = semesterid;
        DEname = deptnames;

    }
    public static void setOnItemClickListener(InternalMarkAdapter.OnItemClickListener listener) {
        itemClickListener = listener;
    }


    @NonNull
    @Override
    public InternalMarkAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.internalmark_design, parent, false);
        return new InternalMarkAdapter.MyViewHolder(view);
    }
    @Override
    public int getItemCount() {
        return sNamer.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

        //        ImageView propic;
        TextView subjecttext,semestertext;
        TextView namedept;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            subjecttext =  itemView.findViewById(R.id.FacultySubject);
            semestertext = itemView.findViewById(R.id.facultysubjectsemester);
            namedept = itemView.findViewById(R.id.textViewdeptName);


//             Set click listener for itemView
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
    public void onBindViewHolder(@NonNull InternalMarkAdapter.MyViewHolder holder, int position) {
//        Picasso.get().load(pic[position]).into(holder.propic);
        holder.subjecttext.setText(sNamer[position]);
        holder.semestertext.setText(semNamer[position]);
        holder.namedept.setText(DEname[position]);


    }

//     Interface for item click events
    public interface OnItemClickListener {
        void onItemClick(int position);
    }
}