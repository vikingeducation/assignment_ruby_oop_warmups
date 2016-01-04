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
        output.join("\n")
    end



end

t = TowerOfHanoi.new(7)
puts t.display_game_state

