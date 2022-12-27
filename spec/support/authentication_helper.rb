module AuthenticationHelper
  # クラスメソッドを拡張
  extend ActiveSupport::Concern

  # include時に以下を実行する
  included do
    before do
      # ApplicationControllerのメソッド「authenticate」をスタブ化
      allow_any_instance_of(ApplicationController).to receive(:authenticate)
      # Api::V1::UsersControllerのメソッド「payload_uid」をスタブ化
      allow_any_instance_of(Api::V1::UsersController).to receive(:payload_uid).and_return("mock_uid")
    end
  end
end