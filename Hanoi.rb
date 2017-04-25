require_relative 'hanoi_view'

$tower_select=0
$tower_move=0
$turns_taken=0

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
      puts "\e[H\e[2J"
      puts "ERROR: Invalid entry"
      puts ""
      puts "Please enter a value between 3 and 9"
      puts 'Press "Enter" to continue'
      gets
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

#Note: The code 'puts "\e[H\e[2J"' clears the screen. Why? I don't know.

def invalid_move
  $turns_taken = $turns_taken -1
  puts "\e[H\e[2J"
  puts "ERROR: Invalid move"
  puts 'Press "Enter" to continue'
  gets
end

def execute_commands
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
          puts "\e[H\e[2J"
          puts "ERROR: Invalid Input"
          puts 'Press "Enter" to continue'
          gets
          redo
        end
      else
        puts "\e[H\e[2J"
        puts "ERROR: Invalid Input"
        puts 'Press "Enter" to continue'
        gets
        redo
      end

      if $stacks[$tower_select].last > $stacks[$tower_move].last
        $stacks[$tower_move] << $stacks[$tower_select].pop
      else
        invalid_move
      end

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
      puts "The minimum number of turns required to complete the Hanoi Tower"
      puts "with #{$disks} disks is #{(2**$disks)-1}."
      puts "You went #{$turns_taken - ((2**$disks)-1) } over."
    end
  puts ""
  puts "Care to try again?"
  gets
end

#Start of program

loop do
  $stacks = [[0,1,2,3], [0], [0]]
  introduction
  difficulty_set
  difficulty_adjust
  execute_commands
  end_game
end
