class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  before_filter :authorizeAdminAndShopper
  
  before_filter :configure_charsets    
  def configure_charsets
    @headers = {}          
    @headers["Content-Type"] = "text/html;charset=utf-8"      
   end      
    
  def uploadFile(file)    
     if !file.original_filename.empty?  
       #生成一个随机的文件名      
       @filename=file.original_filename         
       #向dir目录写入文件  
       File.open("#{Rails.root}/app/assets/images/#{@filename}", "wb") do |f|   
          f.write(file.read)  
       end   
       #返回文件名称，保存到数据库中  
       return @filename  
     end  
  end   
  
  def getFileName(filename)  
     if !filename.nil?  
       require 'uuidtools'  
       filename.sub( /.*\./,UUID.random_create.to_s+'.')  
     end  
  end 
  
  def index
    user = User.find_by_id(session[:user_id])
    if user.genre == "shopkeeper"
      @products = Product.where(owner: user.name)
    else
      @products = Product.where("price > ?", -1)
    end
    @products = @products.paginate page: params[:page], order: 'created_at desc',
      per_page: 6
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    if request.get?  
      @product = Product.new  
      #puts "NNNNNNNNNNNNNNNNNNNNNNN"
    else
      if params[:product]['image_url'] != nil
        @product= Product.new(params[:product])     
        @product.image_url = uploadFile(params[:product]['image_url']) 
        #puts "MMMMMMMMMMMMMMMMMMMMMMMM:#{@product.image_url}"  
        respond_to do |format|
          if @product.save
            format.html { redirect_to @product, notice: 'Product was successfully created.' }
            format.json { render json: @product, status: :created, location: @product }
          else
            format.html { render action: "new" }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to new_product_path, notice: "Please Upload an Image!"  
      end 
    end
=begin    
    @product = Product.new(params[:product])
    #@product.genre = params[:genre]
    unless File.exist?(@product.image_url)
      @product.image_url = 'default.png'
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    if params[:product]['image_url'] != nil
      puts "xxxxxxxxxxxxxxxxxxxxxx"
      puts params[:product]['image_url']
      params[:product][:image_url] = uploadFile(params[:product]['image_url']) 
      @product.genre = params[:genre]
      respond_to do |format|
        if @product.update_attributes(params[:product])
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to edit_product_path(@product), notice: "Please Upload an Image!"
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
    end
  end
  
  def upload
    uploaded_io = params[:product][:image_url]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
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
