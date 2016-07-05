
class Player

  def initialize(choice)
    @choice = choice
  end

end




puts "Welcome to rock paper scissors"
puts "What is your choice"

choice = gets.chomp
player1 = Player.new(choice)


puts "computer chose #{player2.choice}"

puts "#{winning_player} wins"