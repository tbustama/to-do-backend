class TasksController < ApplicationController
    def create
        time = params[:task][:due_date].split('-')
        formatted_time = [time[2],time[0],time[1]].join("-")
        
        task = Task.create(title: params[:task][:title], description: params[:task][:description], due_date: formatted_time, priority_level: params[:task][:priority_level], user_id: params[:task][:user_id], duration: params[:task][:duration])
        render json: task.to_json(:include =>{
            :user => {:include => {
                :tasks => {:except => [:created_at, :updated_at]},
                :notes => {:except => [:created_at, :updated_at]}},
                :except => [:updated_at, :created_at]}
        })
    end

    def update
        task = Task.find_by(id: params[:id])
        time = params[:task][:due_date].split('-')
        formatted_time = [time[2],time[0],time[1]].join("-")
        task.update(title: params[:task][:title], description: params[:task][:description], due_date: formatted_time, priority_level: params[:task][:priority_level], duration: params[:task][:duration], user_id: params[:task][:user_id])
        render json: task.to_json(:include => {
            :user => {:include => {
                :tasks => {:except => [:created_at, :updated_at]},
                :notes => {:except => [:created_at, :updated_at]}},
                :except => [:updated_at, :created_at]}
        })
       
    end

    def destroy
        Task.find_by(id: params["id"]).destroy
    end

end
