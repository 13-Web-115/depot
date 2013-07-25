class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    user = User.find_by_id(session[:user_id])
    if user.genre == 'admin'
      @comments = Comment.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @comments }
      end
    else
      redirect_to login_url, notice: "You are not Admin. Access denied!"
    end 
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    session[:product_id] = params[:product_id]
    #puts "NNNNNNNNNNNNNNNNN:#{params[:product_id]}"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    user = User.find_by_id(session[:user_id])
    product = Product.find_by_id(session[:product_id])
    session[:product_id] = nil
    @comment = product.comments.create(params[:comment])
    @comment.poster = user.name
    #@comment = Comment.new(params[:comment])
    #@comment = product.comments.build(@comment)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to controller: 'store', action: :show, id: product, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
