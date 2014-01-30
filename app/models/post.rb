class Post < ActiveRecord::Base
  validates :body, :presence => true
  validates :title, :presence => true

  belongs_to :user
  has_many :post_tags
  has_many :tags, :through => :post_tags
end
