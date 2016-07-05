height = 3
# towers= [[], [], [], [], []]

# towers= [["o", "oooo"], ["oo"], ["ooo"]]

# (1..height).each do |i|
#   towers[0] << ("o"*i).center(height+2)
# end

# towers[1][0], towers[0][0] = towers[0][0], " "*(height+2)

# puts "#{towers[0][0]}#{towers[1][0]}"
# print towers
# puts "#{(("-"*height).center(height+2))*3}"
# bottom_row = ""
# ("1".."3").each {|ele| bottom_row += ele.center(height+2)}
# puts "#{bottom_row}"


# [[o, oo], ["", ooo], ["", "", ""]]

# towers = [["o", "oo"], Array.new(height, "i"), Array.new(height, "i")]

towers = [["o", "oo", "ooo"], Array.new(height, "iii"), Array.new(height, "i")]

# puts "#{towers[0][0].center(height + 2)}#{towers[1][0].center(height + 2)}#{towers[2][0].center(height + 2)}"
# puts "#{towers[0][1].center(height + 2)}#{towers[1][1].center(height + 2)}#{towers[2][1].center(height + 2)}"
# puts "#{towers[0][2].center(height + 2)}#{towers[1][2].center(height + 2)}#{towers[2][2].center(height + 2)}"

height.times {|i| puts "#{towers[0][i].center(height + 2)}#{towers[1][i].center(height + 2)}#{towers[2][i].center(height + 2)}" }
puts "#{(("-"*height).center(height+2))*3}"
bottom_row = ""
("1".."3").each {|ele| bottom_row += ele.center(height+2)}
puts "#{bottom_row}"
