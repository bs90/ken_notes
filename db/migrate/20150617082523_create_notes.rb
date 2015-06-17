class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :text
      t.string :color, default: "ff0000"
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
