class Admin::CommentsController < ApplicationController
  layout "admin/admin"
  before_filter :require_user
  cache_sweeper :comment_sweeper, :only => [:destroy]

  def index
    @comments = Comment.paginate :page => params[:page], :order => "created_at DESC"
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comentário apagado com sucesso."
    redirect_to admin_comments_url
  end
end
