class ShortUrl < ActiveRecord::Base
  attr_accessible :lurl, :surl
  belongs_to :user
  
  before_save :create_surl
  
  validates :lurl, presence: true, format: { with: /\Ahttp[s]?:\/\// }
  validates :surl, uniqueness: true, length: { maximum: 10 }
  
  private
        
    def create_surl
      if self.surl.blank? 
        self.surl = Digest::MD5::hexdigest(self.lurl)[0..5]
        while ShortUrl.find_by_surl(self.surl) 
          self.surl = Digest::MD5::hexdigest(self.surl)[0..5]
        end
      end
    end
  
end
