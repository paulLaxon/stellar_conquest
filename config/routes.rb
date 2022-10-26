Rails.application.routes.draw do
  get 'html_pages/home'
  get 'html_pages/help'
  get 'games/game_sheet'
  get 'games/board'
  get 'games/game'
  root to: 'html_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
