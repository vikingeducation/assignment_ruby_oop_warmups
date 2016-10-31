moves = [:rock,:paper,:scissors]

computer_move = moves[rand(0..2)]

puts "Rock paper scissors game"
put "Enter your move: [r]ock, [p]aper or [s]cissors \n >> "

player_move = gets.chomp

def evaluate_winner(move_1,move_2)
  case move_1
  when :rock
    return 1 if move_2 == :scissors
    return 0 if move_2 == :rock
    return -1 if move_2 == :paper
  when :scissors
    return 1 if move_2 == :paper
    return 0 if move_2 == :scissors
    return -1 if move_2 == :rock
  when :paper
    return 1 if move_2 == :rock
    return 0 if move_2 == :paper
    return -1 if move_2 == :scissors    
  end
end

winner = evaluate_winner(player_move,computer_move)

case winner
when 1
  puts "You win!"
when 0
  puts "Tie"
when -1
  puts "You lose"
end


