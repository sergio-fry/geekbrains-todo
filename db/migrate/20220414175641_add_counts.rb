class AddCounts < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :comments_count, :integer
    add_column :events, :comments_count, :integer
  end
end
