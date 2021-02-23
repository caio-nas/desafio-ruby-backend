Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ler_arquivos
  #resources :transacaos
  
  #get 'ler_arquivos/index' => 'ler_arquivos#index'
  post 'ler_arquivos/ler_arquivo' => 'ler_arquivos#ler_arquivo'
  get 'transacaos/saldo_por_loja' => 'transacaos#saldo_por_loja'
  
  root to: 'ler_arquivos#index'
end
