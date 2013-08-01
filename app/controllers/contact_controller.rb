class ContactController < ApplicationController
  def index
    if params[:content]
      respond_to do |format|
        OrderNotifier.contactUs(params[:content], params[:person], params[:phone]).deliver
        format.html { redirect_to contact_path, notice: "Thanks for your message.We will handle it as soon as we can!" }
      end
    end
  end
end
