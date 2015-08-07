class String
	define_method(:word_count) do |word|
		sentence = self.downcase().gsub(/[,.!?:;()"]/, "").split(" ")
		small_word = word.downcase()
		count = 0
		output = ""
		exceptions = ["'s", "'d", "'ve", "'re", "'m", "ll", "n't"]
		sentence.each() do |wd|
			if wd == small_word 
				count += 1
			end
			exceptions.each() do |contraction|
				if wd == small_word + contraction
					count += 1
				end
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