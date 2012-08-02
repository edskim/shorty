class ReroutesController < ApplicationController

  def create
    @short_url = ShortUrl.find_by_surl(params[:id])
    if @short_url
      Reroute.new( origin: request.remote_ip, short_url_id: @short_url.id ).save
      redirect_to @short_url.lurl
    else
      @short_url = ShortUrl.new
      flash[:error] = "This road goes to nowhere. No address. Sorry!"
      redirect_to root_url
    end
  end

end
