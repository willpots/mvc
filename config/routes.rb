Mvc::Application.routes.draw do
  match "login" => "login#login"

  match "check" => "login#validate"
  match "logout" => "login#logout"
  get "login/register"
  get "login/create"



  get "community" => "db#home"


  #Group Stuff
  get "group/new" => "db#new_group"
  match "group/new/save" => "db#create_group"
  get "group/:id" => "db#group"
  match "group/:id/save" => "db#update_group"
  get "group/:id/edit" => "db#edit_group"



  get "person/:id" => "db#person"



  get "article/create" => "news#create"
  post "article/insert" => "news#insert"
  get "article/:id" => "news#article"


  root :to => 'news#home'

  
end
