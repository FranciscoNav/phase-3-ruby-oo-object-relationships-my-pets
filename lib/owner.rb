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

  def buy_cat(cat)
  end

  def buy_dog(dog)
  end

  def walk_dogs
    if Dog.all.select {|dog| dog.owner == self}
      Dog.all.each{|dog| dog.mood = "happy"}
    end
  end

  def feed_cats
    if Cat.all.select {|cat| cat.owner == self}
    Cat.all.each{|dog| dog.mood = "happy"}
    end
  end

  def sell_pets
  end

  def list_pets
    list = []
    list << cats
    list << dogs
  end  


end