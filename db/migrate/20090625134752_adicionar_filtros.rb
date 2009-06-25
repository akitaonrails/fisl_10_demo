class AdicionarFiltros < ActiveRecord::Migration
  def self.up
    add_column :posts, :descricao, :text
    add_column :posts, :descricao_html, :text
    add_column :posts, :texto_html, :text
  end

  def self.down
    remove_column :posts, :texto_html
    remove_column :posts, :descricao_html
    remove_column :posts, :descricao
  end
end
