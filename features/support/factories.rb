gem 'thoughtbot-factory_girl'
require 'factory_girl'

Factory.define :primeiro_post, :class => Post do |p|
  p.titulo "Meu primeiro post"
  p.texto "Este é meu post de exemplo"
end