class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  skip_before_filter :authorize, only: [:new, :create]
  
  def index
    @users = User.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user1 = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user1 }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user1 = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user1 }
    end
  end

  # GET /users/1/edit
  def edit
    @user1 = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user1 = User.new(params[:user])

    respond_to do |format|
      if @user1.save
        format.html { redirect_to users_url, notice: "User #{@user1.name} was successfully created." }
        format.json { render json: @user1, status: :created, location: @user1 }
      else
        format.html { render action: "new" }
        format.json { render json: @user1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user1 = User.find(params[:id])

    respond_to do |format|
      if @user1.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: "User #{@user1.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user1 = User.find(params[:id])
    begin
      @user1.destroy
      flash[:notice] = "User #{@user1.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
