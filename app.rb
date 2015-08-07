require('sinatra')
require('sinatra/reloader')
require('./lib/word_count')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/word_count') do
  @sentence = params.fetch('sentence')
  @word = params.fetch('word')
  @answer = @sentence.anagrams?(@word)
  erb(:word_count)
end