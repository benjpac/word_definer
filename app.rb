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

post('/') do
  word = params[:word]
  new_word = Word.new({:word=> word})
  new_word.save()
  @words = Word.all()
  erb(:index)
end
