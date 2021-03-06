require File.dirname(__FILE__) + '/../spec_helper'
 
describe PostsController do
  integrate_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    Post.should_receive(:first).and_return(Factory(:valid_post))
    get :show, :id => Post.first
    response.should render_template(:show)
  end
end
