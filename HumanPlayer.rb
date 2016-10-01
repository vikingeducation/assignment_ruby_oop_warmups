class  HumanPlayer
  attr_accessor :choice

  def get_decision
    loop do
      @choice = ask_for_choice
      if validate_choice_format(@choice)
        break
      end
    end
    @choice
  end

  def validate_choice_format(var_choice)
    if var_choice.size == 1 && ("rps".include? var_choice)
      true
    else
      puts "You have entered incorrect letter. Please make correct selection."
    end
  end

  def ask_for_choice
    puts "Please call your selection by typing 
          'p' for paper, 's' for scissors or 'r' for rock"
    gets.chomp
  end
end