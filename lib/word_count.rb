require('pry')

class String
	define_method(:word_count) do |word|
		word.downcase!()
		new_self = self.downcase()
		count = 0
		output = ""
		contractions = {"\'s" => "is", "\'d" => "would", "\'ve" => "have", "\'re" => "are", "\'m" => "am", "\'ll" => "will", "n't" => "not"}
		contractions.each_key() do |key| 
			if contractions.fetch(key) == word
				new_self = new_self.gsub(key, (" " + contractions.fetch(key)))
			end
		end
		sentence = new_self.gsub(/[,.!?:;()"]/, "").split(" ")
		sentence.each() do |wd|
			if wd == word 
				count += 1
			end
			contractions.each_key() do |contraction|
				if wd == word + contraction
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