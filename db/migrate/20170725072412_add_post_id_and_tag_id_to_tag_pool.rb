class AddPostIdAndTagIdToTagPool < ActiveRecord::Migration[5.1]
  def change
    add_column :tag_pools, :post_id, :integer
    add_column :tag_pools, :tag_id, :integer
  end
end
