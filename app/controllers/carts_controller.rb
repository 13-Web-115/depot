class CartsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :set_cart, only: [:edit, :update, :destroy]

>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
<<<<<<< HEAD

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
=======
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
<<<<<<< HEAD
	  logger.error "Attempt to access invalid cart #{params[:id]}"
	  redirect_to store_url, notice: "Invalid cart"
	else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart }
      end
	end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
=======
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart}
      end
    end
  end

  # GET /carts/new
  def new
    @cart = Cart.new
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end

  # GET /carts/1/edit
  def edit
<<<<<<< HEAD
    @cart = Cart.find(params[:id])
=======
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end

  # POST /carts
  # POST /carts.json
  def create
<<<<<<< HEAD
    @cart = Cart.new(params[:cart])
=======
    @cart = Cart.new(cart_params)
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
<<<<<<< HEAD
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
=======
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
=======
  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
<<<<<<< HEAD
	#@cart = Cart.find(params[:id])
    @cart.destroy
	session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to store_url }	    
      format.json { head :no_content }
    end
  end
=======
    @cart.destroy
    session[:cart_id] = nil
    
    respond_to do |format|
      format.html { redirect_to store_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
end
