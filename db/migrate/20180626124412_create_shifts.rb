class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.integer :worker_id
      t.date :start_date

      t.timestamps
    end
  end
end
