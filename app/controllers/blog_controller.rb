class BlogController < ApplicationController
  def index
    @posts = Post.paginate :page=>params[:page], :order=>'date_of_creation desc', :per_page => 10
  end

end
