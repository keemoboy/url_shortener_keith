class Redirect < ActiveRecord::Base
  attr_accessible :link_id

  belongs_to :link
end
