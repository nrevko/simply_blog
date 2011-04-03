class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    puts"HEEEEEEEEEEEEEEEEY"
    respond_to do |format|
      format.html do
        redirect_to post_path(@post)
      end
       # index.html.erb
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

   # @clicked_first_time=1
#puts "ABOUT to go out"
  end

  # POST /comments
  # POST /comments.xml
  def create
    @post    = Post.find(params[:post_id])
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
#@clicked_first_time = nil
        @comment_created = true
        format.html { redirect_to(blog_url, :notice => 'Comment was successfully created.') }
        #format.html { redirect_to(post_url(@post), :notice => 'Comment was successfully created.') }

        format.js #{@current_item=@comment} #=> add ajax here
        format.xml { render :xml => @comment, :status => :created, :location => @comment }
      else
#puts "Cannot save!!!"
        @comment_created   = false
        #flash.now[:notice] = "Your comment cannot be created. Please, fill out appropriate fields"
#logger.error flash.now[:notice]
        format.html { render :action => "new", :post => @post }
        #format.html {redirect_to blog_url, render(:partial => 'comments/_new_comment.html.erb', :locals=> {:notice => "Comment wasn't created!"})}#new_post_comment_path}#
        #       format.html{ render(:nothing => true)}#{ render(:partial => "form", :locals => {:notice =>"Cannot create a comment"})}
        format.js
#        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy

    @post = Post.find(params[:post_id])
    #puts "RENDERING here's your post: #{@post.post_title}"
    @comment = Comment.find(params[:id])
    puts "RENDERING here's your comment: #{@comment.body}"
    #console.log("RENDERING here's your comment: #{@comment.body}")
    #post = Post.find(@comment.post_id)
    #@comment = @post.comment(params[:comment])
    @comment.post_id = nil
    #@post.comment = nil
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_comments_url(@post)) }
      #format.html { redirect_to(post_comments_url(@post)) }
      format.js
      format.xml  { head :ok }
    end
  end
end
