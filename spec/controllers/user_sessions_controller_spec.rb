require File.dirname(__FILE__) + '/../spec_helper'

describe UserSessionsController do
  integrate_views
  before { @user = Factory(:valid_user) }

  it "should get new" do
    get :new
    response.should render_template(:new)
  end

  it "should create user session" do
    post :create, :user_session => Factory.attributes_for(:valid_user)
    user_session = UserSession.find
    user_session.should_not be_nil
    user_session.user.should == @user
    response.should redirect_to(account_path)
  end

  it "should destroy user session" do
    delete :destroy
    UserSession.find.should be_nil
    response.should redirect_to(new_user_session_path)
  end
end