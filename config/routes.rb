Rails.application.routes.draw do
  scope module: :public do
    get 'homes/top'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/check'
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
