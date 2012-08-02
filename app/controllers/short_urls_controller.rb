class ShortUrlsController < ApplicationController
  before_filter :signed_in_user, only: [ :index, :new, :create, :destroy ]
  before_filter :correct_user, only: [ :destroy ]

  def index
    @short_urls = current_user.short_urls
  end

  # show the html
  def show 
    @short_url = ShortUrl.find(params[:id])
  end
  
  # page to create
  def new
    @short_url = ShortUrl.new
  end
  
  # post to the form
  def create
    @short_url = ShortUrl.new(params[:short_url])
    @short_url.user_id = current_user.id
    if @short_url.save
      redirect_to @short_url
    else
      render 'new'
    end
  end
  
  # kill it all
  def destroy
    @short_url.destroy
    redirect_to root_path
  end
  
  def reroute
    @short_url = ShortUrl.find_by_surl(params[:id])
    if @short_url
      redirect_to @short_url.lurl
    else
      @short_url = ShortUrl.new
      flash.now[:error] = "This road goes to nowhere. No address. Sorry!"
      render 'new'
    end
  end
  
  private
    
    def correct_user
      @short_url = ShortUrl.find(params[:id])
      redirect_to current_user unless current_user.id == @short_url.user_id
    end
  
end
