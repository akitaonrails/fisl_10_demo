require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do
  integrate_views

  context "not logged in" do
    it "should get new" do
      get :new
      response.should render_template(:new)
    end

    it "should create user" do
      lambda {
        post :create, :user => Factory.attributes_for(:valid_user)
      }.should change(User, :count)
      response.should redirect_to( account_path )
    end
  end

  context "logged in" do
    before(:each) do
      activate_authlogic
      UserSession.create(Factory(:valid_user))
    end

    it "should show user" do
      get :show
      response.should render_template(:show)
    end

    it "should get edit" do
      get :edit
      response.should render_template(:edit)
    end

    it "should update user" do
      put :update, :user => { :password => "12345", :password_confirmation => "12345"}
      response.should redirect_to( account_path )
    end
  end
end