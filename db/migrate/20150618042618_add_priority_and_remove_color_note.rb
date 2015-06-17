class AddPriorityAndRemoveColorNote < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.remove :color
      t.integer :priority, default: 0
    end
  end
end
