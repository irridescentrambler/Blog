class AddColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :name, :string
    add_column :posts, :description, :text
  end
end
