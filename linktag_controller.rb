require 'sinatra'
require 'sinatra/contrib/all' if development?
require_relative './models/linktag'
require 'json'

# INDEX
get '/linktags' do
  @linktags = Linktag.all
  erb :index
end

# NEW
get "/linktags/new" do
  erb :new
end

# SHOW
get "/linktags/:id" do
  @linktag = Linktag.select(params[:id])
  erb :show
end

# CREATE
post "/linktags" do 
  @linktag = Linktag.new(params)
  @linktag.save
  redirect to "/linktags"
end

# EDIT
get "/linktags/:id/edit" do
  @linktag = Linktag.select(params[:id])
  erb :edit
end

# UPDATE
post '/linktags/:id' do
@linktag = Linktag.update(params)
redirect to "/linktags/#{params[:id]}"
end

# DELETE
post "/linktags/:id/delete" do
  Linktag.destroy(params[:id])
  redirect to '/linktags'
end