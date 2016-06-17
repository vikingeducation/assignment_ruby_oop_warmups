require 'pry'

def my_reverse(word)
	status = "FAIL"
	message = nil
	data = nil

	if word.is_a?(Integer)
		message = "WRONG_TYPE"
	else
		reverse_word = ''
		(word.size-1).downto(0) {|character|
			reverse_word += word[character]
		}
		data = reverse_word
		status = "SUCCESS"
		message = "WORD_REVERSED"
	end

	data
end

def fibs(sequence_number)
	status = "FAIL"
	message = nil
	data = nil

	sequence = []
	if sequence_number == 0
		sequence << 0
		message = "NUMBER_ADDED"
		status = "SUCCESS"

	elsif sequence_number == 1
		sequence << 0 << 1
		message = "NUMBER_ADDED"
		status = "SUCCESS"

	else
		a = 0
		b = 1
		sequence << a << b
		(sequence_number-2).times do
			c =  a + b
			a,b = b,c
			sequence << c
		end
		message = "NUMBER_ADDED"
		status = "SUCCESS"
	end

	data = sequence
end