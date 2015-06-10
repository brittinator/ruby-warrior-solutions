class Player
  attr_reader :warrior, :space, :health_now, :health_then
  
  def play_turn(warrior_object)
    @warrior     = warrior_object
    @space       = warrior.feel
    @health_then = health_now || 20
    @health_now  = warrior.health
    
    warrior.send wat_do
  end
  
  def wat_do
    action = :walk!
    action = :rest!   unless unhurt? || ouch?
    action = :attack! unless space.empty?

    action
  end

  private
  
  def unhurt?
    health_now >= 20
  end
  
  def ouch?
    health_now < health_then
  end
end
