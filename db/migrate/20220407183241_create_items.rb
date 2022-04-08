class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.boolean :done, default: false, null: false
      t.datetime :finished_at
      t.integer :event_id

      t.timestamps
    end

    add_foreign_key :items, :events
  end
end
