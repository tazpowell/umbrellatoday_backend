class ChangeLatLongColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :locations, :lat, :decimal, precision: 12, scale: 6
    change_column :locations, :long, :decimal, precision: 12, scale: 6
  end
end
