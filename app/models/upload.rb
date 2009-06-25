class Upload < ActiveRecord::Base
  has_attached_file :imagem, :styles => { :thumb => "50x50>" }
end
