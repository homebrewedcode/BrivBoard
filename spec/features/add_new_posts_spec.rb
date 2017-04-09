require 'rails_helper'

feature "AddNewPosts", :type => :feature do
  it "should require the user log in before adding a post" do
    login_as create( :user ), scope: :user

    visit new_post_path
    # puts page.body

    within "#new_post" do
      fill_in "post_title", with: "Post title"
      fill_in "post_body", with: "Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis."
    end

    click_link_or_button "Create Post"

    expect( Post.count ).to eq(1)
    expect( Post.first.title).to eq( "Post title")
    expect( Post.first.body).to eq( "Zombie ipsum reversus ab viral inferno, nam rick grimes malum cerebro. De carne lumbering animata corpora quaeritis.")
  end
end