gem 'thoughtbot-factory_girl'
require 'factory_girl'

Factory.define :primeiro_post, :class => Post do |p|
  p.titulo "Meu primeiro post"
  p.texto "Este é meu post de exemplo"
end

Factory.define :valid_comment, :class => Comment do |p|
  p.autor "Fabio"
  p.url "http://www.akitaonrails.com"
  p.comentario "meu comentario"
end