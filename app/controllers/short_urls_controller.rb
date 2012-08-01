class ShortUrlsController < ApplicationController

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
    if @short_url.save
      redirect_to @short_url
    else
      render 'new'
    end
  end
  
  # kill it all
  def destroy
    ShortUrl.find(params[:id]).destroy
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
  
  
end
