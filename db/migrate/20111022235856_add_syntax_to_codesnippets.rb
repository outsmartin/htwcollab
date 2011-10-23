class AddSyntaxToCodesnippets < ActiveRecord::Migration
  def change
    add_column :codesnippets, :syntax, :string
  end
end
