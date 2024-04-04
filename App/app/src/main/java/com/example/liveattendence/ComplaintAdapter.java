package com.example.liveattendence;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;


public class ComplaintAdapter extends RecyclerView.Adapter<ComplaintAdapter.MyViewHolder> {

    String title[], details[], name[];
    Context context;
    OnItemClickListener itemClickListener;

    public ComplaintAdapter(Context ct, String titleData[], String detailsData[], String nameData[]) {
        context = ct;
        title = titleData;
        details = detailsData;
        name = nameData;
    }

    // Setter method for click listener
    public void setOnItemClickListener(OnItemClickListener listener) {
        itemClickListener = listener;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.complaint_design, parent, false);
        return new MyViewHolder(view);
    }


    @Override
    public int getItemCount() {
        return title.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {

//        ImageView propic;
        TextView titleText,detailsText,nameText;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            titleText = itemView.findViewById(R.id.titleView);
            detailsText = itemView.findViewById(R.id.detailsView);
            nameText = itemView.findViewById(R.id.nameView);

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
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
//        Picasso.get().load(pic[position]).into(holder.propic);
        holder.titleText.setText(title[position]);
        holder.detailsText.setText(details[position]);
        holder.nameText.setText(name[position]);
    }

    // Interface for item click events
    public interface OnItemClickListener {
        void onItemClick(int position);
    }
}