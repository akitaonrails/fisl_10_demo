require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Upload do
  before(:each) do
    @valid_attributes = {
      :imagem_file_name => "value for imagem_file_name",
      :image_content_type => "value for image_content_type",
      :imagem_file_size => 1,
      :imagem_updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Upload.create!(@valid_attributes)
  end
end
