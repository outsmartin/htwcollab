class CreateCodesnippets < ActiveRecord::Migration
  def change
    create_table :codesnippets do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
