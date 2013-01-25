Mvc::Application.routes.draw do
  match "login" => "login#login"

  match "/check" => "login#validate"
  match "/logout" => "login#logout"
  get "login/register"
  get "login/create"



  get "community" => "db#home"
  get "group/:id" => "db#group"
  get "group/:id/edit" => "db#edit_group"
  match "group/:id/save" => "db#update_group"
  get "person/:id" => "db#person"



  get "article/create" => "news#create"
  post "article/insert" => "news#insert"
  get "article/:id" => "news#article"


  root :to => 'news#home'

  
end
