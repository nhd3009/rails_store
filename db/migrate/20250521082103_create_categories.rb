class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.boolean :active

      t.timestamps
    end

    add_index :categories, :name, unique: true
    add_index :categories, :slug, unique: true
  end
end
