class BloodOath

  attr_reader :initiation_date, :cult, :follower

  @@all = []

  def self.all
    @@all
  end

  def initialize(follower, cult, initiation_date)
    @follower = follower
    @cult = cult
    @initiation_date = initiation_date

    @@all << self
  end

  def self.first_oath
    self.all.sort_by do |oaths|
      oaths.initiation_date
    end.first.follower
  end




end #end of Follower class
