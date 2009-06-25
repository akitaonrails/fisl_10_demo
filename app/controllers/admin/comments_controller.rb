class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.all(:order => "created_at DESC")
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comentário apagado com sucesso."
    redirect_to admin_comments_url
  end
end
