Rails.application.routes.draw do
  devise_for :costomers
  scope module: :public do
    root to: 'homes#top'
    get 'homes/top'
    get 'customers/mypage' => 'customers#show'
    get 'customers/edit'
    get 'customers/check'
    patch 'customers/update'
     # 退会確認画面
    get  '/customers/check' => 'customers#check'
 # 論理削除用のルーティング
    patch  '/customers/withdraw' => 'customers#withdraw'
  end
  namespace :admin do
    get 'homes/top'

  end

  get '/' => 'public/homes#about'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
