class AddStatusToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :status, :string
  end
end
