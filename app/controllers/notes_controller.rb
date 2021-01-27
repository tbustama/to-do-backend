class NotesController < ApplicationController
    def create
        note = Note.create(body: params[:note][:body], title: params[:note][:title], user_id: params[:note][:user_id])
        render json: note
    end

    def update
        note = Note.find_by(id: params[:id])
        note.update(body: params[:note][:body], title: params[:note][:title], user_id: params[:note][:user_id])
        render json: note
    end

    def destroy
        Note.find_by(id: params["id"]).destroy
    end
end
