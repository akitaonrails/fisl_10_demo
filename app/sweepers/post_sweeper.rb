class PostSweeper < ActionController::Caching::Sweeper
  observe Post # este sweeper observará o model Post
  
  # se o sweeper detectar que o um novo post foi criado
  def after_create(post)
    expire_cache_for(post)
  end
  
  # se o sweeper detectar que o um post existente foi atualizado
  def after_update(post)
    expire_cache_for(post)
  end
  
  # se o sweeper detectar que o um post existente foi apagado
  def after_destroy(post)
    expire_cache_for(post)
  end
  
  private
  def expire_cache_for(record)
    # Isso removera /posts.html
    expire_page(:controller => 'posts', :action => 'index')

    # Isso removera /posts/2.html
    expire_page(:controller => 'posts', :action => 'show', :id => record.id)
    
    # Isso removera /posts/page/2.html e outras na mesma pasta
    cache_dir = ActionController::Base.page_cache_directory
    Rails.logger.info "Expired pages: #{Dir.glob("#{cache_dir}/posts/page/*").map { |f| f.gsub(cache_dir, '') }.join(', ')}"
    FileUtils.rm_r(Dir.glob("#{cache_dir}/posts/page/*")) rescue Errno::ENOENT
  end
end