require 'rails_helper'

RSpec.describe Comment, type: :model do
  comment = FactoryGirl.create :comment
  it "has a valid factory" do
    expect(comment).to be_valid
  end
  describe Post do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end