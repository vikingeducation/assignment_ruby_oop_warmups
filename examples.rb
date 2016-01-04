def my_reverse(s)
	s2 = ""
	for i in (s.length - 1).downto(0)
		s2 << s[i]
	end
	s2
end

puts my_reverse('Blah!')