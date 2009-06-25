Factory.define :valid_comment, :class => Comment do |c|
  c.autor "Fulano"
  c.url "http://foo.com.br"
  c.comentario "meu primeiro comentario"
  c.post { |p| p.association(:valid_post) }
end