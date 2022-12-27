class ApplicationController < ActionController::API
  # Firebase Authenticator用のモジュールを読み込み
  include FirebaseAuthenticator

  # エラー用クラス設定
  class NoIdtokenError < StandardError; end
  rescue_from NoIdtokenError, with: :no_idtoken

  # idTokenの検証を実行
  before_action :authenticate
  skip_before_action :authenticate, only: [:test]

  # テスト用のAPIを追加
  def test
    # テスト用のJSON形式のオブジェクト
    test_json_obj = [
      { id: 1, title: "First Text", text: "最初のテキスト" },
      { id: 2, title: "Second Text", text: "2番目のテキスト" },
      { id: 3, title: "Third Text", text: "3番目のテキスト" },
      { id: 4, title: "Four Text", text: "4番目のテキスト" },
    ]

    # JSON形式で出力
    render json: test_json_obj
  end

  private

    # idTokenの検証
    def authenticate
      # idTokenが付与されていない場合はエラー処理
      raise NoIdtokenError unless request.headers["Authorization"]
      @payload = decode(request.headers["Authorization"]&.split&.last)
    end

    # idTokenが付与されていない場合
    def no_idtoken
      render json: { error: { messages: ["idTokenが付与されていないため、認証できませんでした。"] } }, status: :unauthorized
    end

end
