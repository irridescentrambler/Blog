class Tag < ApplicationRecord
  has_many :tag_pools
  has_many :posts, through: :tag_pools
end
