class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.integer :price_per_shift

      t.timestamps
    end
  end
end
