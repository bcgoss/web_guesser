require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = Random.rand(100) + 1

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {number: SECRET_NUMBER, message: message}
end

def check_guess(guess)
  if guess == 0
    return "Guess a number between 1 and 100"
  end
  if guess > SECRET_NUMBER
    message = "Too High!"
  elsif guess < SECRET_NUMBER
    message = "Too Low!"
  else
    message = "You got it right!"
  end
end
