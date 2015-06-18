class NotesController < ApplicationController
  http_basic_authenticate_with :name => "ken", :password => "justken1"
  def index
    @new_notes = Note.where(status: 0).order(:priority).order(created_at: :desc)
    @doing_notes = Note.where(status: 1).order(:priority).order(created_at: :desc)
    @done_notes =Note.where(status: 2).order(:priority).order(created_at: :desc)
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to notes_path
  end

  def remove
    Note.find(params[:id]).destroy
    render status: :ok
  end

  def update_status
    Note.find(params[:id]).update_attributes status: params[:status].to_i
    render status: :ok
  end

  def update_priority
    params.select{|k,_| k.to_i > 0}.each do |k, v|
      Note.find(k).update_attributes priority: v.to_i
    end
  end
  private
  def note_params
    params.require(:note).permit(:text, :color, :status)
  end
end
