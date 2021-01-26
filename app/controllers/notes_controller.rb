class NotesController < ApplicationController
    def create
        note = Note.create(params)
        render json: note
    end

    def update
        note = Note.update(params)
    end

    def destroy
        Note.find_by(id: params["id"]).destroy
    end
end
