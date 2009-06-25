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
    cache_dir = ActionController::Base.page_cache_directory

    # Isso removera /posts/2.html
    Rails.logger.info "Expired pages: #{"/posts/#{record.id}.html"}"
    FileUtils.rm_r("#{cache_dir}/posts/#{record.id}.html") rescue Errno::ENOENT
  end
end