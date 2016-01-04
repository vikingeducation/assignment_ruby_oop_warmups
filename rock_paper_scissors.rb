
class RockPaperScissors

    attr_reader :player_throw, :computer_throw

    THROWS =  [ "rock", "paper", "scissors" ]

    def game
        loop do 
            puts "How many players? (1 or 2)"
            @num_players = gets.chomp.to_i
            if @num_players == 1 || @num_players == 2
                break
            else 
                puts "Invalid input. Enter 1 or 2."
            end
        end

        player_throw = get_player_throw
        puts "Player 1:"
        @player_1 = Player.new("Player 1", player_throw)

        if @num_players == 2
            puts "Player 1:"
            @player_2 = Player.new("Player 2", get_player_throw)
        else 
            @player_2 = Player.new("Computer", random_throw)
            puts "Computer throws: #{@player_2.throw}"
        end

        puts determine_winner
    end

    def get_player_throw
        loop do 
            puts "enter rock, paper, or scissors:"
            player_throw = gets.chomp 
            if valid_input?(player_throw)
                return player_throw
            else 
                puts "invalid input, try again"
            end
        end
    end

    def random_throw
        THROWS.sample
    end

    def valid_input? (s)
        THROWS.include? s.downcase
    end

    def determine_winner
        player_throw = @player_1.throw
        computer_throw = @player_2.throw
        ret_string = "draw" if player_throw == computer_throw
        if player_throw == "rock" && computer_throw == "paper" ||
            player_throw == "paper" && computer_throw == "scissors" ||
            player_throw == "scissors" && computer_throw == "rock"
            ret_string = "#{@player_2.name} wins"
        end
        if computer_throw == "rock" && player_throw == "paper" ||
            computer_throw == "paper" && player_throw == "scissors" ||
            computer_throw == "scissors" && player_throw == "rock"
            ret_string = "#{@player_1.name} wins"
        end
        ret_string
    end
end

class Player
    attr_accessor :name, :throw

    def initialize(name, throw)
        @name = name
        @throw = throw
    end
end

game = RockPaperScissors.new
game.game