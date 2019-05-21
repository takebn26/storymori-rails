class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :text
      t.references :story
      t.integer :parent_id, index: true
      t.integer :created_by, index: true
      t.integer :updated_by, index: true
      t.timestamps
    end
  end
end
