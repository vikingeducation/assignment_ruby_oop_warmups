class Hanoi
  def array_create
    $view_array=[]
    zeros= 0
    $tier_empty= String.new
    ($disks + 1).times do
      $tier_empty << " "
    end

    $disks.times do
      array_disk= String.new
      zeros=zeros+1
      zeros.times do
        array_disk<< "0"
      end
      ($disks - zeros + 1).times do
        array_disk<< " "
      end
      $view_array << array_disk
    end
  end

  def base_display
    puts ""
    (($disks*3)+3).times do
      print "_"
    end
    puts ""
    (1..3).each do |i|
      print "#{i}"
      ($disks).times do
        print " "
      end
    end
    puts ""
    puts ""
  end

  def difficulty_set
    $disks=0
    while $disks < 1 || $disks > 40
      puts "\e[H\e[2J"
      puts "The difficulty of this puzzle increases with the number of disks."
      puts "You may select between 1 and 40 disks."
      puts ""
      puts "Please enter the number of disks for this game:"
      $disks=gets.chomp.to_i
      if $disks > 12 && $disks <=40
        puts "\e[H\e[2J"
        puts "WARNING: Playing with #{$disks} disks will take at least #{(2**$disks)-1} turns,"
        puts "or #{((2**$disks)-1)/3600} hours to complete."
        puts ""
        puts "Continue? y/n"
        answer=gets.chomp
        if answer.downcase != "y"
          difficulty_set
        end
      end
      if $disks < 1 || $disks > 40
        invalid_input
      end
    end
  end

  def difficulty_adjust
    (1..$disks).each do |i|
    $stacks[0] << i
    end
  end

  def turn_counter
    $turns_taken = $turns_taken + 1
    puts "Turn: #{$turns_taken}"
  end

  def invalid_move
    $turns_taken = $turns_taken -1
    puts "\e[H\e[2J"
    puts "ERROR: Invalid move"
    puts 'Press "Enter" to continue'
    gets
  end

  def invalid_input
    puts "\e[H\e[2J"
    puts "ERROR: Invalid Input"
    puts 'Press "Enter" to continue'
    gets
  end

  def execute_command
    if $stacks[$tower_select].last > $stacks[$tower_move].last
      $stacks[$tower_move] << $stacks[$tower_select].pop
    else
      invalid_move
    end
  end

  def exit_or_restart(input)
    if input== "q"
      exit
    elsif input== "r"
      play
    end
  end

  def command_recieve_and_process
    while $stacks[2][$disks]!=$disks
      puts "\e[H\e[2J"
      $turns_taken = $turns_taken + 1
      puts "Turn: #{$turns_taken}"
      tower_view
      puts "Disk Select"
      $tower_select=gets.chomp
      exit_or_restart($tower_select)
      $tower_select= $tower_select.to_i
      $tower_select= $tower_select-1
        if (0..2).include? ($tower_select)
          puts "Move Select"
          $tower_move=gets.chomp
          exit_or_restart ($tower_move)
          $tower_move=$tower_move.to_i
          $tower_move=$tower_move-1
          if (0..2).include? ($tower_move)
          else
            invalid_input
            redo
          end
        else
          invalid_input
          redo
        end
        execute_command
    end
  end

  def end_game
    puts "\e[H\e[2J"
    puts "Turn: #{$turns_taken}"
    tower_view
    if $disks==1
      puts "Congratulations..."
      puts "Your mother must be so proud."
    else
      puts "Hooray! You win!"
      puts ""
      if((2**$disks)-1) == $turns_taken
        puts "You achieved a perfect score!"
      else
        puts "The Tower of Hanoi with #{$disks} disks can be beat "
        puts "in #{(2**$disks)-1} turns."
        if  ($turns_taken - ((2**$disks)-1))==1
          puts "You took 1 additional turn."
        else
          puts "You took #{$turns_taken - ((2**$disks)-1) } additional turns."
        end
      end
    end
    gets
    continue?
  end

  def continue?
    puts "\e[H\e[2J"
    puts "Try again?"
    puts 'Press "q" to quit, or "enter" to continue'
    response= gets.chomp
    if response== "q"
      exit
    end
  end


  def introduction
    puts "\e[H\e[2J"
    puts "INSTRUCTIONS:"
    puts "1. Select a tower number, in order to pick a disk from that tower."
    puts "2. Next, select a tower that is either empty, or contains a larger disk"
    puts "   than the one you selected."
    puts "3. The disk will move from the tower you selected, to the tower you selected."
    puts "4. If you can move the entire tower from 1 to 3, you win!!!"
    puts '5. During the game, at any time you may enter "q" to quit or "r" to restart.'
    puts ""
    puts 'Press "Enter" to continue'
    gets
  end

  def layer_display(i)
    puts ""
    $stacks[0..2].each do |stack|
      if stack[i].nil?
        print $tier_empty
      else
        print $view_array[($disks-stack[i])]
      end
    end
  end

  def tower_view
    (1..$disks).reverse_each do |i|
      layer_display(i)
    end
    base_display
  end

  def ai_set
    if File.exists?('Hanoi_ai.rb')
      require_relative "Hanoi_ai.rb"
      puts "Would you like assistance from the AI? y/n"
      answer=gets.chomp.downcase
      if answer== "y"
        puts "AI is enabled"
        gets
        ai_run
      end
      if answer=! "y"
        puts "AI is not enabled"
        gets
      end
    end
  end

  def play
    loop do
      $tower_select=0
      $tower_move=0
      $turns_taken=0
      $stacks = [[0], [0], [0]]
      introduction
      difficulty_set
      difficulty_adjust
      array_create
      ai_set
      command_recieve_and_process
      end_game
    end
  end
end

game= Hanoi.new
game.play

