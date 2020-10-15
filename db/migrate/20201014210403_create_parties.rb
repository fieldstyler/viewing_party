class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :movie
      t.string :duration
      t.string :party_date
      t.string :start_time

      t.timestamps
    end
  end
end
