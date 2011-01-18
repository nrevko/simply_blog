class Category < ActiveRecord::Base

  default_scope :order => 'category_name'
  validates :category_name, :presence => true, :uniqueness => true

  has_many :posts
end
