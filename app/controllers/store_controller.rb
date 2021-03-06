class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
      
    else
      if(params[:bookName] and params[:bookName].lstrip != "")
        @products = []
        products = Product.all
        products.each do |product|
          if(product.title.upcase.include?(params[:bookName].upcase))
            @products << product
          end
        end
        
        if(@products.length == 0)
          respond_to do |format|
            format.html{ redirect_to store_path, notice: "Can't Find Such A Title!" }
          end
        end
      else
        if(params[:genre])
          @products = Product.where(:genre => params[:genre])
          if(@products.length == 0)
            respond_to do |format|
              format.html{ redirect_to store_path, notice: "No Such Genre!" }
            end
          end
        else
          @products = Product.order(:title)
        end
      end
      
      @cart = current_cart
      if @products.class == ActiveRecord::Relation
        @products = @products.paginate page: params[:page], order: 'created_at desc', per_page: 4
      end
    end 
  end
  
  def show
    @product = Product.find(params[:id])
    @cart = current_cart
    @comments = @product.comments
    @comments = @comments.paginate page: params[:page], order: 'created_at desc',
      per_page: 5
    @comment = Comment.new
    session[:product_id] = @product.id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
  
  def showOrder
    @cart = current_cart
    if(params[:quantity])
      line_item = LineItem.find(params[:id])
      quantity =  params[:quantity].to_i
      if quantity != 0
        line_item.update_attribute(:quantity, quantity)
      else
        line_item.destroy
        if @cart.line_items.empty?
          redirect_to store_path, notice: 'Your Cart is Empty!'
        end
      end
    end  
  end
end
