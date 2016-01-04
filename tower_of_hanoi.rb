# Tower Of Hanoi

class TowerOfHanoi
    def initialize (height = 3)
        @height = height
        @peg1 = []
        @peg2 = []
        @peg3 = []
        @winner_peg = []

        @height.downto 1 do | i |
            @peg1 << i
            @winner_peg << i
        end
        @peg_hash = { 1 =>@peg1, 2=>@peg2, 3=>@peg3 }
    end

    def play_game
        display_game_state

        loop do
            illegal_move = false

            input_hash = get_input

            break if input_hash[:quit]

            p input_hash
            if invalid_inputs?(input_hash[:from], input_hash[:to])
                puts "Bad input, try again."
                next
            end

            illegal_move = move(input_hash[:from],input_hash[:to])

            if check_winner?
                puts "Congratulations! You win!"
                break
            end

            puts "Illegal Move, try again." if illegal_move
        end
    end

    def get_input
        input_hash = {from: 0, to: 0, quit: false}
        puts "Enter move ('from, to' or 'q' to quit)"
        print "> "

        move_string = gets.chomp
        if move_string == "q"
            input_hash[:quit] = true
        else
            input_hash[:from], input_hash[:to] = move_string.split(',').map(&:to_i)
        end
        input_hash
    end

    def invalid_inputs?(from, to)
         from < 1 || from > 3 || to < 1 || to > 3
     end

     def move(from, to)
        from_peg = @peg_hash[from]
        to_peg = @peg_hash[to]

        illegal_move = false
        illegal_move = true if from_peg == []
        illegal_move = true if to_peg[-1] != nil && from_peg[-1] > to_peg[-1]

        to_peg << from_peg.pop unless illegal_move
        display_game_state
        illegal_move
    end

    def check_winner?
       @peg3 == @winner_peg && @peg1 == [] && @peg2 == []
    end

    def display_game_state
        @peg_hash.values

        output  = []
        (@height - 1).downto 0 do | i |
            line = []
            @peg_hash.each do | key, peg |
                value = peg[ i ] || 0
                character = ""
                character += ("-" * value)
                character = character.ljust @height
                line << character
            end
            output << line.join("|")
        end
        puts output.join("\n")
    end
    end


tower = TowerOfHanoi.new(3)
tower.play_game