Funcionalidade: Blog de 15 minutos

Para demonstrar o Ruby on Rails
Como um evangelizador
Quero poder mostrar um blog em funcionamento

Cenário: Criar Posts
  Dado que estou na homepage
  E clico em "Novo Post"
  Quando for redirecionado para a página de Criar Post
  E preencher o "titulo" com "Meu primeiro post"
  E preencher o "texto" com "Este é meu post de exemplo"
  E enviar os dados
  Então quero ser redirecionado de volta à homepage
  E quero ver o título "Meu primeiro post" listado

Cenário: Criar Comentário
  Dado que estou visualizando o post "Meu primeiro post"
  Quando preencher o campo de comentário com "meu comentário"
  Então quero ver o comentário listado "meu comentário"
