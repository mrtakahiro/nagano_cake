Rails.application.routes.draw do
   # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :items, only: [:index, :show]
    get 'customers/mypage' => 'customers#show'

     # 退会確認画面
    get  '/customers/check' => 'customers#check'
 # 論理削除用のルーティング
    patch  '/customers/withdraw' => 'customers#withdraw'
  end

  get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
end
