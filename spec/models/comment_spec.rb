require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do
  it "should be valid" do
    Comment.new(:comentario => "foo").should be_valid
  end
end
