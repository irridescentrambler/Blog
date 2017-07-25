class CreateTagPools < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_pools do |t|

      t.timestamps
    end
  end
end
