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