class NotesController < ApplicationController
  http_basic_authenticate_with :name => "ken", :password => "k123456789"
  def index
    new_notes = Note.where(status: 0).order(:priority).order(created_at: :desc)
    doing_notes = Note.where(status: 1).order(:priority).order(created_at: :desc)
    done_notes =Note.where(status: 2).order(:priority).order(created_at: :desc)
    @notes = [new_notes, doing_notes, done_notes]
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.save
    redirect_to root_path
  end

  def remove
    Note.find(params[:id]).destroy
    render status: :ok
  end

  def update_note
    note = Note.find(params[:id]).update_attributes text: params[:text],
      note_time: note_time, place: params[:place]
    redirect_to root_path
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
    params["note"]["note_time"] = note_time
    params.require(:note).permit(:text, :status, :place, :note_time)
  end

  def note_time
    note_time_data = params["note"]
    DateTime.new note_time_data["note_time(1i)"].to_i, note_time_data["note_time(2i)"].to_i,
      note_time_data["note_time(3i)"].to_i, note_time_data["note_time(4i)"].to_i, note_time_data["note_time(5i)"].to_i
  end
end
