class LineItemsController < ApplicationController
<<<<<<< HEAD
=======
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
<<<<<<< HEAD

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
=======
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
<<<<<<< HEAD
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
=======
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end

  # GET /line_items/1/edit
  def edit
<<<<<<< HEAD
    @line_item = LineItem.find(params[:id])
=======
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
<<<<<<< HEAD
	product = Product.find(params[:product_id])
=======
    product = Product.find(params[:product_id])
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
<<<<<<< HEAD
        format.html { redirect_to store_url }
		format.js   {@current_item = @line_item }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
=======
        format.html { redirect_to store_url, 
          notice: 'Line item was successfully created.' }
        format.js { @current_item = @line_item }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

<<<<<<< HEAD
  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
=======
  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
<<<<<<< HEAD
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

=======
    @line_item.destroy
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end
<<<<<<< HEAD
=======

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
>>>>>>> de3e201cc930b970cdab81e6f204fee553ea27aa
end
