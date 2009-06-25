class Admin::PostsController < ApplicationController
  layout "admin/admin"
  before_filter :require_user
  
  def index
    @posts = Post.paginate :page => params[:page], :order => "created_at DESC"
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    @uploads = Upload.all(:order => "created_at DESC", :limit => 10)
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to admin_posts_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @uploads = Upload.all(:order => "created_at DESC", :limit => 10)
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to admin_posts_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to admin_posts_url
  end
end
