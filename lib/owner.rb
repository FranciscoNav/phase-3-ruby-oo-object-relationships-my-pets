require 'pry'

class Owner
  attr_reader :name, :species
  attr_accessor :dog, :cat

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    if dogs
      Dog.all.each{|dog| dog.mood = "happy"}
    end
  end

  def feed_cats
    if cats
      Cat.all.each{|cat| cat.mood = "happy"}
    end
  end

  def sell_pets
    if cats
      Cat.all.each do |cat| 
        cat.mood = "nervous"
        cat.clear
      end
    elsif dogs
      Dog.all.each do |dog| 
        dog.mood = "nervous"
        dog.clear
      end
    end
  end

  def list_pets
    # binding.pry
    cat_count = 0
    dog_count = 0
    if cats && dogs
      Cat.all.each{|cat| cat_count += 1}
      Dog.all.each{|dog| dog_count += 1}
    end
    "I have #{cat_count} dog(s), and #{dog_count} cat(s)."
  end  


end