class Tag < ActiveRecord::Base
  validates :tag, :uniqueness => true
  has_many :post_tags
  has_many :posts, :through => :post_tags

  def self.check_tag(tag_search)
    if found = Tag.find_by_tag(tag_search)
      tag_id = found.id
    else
      tag_id = Tag.create(tag: tag_search).id
    end
    tag_id
  end
end
