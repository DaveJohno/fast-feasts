get '/' do
  erb :'fast_feasts/index'
end

get '/fast_feasts/new-order' do
  erb :'fast_feasts/new-order'
end

get '/fast_feasts/add-meal' do
  erb :'fast_feasts/add-meal'
end