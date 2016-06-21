require './player.rb'

class Game
	def initialize()
	end

	def run
		display_intro
		mode_selection = gets.chomp
		if mode_selection == 'PVC'
			pvc_mode
		elsif mode_selection == 'PVP'
			pvp_mode
		else
			puts "You Didn't choose any correct answers..."
		end
	end

	def check_win(item_player_1,item_player_2)
		winning_combinations = {'rock' => 'scissors','paper' => 'rock','scissors' => 'rock'}
		if winning_combinations[item_player_1] == item_player_2
			return true
		else
			return false
		end
	end

	def display_intro
		"Lets play some Rock, Paper, Scissors. Do you want to play PVP or PVC? (choose PVP or PVC):"
	end

	def display_results(winner,loser,results)
		puts "#{winner.name} is the #{results}.
			\n #{winner.name} Stats.. won: #{winner.total_wins} lost: #{winner.total_losses} tie: #{winner.total_ties}
			\n #{loser.name} Stats.. won: #{loser.total_wins} lost: #{loser.total_losses} tie: #{loser.total_ties}"
	end

	def pvp_mode
		player_1 = Human.new('1')
		player_2 = Human.new('2')
		begin
			puts "0. Rock || 1. Paper || 2. Paper || Q. Quits"
			player_1_selection = gets.chomp

			puts "0. Rock || 1. Paper || 2. Paper || Q. Quits"
			player_2_selection = gets.chomp

			if player_1_selection == 'Q' || player_2_selection == 'Q'
				break
			end

			player_1.choose_item(player_1_selection.to_i)
			player_2.choose_item(player_1_selection.to_i)

			if player_1.item == player_2.item
				player_1.add_tie
				player_2.add_tie
				puts "You Tied..."
			elsif check_win(player_1.item,player_2.item)
				player_1.add_win
				player_2.add_loss
				display_results(player_1,player_2,"winner")
			else
				player_1.add_loss
				player_2.add_win
				display_results(player_2,player_1,"winner")
			end
		end while (player_1_selection != 'Q' || player_1_selection != 'Q')
	end

	def pvc_mode
		player_1 = Human.new('1')
		computer = Computer.new()
		begin
			puts "0. Rock || 1. Paper || 2. Paper || Q. Quits"
			player_1_selection = gets.chomp

			if player_1_selection == 'Q'
				break
			end

			player_1.choose_item(player_1_selection.to_i)
			computer.choose_item

			if player_1.item == computer.item
				player_1.add_tie
				computer.add_tie
				puts "You Tied..."
			elsif check_win(player_1.item,computer.item)
				player_1.add_win
				computer.add_loss
				display_results(player_1,computer,"winner")
			else
				player_1.add_loss
				computer.add_win
				display_results(computer,player_1,"winner")
			end
		end while player_1_selection != 'Q'
	end

end