class CreateForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6
      t.decimal :daily_precip_prob, precision: 6, scale: 3
      t.string :daily_precip_type

      t.timestamps
    end
  end
end
