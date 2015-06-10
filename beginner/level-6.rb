class Player
  attr_reader :warrior, :space, :direction,
              :health_now, :health_then
  
  def play_turn(warrior_object)
    @direction ||= :backward
    @warrior     = warrior_object
    @space       = warrior.feel direction
    @direction   = the_other_way if space.wall?
    @health_then = health_now || 20
    @health_now  = warrior.health
    
    action, direction = wat_do
    if direction
      warrior.send action, direction
    else
      warrior.send action
    end
  end
  
  def wat_do
    action = [:walk!,   direction]
    action = [:rest!]                  unless unhurt? || ouch?
    action = [:attack!, direction]     if     space.enemy?
    action = [:rescue!, direction]     if     space.captive?
    action = [:walk!,   the_other_way] if     retreat?

    action
  end

  private

  def retreat?
    ouch? && nearly_dead?
  end

  def unhurt?
    health_now >= 20
  end
  
  def ouch?
    health_now < health_then
  end

  def nearly_dead?
    health_now < 10
  end

  def the_other_way
    direction == :forward ? :backward : :forward
  end
end
