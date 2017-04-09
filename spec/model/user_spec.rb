require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryGirl.build :user
  it "has a valid factory" do
    expect(user).to be_valid
  end
  describe User do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end