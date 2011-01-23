class Comment < ActiveRecord::Base
  belongs_to :post

  validates :name, :body, :presence => true
end
