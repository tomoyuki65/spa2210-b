require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "should be valid" do
    expect(user).to be_valid
  end

  it "uid should be present" do
    user.uid = " "
    expect(user).to be_invalid
  end

end
