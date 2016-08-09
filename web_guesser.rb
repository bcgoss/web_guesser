require 'sinatra'
require 'sinatra/reloader'
get '/' do
  number = Random.rand(100)
  erb :index, :locals => {number: number}
end
