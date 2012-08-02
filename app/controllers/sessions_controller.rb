class SessionsController < ApplicationController

  def new
    if signed_in?
      @short_urls = current_user.short_urls
      redirect_to short_urls_path
    end
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_back_or new_short_url_path
    else
      flash.now[:error] = "Invalid username or password"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
