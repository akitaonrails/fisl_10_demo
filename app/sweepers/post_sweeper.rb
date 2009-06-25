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
    cache_dir = ActionController::Base.page_cache_directory

    # Isso removera /posts.html e /index.html
    list = ["#{cache_dir}/index.html", "#{cache_dir}/posts.html"]
    Rails.logger.info "Expired pages: #{list.map { |f| f.gsub(cache_dir, '') }.join(', ')}"
    list.each { |f| FileUtils.rm_r(f) rescue Errno::ENOENT }

    # Isso removera /posts/2.html
    Rails.logger.info "Expired pages: #{"/posts/#{record.id}.html"}"
    FileUtils.rm_r("#{cache_dir}/posts/#{record.id}.html") rescue Errno::ENOENT
    
    # Isso removera /posts/page/2.html e outras na mesma pasta
    Rails.logger.info "Expired pages: #{Dir.glob("#{cache_dir}/posts/page/*").map { |f| f.gsub(cache_dir, '') }.join(', ')}"
    FileUtils.rm_r(Dir.glob("#{cache_dir}/posts/page/*")) rescue Errno::ENOENT
  end
end