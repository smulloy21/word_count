require('rspec')
require('word_count')

describe('String#word_count')  do 
	it("checks how many instances of a word appear in a string") do
		expect("Can't hurry love".word_count('love')).to(eq("occurs once"))
	end
	it("checks for instances of a word regardless of case") do
		expect("Can't hurry love".word_count("can't")).to(eq("occurs once"))
	end
	it("checks for instances of a word regardless of punctuation") do
		expect("My momma said, you can't hurry love".word_count("said")).to(eq("occurs once"))
	end
	it("reports multiple instances of a word within a string") do
		expect("Yeah, yeah, yeah".word_count("yeah")).to(eq("occurs 3 times"))
	end
	it("reports when no instances of the word are found in the string") do
		expect("Yeah, yeah, yeah".word_count("no")).to(eq("does not occur"))
	end
	it("includes words ending in 's 've and 'd in the count") do
		expect("What's love got to do with it?".word_count("what")).to(eq("occurs once"))
	end
	it("outputs 'twice' when count = 2") do
		expect("What's love got to do, got to do with it?".word_count("do")).to(eq("occurs twice"))
	end
	it("outputs handles contractions") do
		expect("we shouldn't go in there".word_count("should")).to(eq("occurs once"))
	end
end