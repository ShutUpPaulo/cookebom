# Migration table for ingredients
class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
