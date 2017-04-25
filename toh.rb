#!/usr/bin/ruby

require 'pry'

class Towers
  attr_reader :towers, :winning_tower
  attr_accessor :moves

  def initialize(discs)
    @winning_tower = discs.downto(1).to_a
    @towers = (1..3).each_with_object({}) { |n, towers| towers[n] = [] }
    @towers[1] = @winning_tower.dup
    @moves = 0
  end

  def move(from, to)
    if !towers.include?(from)
      puts "Tower #{from} does not exist."
    elsif !towers.include?(to)
      puts "Tower #{to} does not exist."
    elsif from.equal?(to)
      puts "You can't put the same disc where you got it from!"
    elsif tower(to).any? && tower(to).last < tower(from).last
      puts "Invalid move. You can't place a bigger tile on top of a smaller one."
    else
      tower(to) << tower(from).pop
      self.moves += 1
    end
  end

  def over?
    winning_tower == tower(2) || winning_tower == tower(3)
  end

  def tower(number)
    towers[number]
  end
end

puts "How many discs would you like to start with?"
discs = gets.to_i
game = Towers.new(discs)

until game.over?
  puts "Here is how the game board looks right now:"
  game.towers.each { |number, tower| puts "Tower #{number}: #{tower}" }

  puts "Please select tower you want to chose from:"
  from = gets.chomp.to_i
  puts "Please select tower you want to place disc:"
  to = gets.chomp.to_i

  game.move(from, to)
end

puts "Game over! You've won in #{game.moves} moves!"
