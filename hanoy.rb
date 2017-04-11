#!/usr/bin/ruby

class Towers
  DISCS = {:e => 0,  :xs => 1, :s => 3, :m => 5, :l => 7}
  ICONS = {:e => " "*8, :xs => "   -    ", :s => "  ---   ", :m => " -----  ", :l => "------- " }
  EMPTY_TOWER = [:e, :e, :e, :e]
  FILLED_TOWER = [:l, :m, :s, :xs]

  def initialize
    @t1 = FILLED_TOWER
    @t2 = [:e, :e, :e, :e] # yeah, not that elegant
    @t3 = [:e, :e, :e, :e] # yeah, not that elegant
  end

  def show
    top_string = "#{ICONS[@t1[3]]}" + "#{ICONS[@t2[3]]}" + "#{ICONS[@t3[3]]}"
    mid_string = "#{ICONS[@t1[2]]}" + "#{ICONS[@t2[2]]}" + "#{ICONS[@t3[2]]}"
    low_string = "#{ICONS[@t1[1]]}" + "#{ICONS[@t2[1]]}" + "#{ICONS[@t3[1]]}"
    b_string   = "#{ICONS[@t1[0]]}" + "#{ICONS[@t2[0]]}" + "#{ICONS[@t3[0]]}"
    puts(top_string)
    puts(mid_string)
    puts(low_string)
    puts(b_string)
  end

  def move(from_tower_index, to_tower_index)
    towers = [@t1, @t2, @t3]
    from_tower = towers[from_tower_index -1]
    to_tower = towers[to_tower_index -1]

    if from_tower_index == to_tower_index
      puts("Sorry, same tower")
    elsif from_tower == [:e, :e, :e, :e]
      puts("Sorry, there are no discs in this tower")
    else
      i = 3
      while from_tower[i] == :e || i == 0 do
        i -= 1
      end
      j = 3
      if to_tower == [:e, :e, :e, :e]
        j = -1
      else
        until to_tower[j] != :e do
          j -= 1
        end
      end
      if i == 0
        puts("Sorry, no disk here")
      else
        if j == -1 || DISCS[from_tower[i]] < DISCS[to_tower[j]]
          to_tower[j+1] = from_tower[i]
          from_tower[i] = :e
        else
          puts("Sorry you can't place a larger disc on a small disc")
        end
      end
    end
  end

  def won?
    @t3 == [:l, :m, :s, :xs]
  end
end

towers = Towers.new

until towers.won?
  towers.show
  f_t = 0
  until [1,2,3].include?(f_t) do
    print("Move from tower 1, 2 or 3: > ")
    f_t = gets.chomp.to_i
  end
  t_t = 0
  until [1,2,3].include?(t_t) do
    print("Move to tower 1, 2 or 3: > ")
    t_t = gets.chomp.to_i
  end
  towers.move(f_t, t_t)
end

puts("You won!")
