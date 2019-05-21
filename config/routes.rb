Rails.application.routes.draw do
  get '*path' => 'application#res_404'
end
