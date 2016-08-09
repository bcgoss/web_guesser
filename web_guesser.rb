require 'sinatra'
require 'sinatra/reloader'
get '/' do
  number = Random.rand(100)
  "The secret number is #{number}!"
end
