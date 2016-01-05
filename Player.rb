class Player

	def initialize
		@from = nil
		@to = nil
	end

  #get user's input
  def get_input
    puts "Please enter move: "
    @input = gets.chomp
    
    quit if @input == 'q' #Move to game class
    input1, input2 = @input.split.map(&:to_i)
    #check input
    input_valid?(input1, input2)
  end

    #check if input is valid
  def input_valid?(input1, input2)
    if(1..3).include?(input1 && input2)
      @from = input1 -1
      @to = input2 -1
    else
      puts "Please make sure you entered in format 'num1, num2' between ranges 1 & 3"
      get_input
    end
    #run additional test to see if move is legal
    
  end

end