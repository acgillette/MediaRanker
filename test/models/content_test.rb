require "test_helper"

describe Content do
  let(:content) { Content.new }

  it "you can create new Content" do
    content.category = "book"
    content.title = "Test Book"
    content.creator = "Me"
    content.publication_year = "2009"
    content.description = "This be test"

    content.valid?.must_equal true
  end

  it "category must be valid" do
    content2 = Content.new
    content2.category = "Internet"
    content2.title = "Another Test"
    content2.creator = "Me"
    content2.publication_year = "2009"
    content2.description = "This be test"
    content2.valid?.must_equal false
  end

  it "must have a title on creation" do
    content3 = Content.new
    content3.category = "Internet"
    content3.creator = "Me"
    content3.publication_year = "2009"
    content3.description = "This be test"

    content3.valid?.must_equal false
  end

  it "must have a creator on creation" do
    content4 = Content.new
    content4.title = "Another Test"
    content4.category = "Internet"
    content4.publication_year = "2009"
    content4.description = "This be test"

    content4.valid?.must_equal false
  end

  it "must have a publication_year on creation" do
    content5 = Content.new
    content5.title = "Another Test"
    content5.category = "Internet"
    content5.description = "This be test"

    content5.valid?.must_equal false

  end

end
