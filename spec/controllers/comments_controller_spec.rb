require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should let all user see index" do
      get :index
      expect( response ).to be_successful
    end

    it "should redirect unauthenticated user to signin from new post" do
      get :new
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should let signed in user access post" do
      login_with create( :account )
      get :new
      expect( response ).to render_template( :new )
    end
  end
end