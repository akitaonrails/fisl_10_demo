class PostsController < ApplicationController
  caches_page :index
  caches_page :show
  
  def index
    @posts = Post.paginate :page => params[:page], :order => "created_at DESC"
  end
  
  def show
    @post = Post.find(params[:id])
  end  
end
