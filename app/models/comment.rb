class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :comentario
  
  def self.per_page
    5
  end
end
