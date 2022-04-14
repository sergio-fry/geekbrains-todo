class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end

    create_table :events_tags, id: false do |t|
      t.integer :event_id
      t.integer :tag_id
    end
  end
end
