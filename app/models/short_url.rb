class ShortUrl < ActiveRecord::Base
  attr_accessible :lurl, :surl
  
  before_save :create_surl
  
  validates :lurl, presence: true, format: { with: /\Ahttp[s]?:\/\// }
  validates :surl, uniqueness: true, format: { with: /[\w]+/ }
  
  private
    
    def create_surl
      if surl.blank?
        self.surl = Digest::MD5::hexdigest(self.lurl)[0..5]
      end
    end
  
end
