class AddNameAndDescriptionToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :name, :string
    add_column :tags, :description, :text
  end
end
