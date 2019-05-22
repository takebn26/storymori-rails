Rails.application.routes.draw do
  scope '/api' do
    resources :stories, only: %I[ index ]
  end

  get '*path' => 'application#res_404'
end
