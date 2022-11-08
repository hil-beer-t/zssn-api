scope module: :v1, defaults: { format: :json }, constraints: ApiConstraints.new(version: 1) do
  resources :survivors
end 