class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, :dependent => :destroy

  validates :post_title, :post_text, :category_id, :presence => true
  validates :post_title, :uniqueness => true
  validates :category_id, :inclusion => Category.all.map{ |cat| cat.id}

 # def category_name
 #   category = Category.find(self.category_id).category_name
 #   category
 # end

 # def comments_for_post
 #   comments = Comment.find(:post_id => self.id)
 # end
  
end
