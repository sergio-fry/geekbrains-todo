class AddActiveToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deactivated, :boolean, default: false, null: false
  end
end
