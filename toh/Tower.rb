# This is the TOWER module
# Tower will display the player moves
	# populate the towers
		# taking the number of discs
	# display the current status
	# move discs from tower to tower

module Tower


	#populate/display the towers
	def display_towers
		# runs through the hash to print a visual represenation of the towers
		@towers.each { |k, v|

				# lists the tower # and some space for readability
				print "Tower #{k+1}"
				puts  ""
				puts  ""

				# reverse the array to print smallest to largest and iterate through each array item in order to conver to treat each as an integer // otherwise it will treat as an array and ERROR
				v.reverse.each { | n  |

					puts "#{'O' * n }"

				}

				# prints a divider below each tower printout
				print "#{'-' * @num_discs}"

				puts  ""

			}
	end


	#move discs
	def move( to_or_from )

		case to_or_from

		  when "from"

				@disc_being_moved = @towers[ ( @player_move - 1 ) ].pop

		  when "to"

		  	@towers[ ( player_move - 1 ) ] << disc_being_moved

		end

		display_towers

	end



end