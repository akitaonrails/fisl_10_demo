class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment # este sweeper observará o model Post
  
  # se o sweeper detectar que o um novo post foi criado
  def after_create(comment)
    expire_cache_for(comment)
  end
  
  # se o sweeper detectar que o um post existente foi apagado
  def after_destroy(comment)
    expire_cache_for(comment)
  end
  
  private
  def expire_cache_for(record)
    # Isso removera /posts/2.html
    expire_page(:controller => 'posts', :action => 'show', :id => record.post.id)
  end
end