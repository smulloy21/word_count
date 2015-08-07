class String
	define_method(:word_count) do |word|
		sentence = self.downcase().gsub(/[,.!?]/, "").split(" ")
		small_word = word.downcase()
		count = 0
		output = ""
		sentence.each() do |wd|
			if wd == small_word || wd == small_word + "'s" || wd == small_word + "'d" || wd == small_word + "'ve"
				count += 1
			end
		end
		if count > 0
			if count > 1
				output = "\"" + word.capitalize() + "\" occurs in \"" + self + "\" " + count.to_s + " times."
			else
				output = "\"" + word.capitalize() + "\" occurs in \"" + self + "\" " + count.to_s + " time."
			end
		else
			output = "\"" + word.capitalize() + "\" does not occur in \"" + self + "\""
		end
		output
	end
end