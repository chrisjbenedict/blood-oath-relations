require 'pry'
class Follower

  attr_reader :name
  attr_accessor :age, :life_motto

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto

    @@all << self
  end

  # selects all bloodoaths of a follower
  def bloodoaths
    BloodOath.all.select do |bloodoath|
       bloodoath.follower == self
    end
  end

  def cults
    #cult_array = []
    self.bloodoaths.map do |bloodoath|
      bloodoath.cult
    end
  end

  def join_cult (cult)
    if cult.minimum_age > self.age
      print "Youngster, this is an old people cult. Not for you!"
    else
      BloodOath.new(self, cult, Time.new.year)
    end

  end

  def self.of_a_certain_age (age)
    self.all.select do |follower|
      follower.age >= age
    end
  end

  def my_cults_slogans
    self.cults.map do |cult|
      puts cult.slogan
    end
  end

  def self.most_active
    self.all.sort_by do |follower|
      follower.bloodoaths.length
      #binding.pry
    end.last
  end

  def self.top_ten
    self.all.sort_by do |follower|
      follower.bloodoaths.length
      #binding.pry
    end[-10..-1]
  end

  def fellow_cult_members
    fellow_members = self.cults.map do |cult|
      cult.find_all_followers
    end
    fellow_members.flatten.uniq
  end


end #end of Follower class
