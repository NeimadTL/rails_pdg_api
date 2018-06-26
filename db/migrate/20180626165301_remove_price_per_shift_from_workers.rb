class RemovePricePerShiftFromWorkers < ActiveRecord::Migration[5.2]
  def change
     remove_column :workers, :price_per_shift, :integer
  end
end
