require "./player"

class Human < Player

  attr_reader :name

  def set_name

    puts "What name should we inscribe on your tombstone?"
    @name = gets.chomp.capitalize

  end



  def choose_weapon
    puts "\nChoose your weapon! (or 'q' to run home to mommy)"
    weapon = gets.chomp.downcase
    
    case weapon
    when "rock"
      return "rock"
    when "paper"
      return "paper"
    when "scissors"
      return "scissors"
    when "q"
      exit
    else
      puts "\nThat weapon is not allowed in this fight."
      puts "Choose Rock, Paper or Scissors."
    end

  end

end