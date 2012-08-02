class Reroute < ActiveRecord::Base
  attr_accessible :origin, :short_url_id
  belongs_to :short_url

  validates :origin, presence: true
end
