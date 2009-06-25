Dado /^que estou na homepage$/ do
  visit admin_posts_url
end

Dado /^clico em "([^\"]*)"$/ do |novo_post_link|
  click_link novo_post_link
end

Quando /^for redirecionado para a página de Criar Post$/ do
  URI.parse(current_url).path.should == new_admin_post_path
end

Quando /^preencher o "([^\"]*)" com "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Quando /^enviar os dados$/ do
  click_button "Enviar"
end

Então /^quero ser redirecionado de volta à homepage$/ do
  URI.parse(current_url).path.should == admin_posts_path
end

Então /^quero ver o título "([^\"]*)" listado$/ do |titulo|
  response.body.should contain(titulo)
end

Dado /^que estou visualizando o post "([^\"]*)"$/ do |titulo|
  @post = Factory(:primeiro_post, :titulo => titulo)
  visit post_path(@post)
  URI.parse(current_url).path.should == post_path(@post)
end

Quando /^preencher o campo de comentário com "([^\"]*)"$/ do |comentario|
  fill_in("comentario", :with => comentario)
  click_button "Enviar"
end

Então /^quero ver o comentário listado "([^\"]*)"$/ do |comentario|
  URI.parse(current_url).path.should == post_path(@post)
  response.body.should contain(comentario)
end

Dado /^que estou visualizando a lista de comentários$/ do
  @comment = Factory(:valid_comment)
  visit admin_comments_path
end

Quando /^clicar em "([^\"]*)"$/ do |apagar_link|
  Comment.exists?(@comment.id).should be_true
  click_link(apagar_link)
end

Então /^quero que o comentário seja apagado$/ do
  Comment.exists?(@comment.id).should be_false
end