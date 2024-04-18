require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

# router + controller
get "/" do
  # "Hello batch 1638!"
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do
  # binding.pry
  restaurant_id = params[:id]
  @restaurant = Restaurant.find(restaurant_id)
  erb :show
end

post "/restaurants" do
  # get the inputs from the form
  name = params[:name]
  address = params[:address]
  # create a new restaurant instance
  restaurant = Restaurant.new(name: name, address: address)
  # save in the db
  restaurant.save
  redirect "/"
end


# HTTP VERBS

# GET => to get data
# POST => to create data
# PUT/PATCH => to update
# DELETE => to delete
