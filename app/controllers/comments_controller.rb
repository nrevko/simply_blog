class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    puts"HEEEEEEEEEEEEEEEEY"
    respond_to do |format|
      format.html # index.html.erb
format.js
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    #@comment.post_id = @post.id
#puts "We got here"
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.xml  { render :xml => @comment }
    end

#puts "ABOUT to go out"
  end

  # POST /comments
  # POST /comments.xml
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    #@comment = Comment.new(params[:comment])
    #@post = Post.find(params[:post_id])

    #@comment.post_id = @post.id
#@comment = @post.comments.new(params[:comment])
    #puts "==============POST id: #{@post.id} #{@post.post_title}===Com Name #{@comment.name}"
    respond_to do |format|
#puts "in Formatting"
      if @comment.save
#puts "Saving!!!"
        format.html { redirect_to(post_url(@post), :notice => 'Comment was successfully created.') }
#format.js => add ajax here
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
#puts "Cannot save!!!"
        format.html { render :action => "new" }
#    format.js
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    #post = Post.find(@comment.post_id)
    @comment.post_id = nil
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_comments_url(@post)) }
      format.xml  { head :ok }
    end
  end
end
