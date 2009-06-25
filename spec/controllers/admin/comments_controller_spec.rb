require File.dirname(__FILE__) + '/../../spec_helper'
 
describe Admin::CommentsController do
  integrate_views

  before(:each) do
    activate_authlogic
    UserSession.create(Factory(:valid_user))
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "destroy action should destroy model and redirect to index action" do
    comment = Factory(:valid_comment)
    delete :destroy, :id => comment
    response.should redirect_to(admin_comments_url)
    Comment.exists?(comment.id).should be_false
  end
end
