Tier_1=" 0           "
Tier_2=" 00          "
Tier_3=" 000         "
Tier_4=" 0000        "
Tier_5=" 00000       "
Tier_6=" 000000      "
Tier_7=" 0000000     "
Tier_8=" 00000000    "
Tier_9=" 000000000   "
Tier_0="             "

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

def tower_view
  #Top layer display

  puts ""
  if $stacks[0][9]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][-9]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][9]==($disks)
    print "#{Tier_1}"
  else
    print "#{Tier_0}"
  end

  #Layer -1 display
  puts ""
  if $stacks[0][8]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][8]==($disks-1)
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

  if $stacks[1][8]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][8]==($disks-1)
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][8]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][8]==($disks-1)
    print "#{Tier_2}"
  else
    print "#{Tier_0}"
  end

#layer -2 display
puts ""
  if $stacks[0][7]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][7]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[0][7]==($disks-2)
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

  if $stacks[1][7]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][7]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[1][7]==($disks-2)
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][7]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][7]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[2][7]==($disks-2)
    print "#{Tier_3}"
  else
    print "#{Tier_0}"
  end

#Layer -3 display
puts ""
  if $stacks[0][6]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][6]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[0][6]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[0][6]==($disks-3)
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  if $stacks[1][6]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][6]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[1][6]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[1][6]==($disks-3)
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][6]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][6]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[2][6]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[2][6]==($disks-3)
    print "#{Tier_4}"
  else
    print "#{Tier_0}"
  end

  #Layer -4 display

puts ""
  if $stacks[0][5]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][5]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[0][5]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[0][5]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[0][5]==($disks-4)
    print "#{Tier_5}"
  else
    print "#{Tier_0}"
  end

  if $stacks[1][5]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][5]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[1][5]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[1][5]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[1][5]==($disks-4)
    print "#{Tier_5}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][5]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][5]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[2][5]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[2][5]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[2][5]==($disks-4)
    print "#{Tier_5}"
  else
    print "#{Tier_0}"
  end

  #Layer -5 display

puts ""
  if $stacks[0][4]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][4]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[0][4]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[0][4]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[0][4]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[0][4]==($disks-5)
    print "#{Tier_6}"
  else
    print "#{Tier_0}"
  end

  if $stacks[1][4]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][4]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[1][4]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[1][4]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[1][4]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[1][4]==($disks-5)
    print "#{Tier_6}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][4]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][4]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[2][4]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[2][4]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[2][4]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[2][4]==($disks-5)
    print "#{Tier_6}"
  else
    print "#{Tier_0}"
  end

#Layer -6 display

puts ""
  if $stacks[0][3]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][3]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[0][3]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[0][3]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[0][3]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[0][3]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[0][3]==($disks-6)
    print "#{Tier_7}"
  else
    print "#{Tier_0}"
  end

  if $stacks[1][3]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][3]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[1][3]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[1][3]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[1][3]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[1][3]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[1][3]==($disks-6)
    print "#{Tier_7}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][3]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][3]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[2][3]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[2][3]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[2][3]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[2][3]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[2][3]==($disks-6)
    print "#{Tier_7}"
  else
    print "#{Tier_0}"
  end

#Layer -7 display

puts ""
  if $stacks[0][2]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][2]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[0][2]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[0][2]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[0][2]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[0][2]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[0][2]==($disks-6)
    print "#{Tier_7}"
  elsif $stacks[0][2]==($disks-7)
    print "#{Tier_8}"
  else
    print "#{Tier_0}"
  end

  if $stacks[1][2]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][2]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[1][2]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[1][2]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[1][2]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[1][2]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[1][2]==($disks-6)
    print "#{Tier_7}"
  elsif $stacks[1][2]==($disks-7)
    print "#{Tier_8}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][2]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][2]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[2][2]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[2][2]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[2][2]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[2][2]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[2][2]==($disks-6)
    print "#{Tier_7}"
  elsif $stacks[2][2]==($disks-7)
    print "#{Tier_8}"
  else
    print "#{Tier_0}"
  end

#Layer -8 display

puts ""
  if $stacks[0][1]==($disks)
    print "#{Tier_1}"
  elsif $stacks[0][1]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[0][1]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[0][1]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[0][1]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[0][1]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[0][1]==($disks-6)
    print "#{Tier_7}"
  elsif $stacks[0][1]==($disks-7)
    print "#{Tier_8}"
  elsif $stacks[0][1]==($disks-8)
    print "#{Tier_9}"
  else
    print "#{Tier_0}"
  end


  if $stacks[1][1]==($disks)
    print "#{Tier_1}"
  elsif $stacks[1][1]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[1][1]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[1][1]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[1][1]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[1][1]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[1][1]==($disks-6)
    print "#{Tier_7}"
  elsif $stacks[1][1]==($disks-7)
    print "#{Tier_8}"
  elsif $stacks[1][1]==($disks-8)
    print "#{Tier_9}"
  else
    print "#{Tier_0}"
  end

  if $stacks[2][1]==($disks)
    print "#{Tier_1}"
  elsif $stacks[2][1]==($disks-1)
    print "#{Tier_2}"
  elsif $stacks[2][1]==($disks-2)
    print "#{Tier_3}"
  elsif $stacks[2][1]==($disks-3)
    print "#{Tier_4}"
  elsif $stacks[2][1]==($disks-4)
    print "#{Tier_5}"
  elsif $stacks[2][1]==($disks-5)
    print "#{Tier_6}"
  elsif $stacks[2][1]==($disks-6)
    print "#{Tier_7}"
  elsif $stacks[2][1]==($disks-7)
    print "#{Tier_8}"
  elsif $stacks[2][1]==($disks-8)
    print "#{Tier_9}"
  else
    print "#{Tier_0}"
  end

#Base Layer; always present
  puts ""
  print "_______________________________________"
  puts ""
  puts ""
  print " 1            2            3"
  puts ""
  puts ""

end
