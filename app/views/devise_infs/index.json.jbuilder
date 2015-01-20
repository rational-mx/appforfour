json.array!(@devise_infs) do |devise_inf|
  json.extract! devise_inf, :id, :browser, :os, :post_id, :comment_id
  json.url devise_inf_url(devise_inf, format: :json)
end
