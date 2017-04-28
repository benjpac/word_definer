require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/index') do
  word = params[:word]
  new_word = Word.new({:name=> word})
  new_word.save()
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params[:id])
  erb(:word)
end

post('/word/:id') do
  @word = Word.find(params[:id])
  definition = params[:definition]
  new_definition = Definition.new({:definition=> definition})
  @word.add_definition(new_definition)
  erb(:word)
end
