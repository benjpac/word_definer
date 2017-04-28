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

    # <img class="float-right" src='<%= @word.image() %>' alt=""> 

get('/word/:id') do
  @word = Word.find(params[:id])
  erb(:word)
end

post('/word/:id') do
  @word = Word.find(params[:id])
  if params[:definition] != nil
    definition = params[:definition]
    new_definition = Definition.new({:definition=> definition})
    @word.add_definition(new_definition)
  end
  if params[:image] != nil
    url = params[:image]
    @word.add_image(url)
  end
  erb(:word)
end
