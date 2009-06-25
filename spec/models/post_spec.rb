require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  it "should be valid" do
    Post.new(:titulo => "foo").should be_valid
  end
  
  it "should convert Textile markup to HTML" do
    post = Post.new(:titulo => "Post Textile")
    post.descricao = "Demonstração de *Textile* com _RedCloth_"
    post.texto = <<-EOF
Para mais informações sobre *RedCloth*,
procure no "site oficial":http://redcloth.org/
EOF
    post.save.should be_true
    post.descricao_html.should == "<p>Demonstração de <strong>Textile</strong> com <em>RedCloth</em></p>"
    post.texto_html.should == %q{<p>Para mais informações sobre <strong>RedCloth</strong>,<br />
procure no <a href="http://redcloth.org/">site oficial</a></p>}
  end
end
