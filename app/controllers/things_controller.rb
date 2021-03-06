class ThingsController < ApplicationController
  # GET /things
  # GET /things.json
  
  
  def index
    @things = Thing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @things }
    end
  end

  # GET /things/1
  # GET /things/1.json
  def show
    @thing = Thing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thing }
    end
  end

  # GET /things/new
  # GET /things/new.json
  def new
    user = User.find_by_id(session[:user_id])
    unless user and (user.genre == "admin" or user.genre == "shopkeeper") 
      redirect_to login_url, notice: "You are not Admin or Shopkeeper. Access denied!"
    else
      @thing = Thing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thing }
    end
    end
    
  end

  # GET /things/1/edit
  def edit
    user = User.find_by_id(session[:user_id])
    unless user and user.genre == "admin"
      redirect_to login_url, notice: "You are not Admin. Access denied!"
    else
      @thing = Thing.find(params[:id])
    end
    
  end

  # POST /things
  # POST /things.json
  def create
    user = User.find_by_id(session[:user_id])
    unless user and (user.genre == "admin" or user.genre == "shopkeeper") 
      redirect_to login_url, notice: "You are not Admin or Shopkeeper. Access denied!"
    else
      @thing = Thing.new(params[:thing])

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render json: @thing, status: :created, location: @thing }
      else
        format.html { render action: "new" }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
    end
    
  end

  # PUT /things/1
  # PUT /things/1.json
  def update
    @thing = Thing.find(params[:id])

    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to things_url }
      format.json { head :no_content }
    end
  end

  private
    def authorizeAdminAndShopper
      user = User.find_by_id(session[:user_id])
      unless user and (user.genre == "admin" or user.genre == "shopkeeper") 
        redirect_to login_url, notice: "You are not Admin or Shopkeeper. Access denied!"
      end
    end
  
end
