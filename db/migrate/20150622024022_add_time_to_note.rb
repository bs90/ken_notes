class AddTimeToNote < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.datetime :note_time
    end
  end
end
