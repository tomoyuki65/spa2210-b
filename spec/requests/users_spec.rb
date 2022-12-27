require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user, uid: "mock_uid") }

  describe "POST /api/v1/users" do
    # JWT認証をスキップさせるためAuthenticationHelperを読み込み
    include AuthenticationHelper

    it "create user and return http success" do
      expect {
        post api_v1_users_url
        expect(response).to have_http_status(:success)
      }.to change(User, :count).by(1)
    end

  end

  describe "POST /api/v1/users (authentication not skip)" do

    it "no token error" do
      post api_v1_users_url
      expect(response).to have_http_status(:unauthorized)
    end
  
  end

  describe "DELETE /api/v1/users" do
    # JWT認証をスキップさせるためAuthenticationHelperを読み込み
    include AuthenticationHelper

    it "delete user and return http success" do
      registered_user = user
      expect {
        delete api_v1_users_url
        expect(response).to have_http_status(:success)
      }.to change(User, :count).by(-1)
    end
  
  end

  describe "DELETE /api/v1/users (authentication not skip)" do

    it "no token error" do
      delete api_v1_users_url
      expect(response).to have_http_status(:unauthorized)
    end

  end

end
