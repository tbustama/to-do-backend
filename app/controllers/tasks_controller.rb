class TasksController < ApplicationController
    def create
        task = Task.create(params)
        render json: task
    end

    def update
        task = Task.update(params)
    end

    def destroy
        Task.find_by(id: params["id"]).destroy
    end
end
