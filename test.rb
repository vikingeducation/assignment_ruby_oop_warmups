height = 3
towers= [[], [], []]

#towers= [["o", "oooo"], ["oo"], ["ooo"]]

# (1..height).each do |i|
#   towers[0] << ("o"*i).center(height+2)
# end

# towers[1][0], towers[0][0] = towers[0][0], " "*(height+2)

# puts "#{towers[0][0]}#{towers[1][0]}"
#print towers
#puts "#{(("-"*height).center(height+2))*3}"
#bottom_row = ""
#("1".."3").each {|ele| bottom_row += ele.center(height+2)}
#puts "#{bottom_row}"


(1..height).each do |i|
  towers[0] <<  ("o" * i)
end

puts towers