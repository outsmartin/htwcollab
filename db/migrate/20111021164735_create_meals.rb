class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.decimal :price_student
      t.decimal :price_worker
      t.references :lunch

      t.timestamps
    end
    add_index :meals, :lunch_id
  end
end
