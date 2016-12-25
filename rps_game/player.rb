class Player
  attr_reader :player_type
  attr_accessor :nickname

  def initialize(player_type, nickname = nil)
    @player_type = player_type
    @nickname = nickname
  end

  def get_move(input_display = nil)
    if @player_type == 'computer'
      %w(r p s).sample
    else
      puts "#{@nickname}'s turn >"
      puts "Rock, paper, or scissors?"
      input_display.nil? ? input = gets.chomp : input = STDIN.noecho(&:gets).chomp
      until valid_input?(input)
        puts "Invalid input! Please enter r, p, or s. Try again:"
        input_display.nil? ? input = gets.chomp : input = STDIN.noecho(&:gets).chomp
      end
      input
    end
  end

  private

  def valid_input?(input)
    return true if %w(r p s q).include?(input)
    false
  end
end