require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    must_respond_with :success
  end

  it "should show an individual album" do
      get album_path(contents(:hacking).id)
      must_respond_with :success
  end

  it "should get an edit page" do
    get edit_album_path(contents(:hacking).id)
    must_respond_with :success
  end

  it "should update an album" do
    patch album_path(contents(:hacking).id), params: {content: { description: "Test" } }
    must_respond_with :found
    must_respond_with :redirect
    must_redirect_to album_path

  end

  it "should delete an album object" do
    proc {
  # run the delete verb on the post_path with a param equal to 1
  delete album_path(contents(:hacking).id)
  }.must_change 'Content.count', -1
  end

  it "should get the new page" do
    get new_album_path
    must_respond_with :success

  end

  it "should make a new album object" do
    proc   {
    post albums_path, params: { content:
       { category: "album",
         title: "Some post",
         creator: "Me",
         publication_year: "2017"
         }  }
  }.must_change 'Content.count', 1

  must_respond_with :redirect
  must_redirect_to albums_path
  end

end
