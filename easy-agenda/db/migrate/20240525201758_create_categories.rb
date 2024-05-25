class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 100
      t.string :identifier, null: false

      t.timestamps
    end

    add_index :categories, :identifier, unique: true
  end
end
