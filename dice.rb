require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do

  "
  <head>
    <title>Dice Roller</title>
    <style>
    .navbar {
      display: flex;
      justify-content: space-around;
      color: white;
      background-color: black;
      padding: 30px;
    }

    body {
    background-color: gray;
    font-size: 1.5rem;
    }
    
    .choose {
      padding: 5vh;
      display: flex;
      flex-direction: column;
      background-color: #b282ff;
    }
    
    a {
     background-color: #d9c2ff;
     align-self: center;
     padding: 15px;
     border-radius: 25px;
     margin: 10px;
     text-decoration: none;
    }

    a:hover {
      box-shadow: 0 0 5px 5px white;
    }

    </style>
  </head>
  <body>
    <div class=navbar>
      <div>
        <a href=\"/dice/2/6\">2D6</a>
      </div>
      <div>
        <a href=\"/dice/2/10\">2D10</a>
      </div>
      <div>
        <a href=\"/dice/1/20\">1D20</a>
      </div>
      <div>
        <a href=\"/dice/5/4\">5D4</a>
      </div>
    </div>
  <h1>Dice Roller</h1>
  <div class=choose>
    <a href=\"/dice/2/6\"> Roll two 6-sided dice</a>
    <a href=\"/dice/2/10\"> Roll two 10-sided dice</a>
    <a href=\"/dice/1/20\"> Roll one 20-sided die</a>
    <a href=\"/dice/5/4\"> Roll five 4-sided dice</a>
  </div>
  </body>"
end


get("/dice/2/6") do                 # 2 six sided dice
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d6</h1>
  <p>#{outcome}</p>
  <a href=\"/\">Home</a>"
end


get("/dice/2/10") do                # 2 10 sided dice
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  "<h1>2d10</h1>
  <p>#{outcome}</p>
  <a href=\"/\">Home</a>"
end

get("/dice/1/20") do              # 1 20 sided die
  first_die = rand(1..20)
  outcome = "You rolled a #{first_die} for a total of #{first_die}."

  "<h1>1d20</h1>
  <p>#{outcome}</p>
  <a href=\"/\">Home</a>"
end

get("/dice/5/4") do                # 5 4-soded dice
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)

  sum = first_die + second_die + third_die + fourth_die + fifth_die
  outcome = "You rolled a #{fifth_die}, #{second_die}, #{third_die}, #{fourth_die}, and a #{fifth_die}. The total is #{sum}."

  "<h1>5d4</h1>
  <p>#{outcome}</p>
  <a href=\"/\">Home</a>"
end
