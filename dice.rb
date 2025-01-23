require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  @rolls = []
  2.times do
    die = rand(1..6)     # random number
    @rolls.push(die)     # push the random number to the arrat
  end                    # 2 six sided dice
  @outcome = @rolls[0] + @rolls[1]  # sum of the two dice
  erb(:two_six)          # the route goes to the respective erb view
end


get("/dice/2/10") do                # 2 10 sided dice
  @rolls = []
  2.times do
    die = rand(1..10)
    @rolls.push(die)
  end
  @outcome = @rolls[0] + @rolls[1]
  erb(:two_ten)
end

get("/dice/1/20") do              # 1 20 sided die
  @rolls = []
  1.times do
    die = rand(1..20)
    @rolls.push(die)
  end
  @outcome = @rolls[0]
  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []
  5.times do
    die = rand(1..4)
    @rolls.push(die)
  end
  @outcome = @rolls[0] + @rolls[1] + @rolls[2] + @rolls[3] + @rolls[4]
  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []
  6.times do
    die = rand(1..100)
    @rolls.push(die)
  end
  @outcome = @rolls[0] + @rolls[1] + @rolls[2] + @rolls[3] + @rolls[4] + @rolls[5]
  erb(:one_hundred_six)
end
