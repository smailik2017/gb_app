class Post < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :likes
  
  scope :search_scope, ->(query) { where("name LIKE ?", "%#{query}%") }
  
  # scope :search_scope_order, ->(query) { where("name LIKE ?", "%#{query}%") }

  def like!
    increment!(:likes_count)
  end

  def likes_count
    self.likes.count
  end

end
