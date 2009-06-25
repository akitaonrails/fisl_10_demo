class CommentsController < ApplicationController
  before_filter :load_post
  cache_sweeper :comment_sweeper, :only => [:create]
  
  def create
    @comment = @post.comments.build(params[:comment])
    flash[:notice] = "Successfully created comment." if @comment.save
    redirect_to post_path(@post)
  end
  
  private
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
