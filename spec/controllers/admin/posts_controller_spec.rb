require File.dirname(__FILE__) + '/../../spec_helper'
 
describe Admin::PostsController do
  integrate_views
  
  before(:each) do
    activate_authlogic
    UserSession.create(Factory(:valid_user))
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    Post.should_receive(:first).and_return(Factory(:valid_post))
    get :show, :id => Post.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
    
  it "create action should redirect when model is valid" do
    post :create, :post => Factory.attributes_for(:valid_post)
    response.should redirect_to(admin_posts_url)
  end
  
  it "edit action should render edit template" do
    Post.should_receive(:first).and_return(Factory(:valid_post))
    get :edit, :id => Post.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Post.should_receive(:first).and_return(Factory(:valid_post))
    put :update, :id => Post.first, :post => Factory.attributes_for(:valid_post)
    response.should redirect_to(admin_posts_url)
  end
  
  it "destroy action should destroy model and redirect to index action" do
    post = Factory(:valid_post)
    delete :destroy, :id => post
    response.should redirect_to(admin_posts_url)
    Post.exists?(post.id).should be_false
  end
end
