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

def layer_display(i)
  puts ""
  $stacks[0..2].each do |stack|
    if stack[i]==($disks)
      print "#{Tier_1}"
    elsif stack[i]==($disks-1)
      print "#{Tier_2}"
    elsif stack[i]==($disks-2)
      print "#{Tier_3}"
    elsif stack[i]==($disks-3)
      print "#{Tier_4}"
    elsif stack[i]==($disks-4)
      print "#{Tier_5}"
    elsif stack[i]==($disks-5)
      print "#{Tier_6}"
    elsif stack[i]==($disks-6)
      print "#{Tier_7}"
    elsif stack[i]==($disks-7)
      print "#{Tier_8}"
    elsif stack[i]==($disks-8)
      print "#{Tier_9}"
    else
      print "#{Tier_0}"
    end
  end
end

def tower_view
  (1..9).reverse_each do |i|
    layer_display(i)
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
