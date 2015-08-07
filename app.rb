require('sinatra')
require('sinatra/reloader')
require('./lib/word_count')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/word_count') do
  @text = params.fetch('text')
  @word = params.fetch('word')
  @answer = @text.word_count(@word)
  erb(:word_count)
end