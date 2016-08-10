require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = Random.rand(100) + 1

get '/' do
  guess = params['guess'].to_i
  cheat = params['cheat']
  message = check_guess(guess, cheat)
  erb :index, :locals => {number: SECRET_NUMBER, message: message}
end

def check_guess(guess, cheat)
  cheat_message(cheat) + answer(guess)
end

def cheat_message(cheat)
  if cheat
    "The secret number is #{SECRET_NUMBER}, AND YOU CHEATED!</p><p>"
  else
    ""
  end
end

def answer(guess)
  return "Guess a number between 1 and 100" if guess == 0
  return "Way too high!" if way_too_high?(guess)
  return "Way too low!" if way_too_low?(guess)
  return "Too high!" if guess > SECRET_NUMBER
  return "Too low!" if guess < SECRET_NUMBER
  "You got it right!</p><p>The secret number is #{SECRET_NUMBER}"
end

def way_too_high?(guess)
  guess > SECRET_NUMBER and guess - 5 > SECRET_NUMBER
end

def way_too_low?(guess)
  guess < SECRET_NUMBER and guess + 5 < SECRET_NUMBER
end
