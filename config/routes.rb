Rails.application.routes.draw do
  scope '/api' do
    resources :stories, only: %I[ index create ] do
      resources :pages, only: %I[ show ]
    end
  end

  get '*path' => 'application#res_404'
end
