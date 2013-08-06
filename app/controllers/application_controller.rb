class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  before_filter :getCurrentUser
  before_filter :recommend_books
  
  protect_from_forgery
  before_filter :authorize
  
  private
    
    def authorize
      unless User.find_by_id(session[:user_id]) 
        redirect_to login_url, notice: "Please login"
      end
    end
    
    def recommend_books
      temp = Product.order(:created_at)
      len = temp.length
      @recommends = []
      for i in 1..3
        @recommends << temp[len - i]
      end
    end
    
    def getCurrentUser
      if !@user
        @user = User.find_by_id(session[:user_id])
      end
          
    end
    
    def current_cart
      if session[:user_id]
        user = User.find(session[:user_id])
      end
      if user
        Cart.find(user.cart_id)
      else
        Cart.find(session[:cart_id])
      end
      #Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      if session[:user_id]
        user = User.find(session[:user_id])
        user.update_attribute(:cart_id, cart.id)
      end
      session[:cart_id] = cart.id
      cart
    end
  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
    def default_url_options
      { locale: I18n.locale }
    end
end
