class OrdersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]
  
  # GET /orders
  # GET /orders.json
  def index
    #@orders = Order.all
    user = User.find_by_id(session[:user_id])
    if user.genre == "ordinary"
      @orders = Order.where(name: "#{user.name}")
      @orders = @orders.paginate page: params[:page], order: 'created_at desc',
      per_page: 10
    else
      if user.genre == "shopkeeper"
        #do something
        @orders = []
        orders = Order.all
        orders.each do |order|
          line_items = order.line_items
          line_items.each do |item|
            product = Product.find_by_id(item.product_id)
            if product and product.owner == user.name
              @orders << order
              break
            end
          end
        end
      else
        @orders = Order.paginate page: params[:page], order: 'created_at desc',
        per_page: 10
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    user = User.find_by_id(session[:user_id])
    @line_items = []
    if user.genre == "shopkeeper"
      @order.line_items.each do |item|
        if Product.find_by_id(item.product_id).owner == user.name
          @line_items << item
        end
      end
    end
    
    if(params[:shipped])
      respond_to do |format|
        OrderNotifier.shipProducts(@order, @line_items).deliver
        @order.update_attribute(:shipped, true)
        format.html { redirect_to @order, notice: 'Shipped E-mail has been sent!' } # show.html.erb
        format.json { render json: @order }
      end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @order }
      end
    end
    
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    if session[:user_id]
      @cart = current_cart
      if @cart.line_items.empty?
        redirect_to store_url, notice: "Your cart is empty"
        return
      end
      @order = Order.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @order }
      end
    else
      redirect_to login_url, notice: "Please Login First!"
    end
    
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        format.html { redirect_to store_url, notice: I18n.t('.thanks') }
        format.json { render json: @order, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
