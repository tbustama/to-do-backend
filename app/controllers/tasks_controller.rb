class TasksController < ApplicationController
    def create
        task = Task.create(params)
    end

    def update
        task = Task.update(params)
    end

    def destroy
        Task.find_by(id: params["id"]).destroy
    end
end
