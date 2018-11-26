require 'pry'
class Cult

  attr_reader :name, :founding_year, :minimum_age
  attr_accessor :location, :slogan

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, location, founding_year, slogan, minimum_age = 18)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age

    @@all << self
  end

  def recruit_follower(follower)

    if follower.age < self.minimum_age
      print "Sorry Youngster, you must be this tall to join our cult."
    else
      BloodOath.new(follower, self, Time.new.year)
    end
  end

  def cult_population
    BloodOath.all.select do |bloodoath|
      bloodoath.cult == self
    end.length
  end

  def self.find_by_name(name)
    self.all.find do |cult|
      cult.name == name
    end
  end

  def self.find_by_location (location)
    self.all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year (founding_year)
    self.all.select do |cult|
      cult.founding_year == founding_year
    end
  end

# select all bloodoaths of a cult
  def find_all_bloodoaths
    BloodOath.all.select do |bloodoath|
       bloodoath.cult == self
    end.uniq
  end

# select all followers of the bloodoath array above
  def find_all_followers
    self.find_all_bloodoaths.map do |bloodoath|
      bloodoath.follower
    end.uniq
  end

  def average_age
    age_array = self.find_all_followers.map do |follower|
      follower.age
    end
    age_array.inject(0.0) { |sum, el| sum + el } / age_array.size
  end

  def my_followers_mottos
    self.find_all_followers.map do |follower|
      puts follower.life_motto
    end
  end

  def self.least_popular
    b = self.all.sort_by do |cult|
      cult.cult_population
    end
    b.first
  end

  def self.most_common_location
    self.all.map do |cult|
      cult.location
    end.each_with_object(Hash.new(0)) {
      |m,h| h[m] += 1
    }.sort_by{
      |k,v| v
    }.last[0]
  end



end #end of Cult class
