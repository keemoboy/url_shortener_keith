class Link < ActiveRecord::Base
  attr_accessible :original_url, :short_url

  before_create :shortener

  has_many :redirects

  private

  def shortener
    self.short_url = (0...4).map{65.+(rand(26)).chr}.join
  end
end
