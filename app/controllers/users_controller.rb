class UsersController < ApplicationController
    def show
        user = User.find_by(username: params[:id])
        render json: user.to_json(:include => {
            :tasks => {:except => [:created_at, :updated_at]},
            :notes => {:except => [:created_at, :updated_at]}},
            :except => [:updated_at, :created_at])
    end
    
    # def index 
    #     byebug
    #     users = User.all
    #     render json: users.to_json(:include => {
    #         :tasks => {:except => [:created_at, :updated_at]},
    #         :notes => {:except => [:created_at, :updated_at]}},
    #         :except => [:updated_at, :created_at])
    # end

    def create
        user = User.create(username: params[:user][:username])
        render json: user.to_json(:include => {
            :tasks => {:except => [:created_at, :updated_at]},
            :notes => {:except => [:created_at, :updated_at]}},
            :except => [:updated_at, :created_at])
    end

    def destroy
        user = User.find_by(id: params["id"]).destroy
    end
end
