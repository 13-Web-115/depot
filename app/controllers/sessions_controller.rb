class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
    @cart = current_cart
  end
  
  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.genre == "ordinary"
        redirect_to welcome_path
      else
        redirect_to admin_url
      end
      
    else
      redirect_to login_url, alert: t('.invalid')
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart_id] = nil
    redirect_to store_url, notice: t('.logout')
  end
end
