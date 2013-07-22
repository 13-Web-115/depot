class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  before_filter :getCurrentUser
  
  protect_from_forgery
  before_filter :authorize
  
  private
    
    def authorize
      unless User.find_by_id(session[:user_id]) 
        redirect_to login_url, notice: "Please login"
      end
    end
    
    def getCurrentUser
      if !@user
        @user = User.find_by_id(session[:user_id])
      end
          
    end
    
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
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
