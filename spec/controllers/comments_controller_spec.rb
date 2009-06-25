require File.dirname(__FILE__) + '/../spec_helper'
 
describe CommentsController do
  integrate_views

  before(:each) do
    @post = Factory(:valid_post)
  end
  
  it "should create new comment for existing post" do
    Comment.any_instance.stubs(:valid?).returns(false)
    post :create, :post_id => @post.id, :comment => Factory.attributes_for(:valid_comment)
    response.should redirect_to(post_path(@post))
  end
end
