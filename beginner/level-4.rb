class Player
  attr_reader :warrior, :space, :health_now, :health_then
  
  def play_turn(warrior_object)
    @warrior     = warrior_object
    @space       = warrior.feel
    @health_then = health_now || 20
    @health_now  = warrior.health
    
    warrior.send wat_do # <==  one command for every action
    # warrior is the method for warrior made in the attr_reader
    # send is a method that every class object responds to
  end
  
  def wat_do
    # order of priority
    action = :walk! # lowest priority, do this unless you can dom something else
    action = :rest!   unless unhurt? || taking_dmg? # rest unless you're full of health or taking dmg
    action = :attack! unless space.empty?

    action
  end

  private
  
  def unhurt?
    health_now >= 20
  end
  
  def taking_dmg?
    health_now < health_then
  end
end
