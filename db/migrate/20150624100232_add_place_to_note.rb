class AddPlaceToNote < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.string :place
    end
  end
end
