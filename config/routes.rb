Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # テスト用のルーティング
  scope "api" do
    scope "v1" do
      get "/test", to: "application#test"
    end
  end

  # API用のルーティング
  namespace "api" do
    namespace "v1" do
      resource :users, only: [:create, :destroy]
    end
  end

end
