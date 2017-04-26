#!/usr/bin/ruby

require 'pry'

class Rock_paper_scissors
  attr_reader :options, :player1_choice, :player2_choice, :computer_choice, :number_of_players
  attr_accessor :win

  def initialize(players, p1choice, *p2choice)
    @options = ["rock", "paper", "scissors"]
    @player1_choice = p1choice
    @number_of_players = players

    if @number_of_players == 1
      @player2_choice = @options.sample
    else
      @player2_choice = p2choice[0]
    end

    self.play_game
  end

  def play_game
    @win = 0

    if @number_of_players == 1
      puts "You chose: #{@player1_choice.capitalize}."
      puts "The computer chooses: #{@player2_choice.capitalize}."
    else
      puts "Player 1 chose: #{@player1_choice.capitalize}."
      puts "Player 2 chose: #{@player2_choice.capitalize}."
    end

    case @player1_choice
    when "rock"
      if @player2_choice == "paper"
        @win = 2
      elsif @player2_choice == "scissors"
        @win = 1
      end
    when "paper"
      if @player2_choice == "rock"
        @win = 1
      elsif @player2_choice == "scissors"
        @win = 2
      end
    when "scissors"
      if @player2_choice == "paper"
        @win = 1
      elsif @player2_choice == "rock"
        @win = 2
      end
    end
    self.outcome
  end

  def outcome
    if @number_of_players == 1 && @win == 1
      puts "You win!"
    elsif @number_of_players == 1 && @win == 2
      puts "You lose."
    elsif @number_of_players == 2 && @win == 1
      puts "Player 1 wins!"
    elsif @number_of_players == 2 && @win == 2
      puts "Player 2 wins!"
    else
      puts "The game resulted in a tie."
    end
  end

end

puts "Welcome to Rock, Paper, Scissors!"
p1choice = ""
p2choice = nil
players = 0

until [1, 2].include?(players)
  print "How many players? (1 or 2): "
  players = gets.chomp.to_i
end

until ["rock", "paper", "scissors"].include?(p1choice)
  print "Please make your selection (rock, paper, or scissors): " if players == 1
  print "Player 1, please make your selection (rock, paper, or scissors): " if players == 2
  p1choice = gets.chomp.downcase
end

if players == 2
  until ["rock", "paper", "scissors"].include?(p2choice)
    print "Player 2, please make your selection (rock, paper, or scissors): "
    p2choice = gets.chomp.downcase
  end
end

game = Rock_paper_scissors.new(players, p1choice, p2choice)
