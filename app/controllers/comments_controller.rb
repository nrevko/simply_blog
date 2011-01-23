class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }

    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html { redirect_to post_comments_path}
      format.xml  { render :xml => @comment }
    end

  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comment.post_id = @post.id
#puts "We got here"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end

#puts "ABOUT to go out"
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create

    @comment = Comment.new(params[:comment])
    @post = Post.find(params[:post_id])

    @comment.post_id = @post.id
#@comment = @post.comments.new(params[:comment])
    #puts "==============POST id: #{@post.id} #{@post.post_title}===Com Name #{@comment.name}"

    respond_to do |format|

#puts "in Formatting"
      if @comment.save
#puts "Saving!!!"
        format.html { redirect_to(post_comments_url, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
#puts "Cannot save!!!"
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(post_comments_url, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    post = Post.find(@comment.post_id)
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(post_comments_url) }
      format.xml  { head :ok }
    end
  end
end
