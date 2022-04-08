class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      with_options null: false do
        t.string :name
      end

      t.text :content
      t.boolean :done, comment: 'была ли задача выполнена', null: false, default: false
      t.datetime :finished_at
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
