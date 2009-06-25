class Post < ActiveRecord::Base
  has_many :comments
  before_save :filtro_html
  
  private
  
  def filtro_html
    self.descricao_html = RedCloth.new(self.descricao).to_html
    self.texto_html = RedCloth.new(self.texto).to_html
  end
end
