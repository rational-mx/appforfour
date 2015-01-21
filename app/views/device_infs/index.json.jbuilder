json.array!(@device_infs) do |device_inf|
  json.extract! device_inf, :id, :browser, :os, :post_id, :comment_id
  json.url device_inf_url(device_inf, format: :json)
end
