class String
	define_method(:word_count) do |word|
		sentence = self.downcase().gsub(/[,.!?]/, "").split(" ")
		small_word = word.downcase()
		count = 0
		output = ""
		sentence.each() do |wd|
			if wd == small_word || wd == small_word + "'s" || wd == small_word + "'d" || wd == small_word + "'ve" || wd == small_word + "'re" || wd == small_word + "'m" || wd == small_word + "'ll"
				count += 1
			end
		end
		if count > 0
			if count > 1
				if count > 2
					output = "occurs " + count.to_s + " times"
				else
					output = "occurs twice"
				end
			else
				output = "occurs once"
			end
		else
			output = "does not occur"
		end
		output
	end
end