class Post < ApplicationRecord
  validates :name, uniqueness: :true, presence: :true
  validates :description, presence: :true
  has_many :tag_pools
  has_many :tags, through: :tag_pools
end
