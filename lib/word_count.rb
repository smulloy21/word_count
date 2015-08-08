class String
	define_method(:word_count) do |word|
		small_word = word.downcase()
		self.downcase!()
		count = 0
		output = ""
		new_self = ""
		contractions = {"'s" => "is", "'d" => "would", "'ve" => "have", "'re" => "are", "'m" => "am", "'ll" => "will", "n't" => "not"}
		if contractions.has_value?(small_word)
			contractions.each_key() do |key| 
				new_self = self.gsub(key, (" " + contractions.fetch(key)))
			end
		else
			new_self = self
		end
		sentence = new_self.gsub(/[,.!?:;()"]/, "").split(" ")
		sentence.each() do |wd|
			if wd == small_word 
				count += 1
			end
			contractions.each_key() do |contraction|
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