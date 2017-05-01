class Hanoi
  View_array= [
  " 0           ",
  " 00          ",
  " 000         ",
  " 0000        ",
  " 00000       ",
  " 000000      ",
  " 0000000     ",
  " 00000000    ",
  " 000000000   ",
  ]

  Tier_empty="             "

  def difficulty_set
    $disks=2
    while $disks < 3 || $disks > 9
      puts "\e[H\e[2J"
      puts "The difficulty of this puzzle increases with the number of disks."
      puts "You may select between 3 and 9 disks."
      puts ""
      puts "Please enter the number of disks for this game:"
      $disks=gets.chomp.to_i
      if $disks < 3 || $disks > 9
        invalid_input
      end
    end
  end

  def difficulty_adjust
    (4..$disks).each do |i|
    $stacks[0] << i
    end
  end

  def turn_counter
    $turns_taken = $turns_taken + 1
    puts "Turn: #{turns_taken}"
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

  def command_recieve_and_process
    while $stacks[2][$disks]!=$disks
      puts "\e[H\e[2J"
      $turns_taken = $turns_taken + 1
      puts "Turn: #{$turns_taken}"
      tower_view
      puts "Disk Select"
      $tower_select=gets.chomp.to_i
      $tower_select= $tower_select-1
        if (0..2).include? ($tower_select)
          puts "Move Select"
          $tower_move=gets.chomp.to_i
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
    tower_view
    puts "Hooray! You win!"
    puts "You completed the challenge in #{$turns_taken} turns!"
    puts ""
      if ((2**$disks)-1) == $turns_taken
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
    gets
    continue?
  end

  def continue?
    puts "\e[H\e[2J"
    puts "Care to try again?"
    puts 'Press "q" to quit, or "enter" to continue'
  end


  def introduction
    puts "\e[H\e[2J"
    puts "INSTRUCTIONS:"
    puts "1. Select a tower number, in order to pick a disk from that tower."
    puts "2. Next, select a tower that is either empty, or contains a larger disk"
    puts "   than the one you selected."
    puts "3. The disk will move from the tower you selected, to the tower you selected."
    puts "4. If you can move the entire tower from 1 to 3, you win!!!"
    puts '5. At any time, you may press "q" in order to quit'
    puts ""
    puts 'Press "Enter" to continue'
    gets
  end

  def layer_display(i)
    puts ""
    $stacks[0..2].each do |stack|
      if stack[i].nil?
        print Tier_empty
      else
        print View_array[($disks-stack[i])]
      end
    end
  end

  def base_display
    puts ""
    print "_______________________________________"
    puts ""
    puts ""
    print " 1            2            3"
    puts ""
    puts ""
  end

  def tower_view
    (1..$disks).reverse_each do |i|
      layer_display(i)
    end
    base_display
  end

  def play
    loop do
      $tower_select=0
      $tower_move=0
      $turns_taken=0
      $stacks = [[0,1,2,3], [0], [0]]
      introduction
      difficulty_set
      difficulty_adjust
      command_recieve_and_process
      end_game
    end
  end
end

game= Hanoi.new
game.play
