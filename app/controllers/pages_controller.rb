class PagesController < ApplicationController
  def home
    @services = Service.all.limit(4)
  end

  def index
  end


  def contact
  end

  def contact_email
    user_info = {user: current_user, name: email_params[:name], email: email_params[:email], message: email_params[:message]}
    ContactMailer.send_contact_email(user_info).deliver_now
    render :contact
  end
 
  private
  def email_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
