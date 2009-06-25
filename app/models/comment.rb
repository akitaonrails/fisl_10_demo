class Comment < ActiveRecord::Base
  belongs_to :post
  
  def self.per_page
    5
  end
end
