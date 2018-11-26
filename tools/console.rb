require 'pry'
require_relative '../config/environment.rb'
# require_relative '../follower.rb'
# require_relative './bloodoath.rb'
# require_relative './cult.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#name, location, founding_year, slogan
c1 = Cult.new("Cult McCultster", "Arkansas", 1937, "Eat, laugh, love.")
c2 = Cult.new("Cult MasterFlex", "New Jersey", 1700, "Go Devils!")
c3 =  Cult.new("Bobby Cult and the Culttown players", "Arkansas", 1977, "Get Funky in Here!")

#name, age, life_motto
f1 = Follower.new("Bobby Moigneham", 33, "Party time!")
f2 = Follower.new("Will Ferrel", 48, "More cow bell!")
f3 = Follower.new("Tina Fey", 43, "I'm Sarah Palin.")
f4 = Follower.new("Amy Poehler", 42, "Whatever.")
f5 = Follower.new("Youngy Boystein", 16, "I'm a boy!")

#follower, cult, initiation_date
b1 = BloodOath.new(f1, c1, 1992)
b2 = BloodOath.new(f1, c2, 1993)
b3 = BloodOath.new(f2, c2, 1999)
b4 = BloodOath.new(f2, c1, 1998)
b5 = BloodOath.new(f4, c1, 1999)
b6 = BloodOath.new(f1, c3, 1995)




binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
