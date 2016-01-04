
class RockjPaperScissors

    THROWS =  [ "rock", "paper", "scissors" ]

    def game
        loop do 
            puts "enter rock, paper, or scissors:"
            input = gets.chomp 
            unless valid_input?
                puts "invalid input, try again"
                next
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

    end


end

 
