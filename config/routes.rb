Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"
  get "/companies", to: "companies#index"
  get "/companies/new", to: "companies#new"
  post "/companies", to: "companies#create"
  get "/companies/:id", to: "companies#show"
  get "/companies/:id/edit", to: "companies#edit"
  patch "/companies/:id", to: "companies#update"
  delete "/companies/:id", to: "companies#destroy"
  get "/companies/:id/employees", to: "company_employees#index"
  get "/companies/:id/employees/new", to: "employees#new"
  post '/companies/:id/employees', to: "employees#create"
  
  get "/employees", to: "employees#index"
  get "/employees/:id", to: "employees#show"
  get "/employees/:id/edit", to: "employees#edit"
  patch "/employees/:id", to: "employees#update"
  delete "/employees/:id", to: "employees#destroy"
end
