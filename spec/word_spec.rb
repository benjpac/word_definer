require 'rspec'
require 'word'
require 'definition'

describe(Word) do

  describe('#word') do
    it('return word') do
      new_word = Word.new({:name=> "test"})
      expect(new_word.name()).to eq("test")
    end
  end

  describe('#id') do
    it('returns id') do
      new_word = Word.new({:name=> "test"})
      expect(new_word.id()).to eq(1)
    end
  end

  describe('#save') do
    it('saves word to class variable @@words') do
      new_word = Word.new({:name=> "test"})
      new_word.save()
      expect(Word.all()).to eq([new_word])
    end
  end

  describe('find') do
    it('returns word with id paramenter as string') do
      new_word = Word.new({:name=> "test"})
      new_word.save()
      expect(Word.find("2")).to eq(new_word)
    end
  end

  describe('#add_definition') do
    it('saves definition to array') do
      new_word = Word.new({:name=> "test"})
      new_word.save()
      new_definition = Definition.new({:definition=> "to test"})
      new_word.add_definition(new_definition)
      expect(new_word.definitions()).to eq([new_definition])
    end
  end
end
