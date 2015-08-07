require('rspec')
require('word_count')

describe('String#word_count')  do 
	it("checks how many instances of a word appear in a string") do
		expect("Can't hurry love".word_count('love')).to(eq("'Love' occurs in 'Can't hurry love' 1 time."))
	end
	it("checks for instances of a word regardless of case") do
		expect("Can't hurry love".word_count("can't")).to(eq("'Can't' occurs in 'Can't hurry love' 1 time."))
	end
	it("checks for instances of a word regardless of punctuation") do
		expect("My momma said, you can't hurry love".word_count("said")).to(eq("'Said' occurs in 'My momma said, you can't hurry love' 1 time."))
	end
	it("reports multiple instances of a word within a string") do
		expect("Yeah, yeah, yeah".word_count("yeah")).to(eq("'Yeah' occurs in 'Yeah, yeah, yeah' 3 times."))
	end
	it("reports when no instances of the word are found in the string") do
		expect("Yeah, yeah, yeah".word_count("no")).to(eq("'No' does not occur in 'Yeah, yeah, yeah'"))
	end
end