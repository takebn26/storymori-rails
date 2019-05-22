class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string  :title, null: false, limit: 10
      t.string  :summary, null: false
      t.integer :created_by, index: true
      t.integer :updated_by, index: true
      t.timestamps
    end
  end
end
