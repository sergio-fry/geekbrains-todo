class AddSettingsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :settings, :json, null: false, default: '{"notifications": false}'
  end
end
