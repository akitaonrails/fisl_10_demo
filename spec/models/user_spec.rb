require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  it "should be valid" do
    Factory.build(:valid_user).should be_valid
  end

  it "should be invalid" do
    Factory.build(:invalid_user).should_not be_valid
  end
end