def introduction
  puts "\e[H\e[2J"
  puts "Welcome to"
  puts "Rock Paper Scissors: THE GAME"
  puts ""
  puts ""
  puts 'Press "Enter" to continue'
  gets
end

def rules
  puts "\e[H\e[2J"
  puts "How to play:"
  puts '-When prompted, please type "rock","paper", or "scissors" and hit "Enter".'
  puts "-Your brilliant AI opponent will also select rock, paper, or scissors."
  puts "-(I promise, she won't cheat)"
  puts "-Rock beats scissors, scissors beats paper, paper beats rock."
  puts ""
  puts 'ARE YOU READY? (press "Enter" to continue)'
  gets
end

def gets_or_timeout(to)
 # Use thread and time limit to wait for a key or refresh after time if no key is hit.
 t=Thread.new{ print "\n"; gets}
 t.join(to) #wait for end or number of seconds
 t.kill
end

def player_turn
  $choice= nil
  puts "\e[H\e[2J"
  puts "Player Score: #{$player_score}"
  puts "Computer Score: #{$ai_score}"
  puts ""
  puts "MAKE YOUR CHOICE:"
  $choice=gets.chomp.downcase
  if Options.include?($choice)
    puts ""
    puts ""
  else
    puts "\e[H\e[2J"
    puts "ERROR"
    gets_or_timeout(3)
  end
end

def computer_turn
  ai_choice= nil
  ai_choice=Options.sample
  puts "The AI chose #{ai_choice}"
  if ai_choice==$choice
    puts "You TIE!"
    gets_or_timeout(3)
  elsif Options.find_index($choice)==0
    if Options.find_index(ai_choice)==1
      puts "YOU LOSE!"
      gets_or_timeout(3)
      $ai_score=$ai_score+1
    elsif Options.find_index(ai_choice)==2
      puts "You WIN!"
      gets_or_timeout(3)
      $player_score=$player_score+1
    end
  elsif Options.find_index($choice)==1
    if Options.find_index(ai_choice)==2
      puts "YOU LOSE!"
      gets_or_timeout(3)
      $ai_score=$ai_score+1
    elsif Options.find_index(ai_choice)==0
      puts "You WIN!"
      gets_or_timeout(3)
      $player_score=$player_score+1
    end
  elsif Options.find_index($choice)==3
    if Options.find_index(ai_choice)==0
      puts "YOU LOSE!"
      gets_or_timeout(3)
      $ai_score=$ai_score+1
    elsif Options.find_index(ai_choice)==1
      puts "You WIN!"
      gets_or_timeout(3)
      $player_score=$player_score+1
    end
  end
end

Options=['rock', 'paper', 'scissors']
$player_score=0
$ai_score=0
introduction
rules
loop do
  player_turn
  computer_turn
end
