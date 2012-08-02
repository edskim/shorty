module ShortUrlsHelper
  def shortpath(surl)
    "#{root_url}#{surl}"
  end
end
