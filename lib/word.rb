class Word
  @@words = []
  attr_accessor(:name, :id, :definitions)

  def initialize(attributes)
    @name = attributes[:name]
    @id = @@words.length() + 1
    @definitions = []
  end

  def save
    @@words.push(self)
  end

  def add_definition(definition)
    @definitions.push(definition)
  end

  def self.all
    @@words
  end

  def self.find(id)
    found_word = nil
    @@words.each() do |word|
      if word.id() == id.to_i()
        found_word = word
      end
    end
    return found_word
  end

end
